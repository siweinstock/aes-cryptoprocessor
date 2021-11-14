`timescale 1ns/1ns
`include "ke.v"

module ke_tb;
    reg [127:0] key;
    wire [1407:0] expanded;

    ke sched(.key(key), .expanded(expanded));

    initial begin
        $dumpfile("ke_tb.vcd");
        $dumpvars(0, ke_tb);

        key = 128'h2b7e151628aed2a6abf7158809cf4f3c;
        #10;
    end
endmodule