`include "muls.v"

module mix_cols (state, mixed);
    input [127:0] state;
    output [127:0] mixed;

    reg [127:0] mixed;
    wire [127:0] tmp2;
    wire [127:0] tmp3;

mul2 m2_0(state[127:120], tmp2[127:120]);
mul2 m2_1(state[119:112], tmp2[119:112]);
mul2 m2_2(state[111:104], tmp2[111:104]);
mul2 m2_3(state[103:96], tmp2[103:96]);
mul2 m2_4(state[95:88], tmp2[95:88]);
mul2 m2_5(state[87:80], tmp2[87:80]);
mul2 m2_6(state[79:72], tmp2[79:72]);
mul2 m2_7(state[71:64], tmp2[71:64]);
mul2 m2_8(state[63:56], tmp2[63:56]);
mul2 m2_9(state[55:48], tmp2[55:48]);
mul2 m2_10(state[47:40], tmp2[47:40]);
mul2 m2_11(state[39:32], tmp2[39:32]);
mul2 m2_12(state[31:24], tmp2[31:24]);
mul2 m2_13(state[23:16], tmp2[23:16]);
mul2 m2_14(state[15:8], tmp2[15:8]);
mul2 m2_15(state[7:0], tmp2[7:0]);

mul3 m3_0(state[127:120], tmp3[127:120]);
mul3 m3_1(state[119:112], tmp3[119:112]);
mul3 m3_2(state[111:104], tmp3[111:104]);
mul3 m3_3(state[103:96], tmp3[103:96]);
mul3 m3_4(state[95:88], tmp3[95:88]);
mul3 m3_5(state[87:80], tmp3[87:80]);
mul3 m3_6(state[79:72], tmp3[79:72]);
mul3 m3_7(state[71:64], tmp3[71:64]);
mul3 m3_8(state[63:56], tmp3[63:56]);
mul3 m3_9(state[55:48], tmp3[55:48]);
mul3 m3_10(state[47:40], tmp3[47:40]);
mul3 m3_11(state[39:32], tmp3[39:32]);
mul3 m3_12(state[31:24], tmp3[31:24]);
mul3 m3_13(state[23:16], tmp3[23:16]);
mul3 m3_14(state[15:8], tmp3[15:8]);
mul3 m3_15(state[7:0], tmp3[7:0]);



    always @(*) begin
        mixed[127:120] = tmp2[127:120] ^ tmp3[119:112] ^ state[111:104] ^ state[103:96];
        mixed[119:112] = tmp2[119:112] ^ tmp3[111:104] ^ state[103:96] ^ state[127:120];
        mixed[111:104] = tmp2[111:104] ^ tmp3[103:96] ^ state[127:120] ^ state[119:112];
        mixed[103:96] = tmp2[103:96] ^ tmp3[127:120] ^ state[119:112] ^ state[111:104];
        
        mixed[95:88] = tmp2[95:88] ^ tmp3[87:80] ^ state[79:72] ^ state[71:64];
        mixed[87:80] = tmp2[87:80] ^ tmp3[79:72] ^ state[71:64] ^ state[95:88];
        mixed[79:72] = tmp2[79:72] ^ tmp3[71:64] ^ state[95:88] ^ state[87:80];
        mixed[71:64] = tmp2[71:64] ^ tmp3[95:88] ^ state[87:80] ^ state[79:72];

        mixed[63:56] = tmp2[63:56] ^ tmp3[55:48] ^ state[47:40] ^ state[39:32];
        mixed[55:48] = tmp2[55:48] ^ tmp3[47:40] ^ state[39:32] ^ state[63:56];
        mixed[47:40] = tmp2[47:40] ^ tmp3[39:32] ^ state[63:56] ^ state[55:48];
        mixed[39:32] = tmp2[39:32] ^ tmp3[63:56] ^ state[55:48] ^ state[47:40];

        mixed[31:24] = tmp2[31:24] ^ tmp3[23:16] ^ state[15:8] ^ state[7:0];
        mixed[23:16] = tmp2[23:16] ^ tmp3[15:8] ^ state[7:0] ^ state[31:24];
        mixed[15:8] = tmp2[15:8] ^ tmp3[7:0] ^ state[31:24] ^ state[23:16];
        mixed[7:0] = tmp2[7:0] ^ tmp3[31:24] ^ state[23:16] ^ state[15:8];
    end

endmodule