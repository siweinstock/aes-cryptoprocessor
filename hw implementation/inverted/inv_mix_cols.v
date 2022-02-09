`include "muls.v"

module inv_mix_cols (state, mixed);
    input [127:0] state;
    output [127:0] mixed;

    reg [127:0] mixed;
    wire [127:0] tmp14;
    wire [127:0] tmp11;
    wire [127:0] tmp13;
    wire [127:0] tmp9;

mul14 m14_0(state[127:120], tmp14[127:120]);
mul14 m14_1(state[119:112], tmp14[119:112]);
mul14 m14_2(state[111:104], tmp14[111:104]);
mul14 m14_3(state[103:96], tmp14[103:96]);
mul14 m14_4(state[95:88], tmp14[95:88]);
mul14 m14_5(state[87:80], tmp14[87:80]);
mul14 m14_6(state[79:72], tmp14[79:72]);
mul14 m14_7(state[71:64], tmp14[71:64]);
mul14 m14_8(state[63:56], tmp14[63:56]);
mul14 m14_9(state[55:48], tmp14[55:48]);
mul14 m14_10(state[47:40], tmp14[47:40]);
mul14 m14_11(state[39:32], tmp14[39:32]);
mul14 m14_12(state[31:24], tmp14[31:24]);
mul14 m14_13(state[23:16], tmp14[23:16]);
mul14 m14_14(state[15:8], tmp14[15:8]);
mul14 m14_15(state[7:0], tmp14[7:0]);

mul11 m11_0(state[127:120], tmp11[127:120]);
mul11 m11_1(state[119:112], tmp11[119:112]);
mul11 m11_2(state[111:104], tmp11[111:104]);
mul11 m11_3(state[103:96], tmp11[103:96]);
mul11 m11_4(state[95:88], tmp11[95:88]);
mul11 m11_5(state[87:80], tmp11[87:80]);
mul11 m11_6(state[79:72], tmp11[79:72]);
mul11 m11_7(state[71:64], tmp11[71:64]);
mul11 m11_8(state[63:56], tmp11[63:56]);
mul11 m11_9(state[55:48], tmp11[55:48]);
mul11 m11_10(state[47:40], tmp11[47:40]);
mul11 m11_11(state[39:32], tmp11[39:32]);
mul11 m11_12(state[31:24], tmp11[31:24]);
mul11 m11_13(state[23:16], tmp11[23:16]);
mul11 m11_14(state[15:8], tmp11[15:8]);
mul11 m11_15(state[7:0], tmp11[7:0]);

mul13 m13_0(state[127:120], tmp13[127:120]);
mul13 m13_1(state[119:112], tmp13[119:112]);
mul13 m13_2(state[111:104], tmp13[111:104]);
mul13 m13_3(state[103:96], tmp13[103:96]);
mul13 m13_4(state[95:88], tmp13[95:88]);
mul13 m13_5(state[87:80], tmp13[87:80]);
mul13 m13_6(state[79:72], tmp13[79:72]);
mul13 m13_7(state[71:64], tmp13[71:64]);
mul13 m13_8(state[63:56], tmp13[63:56]);
mul13 m13_9(state[55:48], tmp13[55:48]);
mul13 m13_10(state[47:40], tmp13[47:40]);
mul13 m13_11(state[39:32], tmp13[39:32]);
mul13 m13_12(state[31:24], tmp13[31:24]);
mul13 m13_13(state[23:16], tmp13[23:16]);
mul13 m13_14(state[15:8], tmp13[15:8]);
mul13 m13_15(state[7:0], tmp13[7:0]);

mul9 m9_0(state[127:120], tmp9[127:120]);
mul9 m9_1(state[119:112], tmp9[119:112]);
mul9 m9_2(state[111:104], tmp9[111:104]);
mul9 m9_3(state[103:96], tmp9[103:96]);
mul9 m9_4(state[95:88], tmp9[95:88]);
mul9 m9_5(state[87:80], tmp9[87:80]);
mul9 m9_6(state[79:72], tmp9[79:72]);
mul9 m9_7(state[71:64], tmp9[71:64]);
mul9 m9_8(state[63:56], tmp9[63:56]);
mul9 m9_9(state[55:48], tmp9[55:48]);
mul9 m9_10(state[47:40], tmp9[47:40]);
mul9 m9_11(state[39:32], tmp9[39:32]);
mul9 m9_12(state[31:24], tmp9[31:24]);
mul9 m9_13(state[23:16], tmp9[23:16]);
mul9 m9_14(state[15:8], tmp9[15:8]);
mul9 m9_15(state[7:0], tmp9[7:0]);

    always @(*) begin
        mixed[127:120] = tmp14[127:120] ^ tmp11[119:112] ^ tmp13[111:104] ^ tmp9[103:96];
        mixed[119:112] = tmp14[119:112] ^ tmp11[111:104] ^ tmp13[103:96] ^ tmp9[127:120];
        mixed[111:104] = tmp14[111:104] ^ tmp11[103:96] ^ tmp13[127:120] ^ tmp9[119:112];
        mixed[103:96] = tmp14[103:96] ^ tmp11[127:120] ^ tmp13[119:112] ^ tmp9[111:104];
        
        mixed[95:88] = tmp14[95:88] ^ tmp11[87:80] ^ tmp13[79:72] ^ tmp9[71:64];
        mixed[87:80] = tmp14[87:80] ^ tmp11[79:72] ^ tmp13[71:64] ^ tmp9[95:88];
        mixed[79:72] = tmp14[79:72] ^ tmp11[71:64] ^ tmp13[95:88] ^ tmp9[87:80];
        mixed[71:64] = tmp14[71:64] ^ tmp11[95:88] ^ tmp13[87:80] ^ tmp9[79:72];

        mixed[63:56] = tmp14[63:56] ^ tmp11[55:48] ^ tmp13[47:40] ^ tmp9[39:32];
        mixed[55:48] = tmp14[55:48] ^ tmp11[47:40] ^ tmp13[39:32] ^ tmp9[63:56];
        mixed[47:40] = tmp14[47:40] ^ tmp11[39:32] ^ tmp13[63:56] ^ tmp9[55:48];
        mixed[39:32] = tmp14[39:32] ^ tmp11[63:56] ^ tmp13[55:48] ^ tmp9[47:40];

        mixed[31:24] = tmp14[31:24] ^ tmp11[23:16] ^ tmp13[15:8] ^ tmp9[7:0];
        mixed[23:16] = tmp14[23:16] ^ tmp11[15:8] ^ tmp13[7:0] ^ tmp9[31:24];
        mixed[15:8] = tmp14[15:8] ^ tmp11[7:0] ^ tmp13[31:24] ^ tmp9[23:16];
        mixed[7:0] = tmp14[7:0] ^ tmp11[31:24] ^ tmp13[23:16] ^ tmp9[15:8];
    end

endmodule