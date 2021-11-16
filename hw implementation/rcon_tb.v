`timescale 1ns/1ns
`include "rcon.v"

module rcon_tb;

    reg [7:0] i;
    wire [7:0] o;

    rcon rc(.i(i), .o(o));

    initial begin
		$monitor($time, ": rcon[%x]=%x", i, o);

        for (i=0; i<12; i++) begin
            #5;
        end
    
    end
    
    
endmodule