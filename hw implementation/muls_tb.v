`timescale 1ns/1ns
`include "muls.v"

module muls_tb;
    reg [7:0] i;
    wire [7:0] o;

    mul3 m3(.i(i), .o(o));

    initial begin
		$monitor($time, ": mul3[%x]=%x", i, o);
		
        for (i=0; i<255; i++) begin
            #1;
        end

    end

endmodule