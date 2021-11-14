`timescale 1ns/1ns
`include "rcon.v"

module rcon_tb;

    reg [7:0] i;
    wire [7:0] o;

    reg [31:0] test;
    reg [31:0] demo;

    rcon rc(.i(i), .o(o));

    initial begin
        $dumpfile("rcon_tb.vcd");
        $dumpvars(0, rcon_tb);

        demo = 32'ha0fafe17;

        for (i=0; i<12; i++) begin
            $display(i);
            test = demo ^ o;
            #5;
        end

        #5;
        $display("Done");
        $finish; 
    
    end
    
    
endmodule