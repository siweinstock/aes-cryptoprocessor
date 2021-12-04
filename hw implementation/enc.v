`include "enc_round.v"
// `include "ke_core.v"


module enc(clk, plaintext, key, ciphertext, enable, valid_out);
    input clk;
    input [127:0] plaintext;
    input [127:0] key;
    // input valid_in;
    output [127:0] ciphertext;
    input enable;
    output valid_out;

    wire [127:0] d1, d2, d3, d4, d5, d6, d7, d8, d9, d10;
    wire [127:0] k1, k2, k3, k4, k5, k6, k7, k8, k9, k10;
    // reg valid;

    reg [127:0] q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10;
    wire vout1, vout2, vout3, vout4, vout5, vout6, vout7, vout8, vout9, vout10;
    reg vin1, vin2, vin3, vin4, vin5, vin6, vin7, vin8, vin9, vin10;

    reg [127:0] state;    

    add_round_key ark0(.state(state), .key(key), .state_out(d1), .vin(enable), .vout(vout1));
    ke_core kc1(.word_in(key), .word_out(k1), .i(8'd1));

    enc_round r1(.state(q1), .key(k1), .state_out(d2), .vin(vin1), .vout(vout2));
    ke_core kc2(.word_in(k1), .word_out(k2), .i(8'd2));

    enc_round r2(.state(q2), .key(k2), .state_out(d3), .vin(vin2), .vout(vout3));
    ke_core kc3(.word_in(k2), .word_out(k3), .i(8'd3));

    enc_round r3(.state(q3), .key(k3), .state_out(d4), .vin(vin3), .vout(vout4));
    ke_core kc4(.word_in(k3), .word_out(k4), .i(8'd4));

    enc_round r4(.state(q4), .key(k4), .state_out(d5), .vin(vin4), .vout(vout5));
    ke_core kc5(.word_in(k4), .word_out(k5), .i(8'd5));

    enc_round r5(.state(q5), .key(k5), .state_out(d6), .vin(vin5), .vout(vout6));
    ke_core kc6(.word_in(k5), .word_out(k6), .i(8'd6));

    enc_round r6(.state(q6), .key(k6), .state_out(d7), .vin(vin6), .vout(vout7));
    ke_core kc7(.word_in(k6), .word_out(k7), .i(8'd7));

    enc_round r7(.state(q7), .key(k7), .state_out(d8), .vin(vin7), .vout(vout8));
    ke_core kc8(.word_in(k7), .word_out(k8), .i(8'd8));

    enc_round r8(.state(q8), .key(k8), .state_out(d9), .vin(vin8), .vout(vout9));
    ke_core kc9(.word_in(k8), .word_out(k9), .i(8'd9));

    enc_round r9(.state(q9), .key(k9), .state_out(d10), .vin(vin9), .vout(vout10));
    ke_core kc10(.word_in(k9), .word_out(k10), .i(8'd10));

    enc_round_no_mc r10(.state(q10), .key(k10), .state_out(ciphertext), .vin(vin10), .vout(valid_out));

    always @(posedge clk) begin
        state <= plaintext;
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

        vin1 <= vout1;
        vin2 <= vout2;
        vin3 <= vout3;
        vin4 <= vout4;
        vin5 <= vout5;
        vin6 <= vout6;
        vin7 <= vout7;
        vin8 <= vout8;
        vin9 <= vout9;
        vin10 <= vout10;

        //valid <= (^d10 === 1'bx) ? 0 : 1;
    end

endmodule;