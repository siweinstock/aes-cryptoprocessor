`include "enc_round.v"


module enc_round_tb;
    reg [127:0] state;
    reg [127:0] key;
    wire [127:0] state_out;
    
    enc_round er(.state(state), .key(key), .state_out(state_out));

    initial begin
        $monitor("key = %x\nstate = %x\nstate_out = %x\n", key, state, state_out);

        state = 128'h40bfabf406ee4d3042ca6b997a5c5816;
        key = 128'ha0fafe1788542cb123a339392a6c7605;
        #1;
        state = 128'hf265e8d51fd2397bc3b9976d9076505c;
        key = 128'hf2c295f27a96b9435935807a7359f67f;
        #1;
        state = 128'hfdf37cdb4b0c8c1bf7fcd8e94aa9bbf8;
        key = 128'h3d80477d4716fe3e1e237e446d7a883b;
        #1;
        state = 128'hacd1ec9ca242e2c31f690f7ab704b90f;
        key = 128'hef44a541a8525b7fb671253bdb0bad00;
        #1;
        state = 128'ha2616e5f44a54d39c029e20092b764e9;
        key = 128'hd4d1c6f87c839d87caf2b8bc11f915bc;
        #1;

    end

endmodule