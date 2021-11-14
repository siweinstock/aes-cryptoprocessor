`timescale 1ns/1ns
`include "sbox.v"

module sbox_tb;
    reg [7:0] i;
    wire [7:0] o;

    sbox sb(.i(i), .o(o));

    initial begin
        $dumpfile("sbox_tb.vcd");
        $dumpvars(0, sbox_tb);

        for (i=0; i<255; i++) begin
            $display(i);
            #5;
        end

        #5;
        $display("Done");
        $finish;        
    end

endmodule