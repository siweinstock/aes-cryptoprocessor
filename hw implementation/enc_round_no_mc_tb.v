`include "enc_round_no_mc.v"


module enc_round_no_mc_tb;
    reg [127:0] state;
    reg [127:0] key;
    wire [127:0] state_out;
    
    enc_round_no_mc er(.state(state), .key(key), .state_out(state_out));

    initial begin
        $monitor("key = %x\nstate = %x\nstate_out = %x\n", key, state, state_out);

        state = 128'hbb36c7eb88334d49a4e7112e74f182c4;
        key = 128'hd014f9a8c9ee2589e13f0cc8b6630ca6;
        #1;

    end

endmodule