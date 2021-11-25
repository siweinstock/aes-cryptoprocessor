module add_round_key (state, key, state_out);
	input [127:0] state;
	input [127:0] key;
	output reg [127:0] state_out;
	wire [127:0] state_out_combi;
	
	// Here is the combinational part
	genvar i;
	for (i=0 ;i<=15; i=i+1)
        assign state_out_combi[i*8 +: 8] = key[i*8  +:  8] ^ state[i*8  +:  8]; // We do bitwise xor on each byte
	
	// And here is the sequential
	
	always@(*)
    begin
        state_out <= state_out_combi; // copy the combinational result
    end
	

endmodule