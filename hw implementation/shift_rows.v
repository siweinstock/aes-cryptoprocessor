module shift_rows (state, state_out);
	input [0:127] state;
	output reg [0:127] state_out;
	wire [0:127] state_out_combi;
	
	// Here is the combinational part
    
	/* row 0 no change */
    assign state_out_combi[0+:8] = state[0+:8];
    assign state_out_combi[32+:8] = state[32+:8];
    assign state_out_combi[64+:8] = state[64+:8];
    assign state_out_combi[96+:8] = state[96+:8];

    /* row 1 , 1 shift left */
    assign state_out_combi [8+:8] = state[40+:8];
    assign state_out_combi [40+:8] = state[72+:8];
    assign state_out_combi [72+:8] = state[104+:8];
    assign state_out_combi [104+:8] = state[8+:8];

    /* row 2 , 2 shifts left */
    assign state_out_combi [16+:8] = state[80+:8];
    assign state_out_combi [48+:8] = state[112+:8];
    assign state_out_combi [80+:8] = state[16+:8];
    assign state_out_combi [112+:8] = state[48+:8];


    /* row 3 , 3 shifts left */
    assign state_out_combi [24+:8] = state[120+:8];
    assign state_out_combi [56+:8] = state[24+:8];
    assign state_out_combi [88+:8] = state[56+:8];
    assign state_out_combi [120+:8] = state[88+:8];
	
	// And here is the sequential
	
	always@(*)
    begin
        state_out <= state_out_combi; // copy the combinational result
    end
	

endmodule