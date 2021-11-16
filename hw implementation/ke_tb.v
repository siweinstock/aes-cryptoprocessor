`timescale 1ns/1ns
`include "ke.v"

module ke_tb;
    reg [127:0] key;
    wire [1407:0] expanded;

    ke sched(.key(key), .expanded(expanded));

    initial begin
		$monitor($time, " expanded key is: \n%x", expanded);

        key = 128'h2b7e151628aed2a6abf7158809cf4f3c;
        #10;
		key = 129'h0102030405060708090a0b0c0d0e0f10;
		#10;
    end
endmodule