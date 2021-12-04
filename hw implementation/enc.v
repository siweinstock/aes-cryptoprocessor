`include "enc_round.v"


module enc(clk, plaintext, exp_key, ciphertext, enable, valid);
    input clk;
    input [127:0] plaintext;
    input [1407:0] exp_key;
    output [127:0] ciphertext;
    input enable;
    output reg valid;

    wire [127:0] d1, d2, d3, d4, d5, d6, d7, d8, d9, d10;
    reg [127:0] q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10;
    reg [127:0] state;    

    add_round_key ark0(.state(state), .key(exp_key[1407:1280]), .state_out(d1));
    enc_round r1(.state(q1), .key(exp_key[1279:1152]), .state_out(d2));
    enc_round r2(.state(q2), .key(exp_key[1151:1024]), .state_out(d3));
    enc_round r3(.state(q3), .key(exp_key[1023:896]), .state_out(d4));
    enc_round r4(.state(q4), .key(exp_key[895:768]), .state_out(d5));
    enc_round r5(.state(q5), .key(exp_key[767:640]), .state_out(d6));
    enc_round r6(.state(q6), .key(exp_key[639:512]), .state_out(d7));
    enc_round r7(.state(q7), .key(exp_key[511:384]), .state_out(d8));
    enc_round r8(.state(q8), .key(exp_key[383:256]), .state_out(d9));
    enc_round r9(.state(q9), .key(exp_key[255:128]), .state_out(d10));
    enc_round_no_mc r10(.state(q10), .key(exp_key[127:0]), .state_out(ciphertext));

    always @(posedge clk) begin
        if (enable) begin
            state <= plaintext;
        end
        else begin
            state <= 128'hx;
        end
        q1 <= d1;
        q2 <= d2;
        q3 <= d3;
        q4 <= d4;        
        q5 <= d5;
        q6 <= d6;
        q7 <= d7;
        q8 <= d8;
        q9 <= d9;
        q10 <= d10;

        valid <= (^d10 === 1'bx) ? 0 : 1;
    end

endmodule;