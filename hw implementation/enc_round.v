`include "shift_rows.v"
`include "sub_bytes.v"
`include "add_round_key.v"
`include "mix_cols.v"


module enc_round (state, key, state_out);
	input [127:0] state;
	input [127:0] key;
	output reg [127:0] state_out;
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
    end
	

endmodule

module enc_round_no_mc (state, key, state_out);
	input [127:0] state;
	input [127:0] key;
	output reg [127:0] state_out;
	wire [127:0] state_out_temp0;
	wire [127:0] state_out_temp1;
    wire [127:0] state_out_temp2;
	

    sub_bytes sb(.state(state), .state_out(state_out_temp0));
    shift_rows sr(.state(state_out_temp0), .state_out(state_out_temp1));
    add_round_key ark(.state(state_out_temp1), .key(key), .state_out(state_out_temp2));
	
	
	always@(*)
    begin
        state_out <= state_out_temp2;
    end
	

endmodule