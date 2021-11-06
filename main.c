#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "luts.h"

#define ROUND_NUM 10
#define BLK_SIZE 16

// convert plaintext representing a hex number to its hex representation
void str2hex(const char* str, uint8_t* hex) {
    char tmp[2];
    int i;

    for (i=0; i<16; i++) {
        tmp[0] = str[2*i];
        tmp[1] = str[2*i+1];
        hex[i] = strtol(tmp, NULL, 16);
    }
}


//  pad message to be of length divisible by 16
uint8_t* pad_message(char* msg, int* len) {
    *len = (int)(strlen(msg)%BLK_SIZE == 0 ? strlen(msg)/2 : (strlen(msg)/BLK_SIZE+1)*BLK_SIZE/2);
    uint8_t* padded = (uint8_t*) calloc(*len, sizeof(uint8_t));
    str2hex(msg, padded);
    return padded;
}

// left rotate array by 1.
// helper function for key_expansion()
void rotate(uint8_t* word, int n) {
    uint8_t first = word[0];
    for (int i=1; i<n; i++) {
        word[i-1] = word[i];
    }
    word[n-1] = first;
}

// apply non-linear transformation to state according to s-box
// helper function for key_expansion()
void substitute(uint8_t* word, int n, int it_num) {
    for (int i=0; i<n; i++) {
        word[i] = s_box[word[i]];
    }

    word[0] ^= rcon[it_num];
}

// xor Wn-1 with Wn-4 to calculate Wn
// helper function for key_expansion()
void xor(const uint8_t* w1, const uint8_t* w4 , uint8_t* res, int n) {
    for (int i=0; i<n; i++) {
        res[i] = w1[i] ^ w4[i];
    }
}

//
void key_expansion(const uint8_t* key, uint8_t* expanded) {
    uint8_t prev1[4];  // Wn-1
    uint8_t prev4[4];  // Wn-4
    uint8_t res[4];
    int w;
    int it_num = 1;

    // first 4 words are identical
    for (w=0; w<4; w++) {
        memcpy(expanded+4*w, (uint8_t [4]){key[4*w], key[4*w+1], key[4*w+2], key[4*w+3]}, 4*sizeof(uint8_t));
    }
    memcpy(res, (uint8_t [4]){key[4 * (w - 1)], key[4 * (w - 1) + 1], key[4 * (w - 1) + 2], key[4 * (w - 1) + 3]}, 4 * sizeof(uint8_t));

    for (; w<44; w++) {
        memcpy(prev1, res, 4 * sizeof(uint8_t));
        // Wn-4
        memcpy(prev4, (uint8_t [4]){expanded[4 * (w - 4)], expanded[4 * (w - 4) + 1], expanded[4 * (w - 4) + 2], expanded[4 * (w - 4) + 3]}, 4 * sizeof(uint8_t));

        if (w % 4 == 0) {
            rotate(prev1, 4);
            substitute(prev1, 4, it_num++);
        }

        // res = Wn-1 + Wn-4
        xor(prev1, prev4, res, 4);
        memcpy(expanded+4*w, (uint8_t [4]){res[0], res[1], res[2], res[3]}, 4*sizeof(uint8_t));

    }
}

void add_round_key(uint8_t* state, const uint8_t* key) {
    int i;

    for (i=0; i<BLK_SIZE; i++) {
        state[i] ^= key[i];
    }
}

void sub_bytes(uint8_t* state) {
    int i;
    for (i=0; i<BLK_SIZE; i++) {
        state[i] = s_box[state[i]];
    }
}

void shift_rows(uint8_t* state) {
    uint8_t tmp[BLK_SIZE];
    memcpy(tmp, state, BLK_SIZE* sizeof(uint8_t));
    int i, j;

    for (j=0; j<4; j++) {
        for (i = 0; i < 4; i++) {
            tmp[4 * j + i] = state[(4 * j + 5 * i) % BLK_SIZE];
        }
    }

    memcpy(state, tmp, BLK_SIZE* sizeof(uint8_t));

}

void mix_columns(uint8_t* state) {
    uint8_t tmp[BLK_SIZE];
    int i, j;

    for (j=0; j<4; j++) {
        for (i = 0; i < 4; i++) {
            tmp[i+4*j] = mul2[state[(i % 4)+4*j]] ^ mul3[state[(i + 1) % 4+4*j]] ^ state[(i + 2) % 4+4*j] ^ state[(i + 3) % 4+4*j];
//            printf("%d: 2(%d) 3(%d) 1(%d) 1(%d)\n", i+4*j, (i % 4)+4*j, (i + 1) % 4+4*j, (i + 2) % 4+4*j, (i + 3) % 4+4*j);
        }
    }
    memcpy(state, tmp, BLK_SIZE* sizeof(uint8_t));
}

// encrypt a single block
void encrypt(uint8_t* message, uint8_t* key) {
    uint8_t state[BLK_SIZE];
    int i;

    memcpy(state, message, BLK_SIZE* sizeof(uint8_t));

    add_round_key(state, key);

    for (i=0; i<ROUND_NUM; i++) {
        sub_bytes(state);
        shift_rows(state);
        if (i != ROUND_NUM-1) {
            mix_columns(state);
        }
        add_round_key(state, key+BLK_SIZE*(i+1));
    }

    memcpy(message, state, BLK_SIZE);

}


int main(int argc, char* argv[]) {
    uint8_t key[16], expanded[176];
    int i;

    // parse key from input to array
    str2hex(argv[1], key);

    // pad message with zeros to reach a length divisible by 16 (and convert str to hex values)
    int len;
    unsigned char* padded = pad_message(argv[2], &len);

    key_expansion(key, expanded);

    for (i=0; i<len; i+=BLK_SIZE) {
        encrypt(padded+i, expanded);
    }

    printf("plaintext:  %s\nciphertext: ", argv[2]);
    for (i=0; i<len; i++) {
        printf("%02x", padded[i]);
    }

    return 0;
}
