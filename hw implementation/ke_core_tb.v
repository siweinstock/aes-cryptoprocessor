`timescale 1ns/1ns
`include "ke_core.v"

module ke_core_tb;
    reg [127:0] word_in;
    wire [127:0] word_out;
    reg [7:0] i;
    
    ke_core kc(.word_in(word_in), .word_out(word_out), .i(i));

    initial begin
        $dumpfile("ke_core_tb.vcd");
        $dumpvars(0, ke_core_tb);

        i=1;
        word_in = 128'h2b7e151628aed2a6abf7158809cf4f3c;
        #40;


    end
    
endmodule