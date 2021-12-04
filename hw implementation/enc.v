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


    reg [127:0] kin0, kin1, kin2, kin3, kin4, kin5, kin6, kin7, kin8, kin9, kin10;
    wire [127:0] kout1, kout2, kout3, kout4, kout5, kout6, kout7, kout8, kout9, kout10;

    reg [127:0] q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10;
    wire vout1, vout2, vout3, vout4, vout5, vout6, vout7, vout8, vout9, vout10;
    reg vin1, vin2, vin3, vin4, vin5, vin6, vin7, vin8, vin9, vin10;

    reg [127:0] state;    

    ke_core kc1(.word_in(kin0), .word_out(kout1), .i(8'd1));
    ke_core kc2(.word_in(kin1), .word_out(kout2), .i(8'd2));
    ke_core kc3(.word_in(kin2), .word_out(kout3), .i(8'd3));
    ke_core kc4(.word_in(kin3), .word_out(kout4), .i(8'd4));
    ke_core kc5(.word_in(kin4), .word_out(kout5), .i(8'd5));
    ke_core kc6(.word_in(kin5), .word_out(kout6), .i(8'd6));
    ke_core kc7(.word_in(kin6), .word_out(kout7), .i(8'd7));
    ke_core kc8(.word_in(kin7), .word_out(kout8), .i(8'd8));
    ke_core kc9(.word_in(kin8), .word_out(kout9), .i(8'd9));
    ke_core kc10(.word_in(kin9), .word_out(kout10), .i(8'd10));

    add_round_key ark0(.state(state), .key(kin0), .state_out(d1), .vin(enable), .vout(vout1));   
    enc_round r1(.state(q1), .key(kin1), .state_out(d2), .vin(vin1), .vout(vout2));
    enc_round r2(.state(q2), .key(kin2), .state_out(d3), .vin(vin2), .vout(vout3));
    enc_round r3(.state(q3), .key(kin3), .state_out(d4), .vin(vin3), .vout(vout4));
    enc_round r4(.state(q4), .key(kin4), .state_out(d5), .vin(vin4), .vout(vout5));
    enc_round r5(.state(q5), .key(kin5), .state_out(d6), .vin(vin5), .vout(vout6));
    enc_round r6(.state(q6), .key(kin6), .state_out(d7), .vin(vin6), .vout(vout7));
    enc_round r7(.state(q7), .key(kin7), .state_out(d8), .vin(vin7), .vout(vout8));
    enc_round r8(.state(q8), .key(kin8), .state_out(d9), .vin(vin8), .vout(vout9));
    enc_round r9(.state(q9), .key(kin9), .state_out(d10), .vin(vin9), .vout(vout10));
    enc_round_no_mc r10(.state(q10), .key(kin10), .state_out(ciphertext), .vin(vin10), .vout(valid_out));

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

        kin0 <= key;
        kin1 <= kout1;
        kin2 <= kout2;
        kin3 <= kout3;
        kin4 <= kout4;
        kin5 <= kout5;
        kin6 <= kout6;
        kin7 <= kout7;
        kin8 <= kout8;
        kin9 <= kout9;
        kin10 <= kout10;

        //valid <= (^d10 === 1'bx) ? 0 : 1;
    end

endmodule;