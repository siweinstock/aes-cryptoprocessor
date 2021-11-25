`include "sbox.v"

module sub_bytes (state, state_out);
	input [127:0] state;
	output reg [127:0] state_out;
    wire [127:0] state_out_combi;

	// Here is the combinational part
	genvar itr;
	generate
		for (itr = 0 ; itr < 128; itr = itr+8)
					sbox s(.i(state[itr +:8]), .o(state_out_combi[itr +:8])); // translating each byte using sbox
	endgenerate

    // And here is the sequential
	
	always@(*)
    begin
        state_out <= state_out_combi; // copy the combinational result
    end


endmodule