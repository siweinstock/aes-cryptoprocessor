`include "sbox.v"
`include "rcon.v"

module ke_core (word_in, word_out, i);
    input [127:0] word_in;
    input [7:0] i;
    output [127:0] word_out;
    
    reg [31:0] wi;
    wire [31:0] wo;
    reg [31:0] wo_reg;
    reg [31:0] rot;     // rotated last word

    reg [127:0] tmp;
    reg [7:0] ii;
    wire [7:0] rc;


    // sbox for a word
    sbox s0(.i(wi[7:0]), .o(wo[7:0]));
    sbox s1(.i(wi[15:8]), .o(wo[15:8]));
    sbox s2(.i(wi[23:16]), .o(wo[23:16]));
    sbox s3(.i(wi[31:24]), .o(wo[31:24]));


    rcon r0(ii, rc);


    always @(*) begin
        // rotate
        rot[31:0] = {word_in[23:0], word_in[31:24]};

        // substitute Wn-1
        wi = rot;

        ii = i;

        wo_reg = wo;
        // Wn = Wn-4 ^ subst(Wn-1) ^ rcon[i]
        tmp[127:96] = word_in[127:96] ^  wo_reg ^ {rc, {24{1'b0}}};

        // Wn = Wn-1 ^ Wn-4
        tmp[95:64] = word_in[95:64] ^  tmp[127:96];
        tmp[63:32] = word_in[63:32] ^ tmp[95:64];
        tmp[31:0] = word_in[31:0] ^ tmp[63:32];

    end

    assign word_out = tmp;
    
endmodule