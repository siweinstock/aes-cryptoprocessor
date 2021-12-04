`include "enc.v"

module enc_tb;
    reg [127:0] plaintext;
    reg [127:0] key;
    reg enable;
    
    wire valid;
    wire [127:0] ciphertext;
    reg clk;

    enc uut(.clk(clk), .plaintext(plaintext), .key(key), .ciphertext(ciphertext), .enable(enable), .valid_out(valid));

    initial begin
        $dumpfile("enc_tb.vcd");
        $dumpvars(0, enc_tb);

        clk = 1;
        enable = 1;
        plaintext = 128'h6bc1bee22e409f96e93d7e117393172a;
        key = 1408'h2b7e151628aed2a6abf7158809cf4f3c;
        #10;
        enable = 0;
        plaintext = 128'hae2d8a571e03ac9c9eb76fac45af8e51;
        #10;
        plaintext = 128'h30c81c46a35ce411e5fbc1191a0a52ef;
        #10;
        enable = 1;
        plaintext = 128'hf69f2445df4f9b17ad2b417be66c3710;
        #10;
        enable = 0;
        plaintext = 128'h0;
        #200;
        
        $finish;

    end

    always #5 clk = ~clk;


endmodule;