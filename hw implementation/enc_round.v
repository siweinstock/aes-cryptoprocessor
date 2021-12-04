`include "shift_rows.v"
`include "sub_bytes.v"
`include "add_round_key.v"
`include "mix_cols.v"
`include "rcon.v"


module enc_round (state, key, state_out, vin, vout);
	input [127:0] state;
	input [127:0] key;
    input vin;
	output reg [127:0] state_out;
    output reg vout = 0;

	wire [127:0] state_out_temp0;
	wire [127:0] state_out_temp1;
    wire [127:0] state_out_temp2;
    wire [127:0] state_out_temp3;

    sub_bytes sb(.state(state), .state_out(state_out_temp0));
    shift_rows sr(.state(state_out_temp0), .state_out(state_out_temp1));
    mix_cols mc(.state(state_out_temp1), .mixed(state_out_temp2));
    add_round_key ark(.state(state_out_temp2), .key(key), .state_out(state_out_temp3));
	
	
	always@(*)
    begin
        state_out <= state_out_temp3;
        vout <= vin;
    end
	

endmodule

module enc_round_no_mc (state, key, state_out, vin, vout);
	input [127:0] state;
	input [127:0] key;
    input vin;
	output reg [127:0] state_out;
    output reg vout = 0;

	wire [127:0] state_out_temp0;
	wire [127:0] state_out_temp1;
    wire [127:0] state_out_temp2;
	

    sub_bytes sb(.state(state), .state_out(state_out_temp0));
    shift_rows sr(.state(state_out_temp0), .state_out(state_out_temp1));
    add_round_key ark(.state(state_out_temp1), .key(key), .state_out(state_out_temp2));
	
	
	always@(*)
    begin
        state_out <= state_out_temp2;
        vout <= vin;
        // vout <= (vin === 1'bx) ? 1'b0 : vin;
    end
	

endmodule


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