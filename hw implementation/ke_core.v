`include "sbox.v"
`include "rcon.v"

module ke_core (word_in, word_out, i);
    input [127:0] word_in;      
    input [7:0] i;              // iteration num
    output [127:0] word_out;
    
    wire [31:0] wo;     // wire to drive sbox output
    reg [127:0] tmp;    // reg to temporarily hold output
    wire [7:0] rc;      // rcon output


    // sbox for a word (indices include rotation)
    sbox s0(.i(word_in[31:24]), .o(wo[7:0]));
    sbox s1(.i(word_in[7:0]), .o(wo[15:8]));
    sbox s2(.i(word_in[15:8]), .o(wo[23:16]));
    sbox s3(.i(word_in[23:16]), .o(wo[31:24]));

    // rcon lookup
    rcon r0(i, rc);

    always @(*) begin
        // for 1st word
        // Wn = Wn-4 ^ subst(Wn-1) ^ rcon[i]
        tmp[127:96] = word_in[127:96] ^  wo ^ {rc, {24{1'b0}}};

        // for all other words
        // Wn = Wn-1 ^ Wn-4
        tmp[95:64] = word_in[95:64] ^  tmp[127:96];
        tmp[63:32] = word_in[63:32] ^ tmp[95:64];
        tmp[31:0] = word_in[31:0] ^ tmp[63:32];

    end

    assign word_out = tmp;
    
endmodule
