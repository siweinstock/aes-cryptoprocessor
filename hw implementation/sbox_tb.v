`timescale 1ns/1ns
`include "sbox.v"

module sbox_tb;
    reg [7:0] i;
    wire [7:0] o;

    sbox sb(.i(i), .o(o));

    initial begin
		$monitor($time, ": sbox[%x]=%x", i, o);
		
        for (i=0; i<255; i++) begin
            #1;
        end

    end

endmodule