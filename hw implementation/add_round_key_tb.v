`include "add_round_key.v"

module add_round_key_tb;
    reg [127:0] state;
    reg [127:0] key;
    wire [127:0] state_out;

    

    add_round_key ark(.state(state), .key(key), .state_out(state_out));

    initial begin
        $monitor("key = %x\nstate = %x\nstate_out = %x\n", key, state, state_out);

        state = 128'h6bc1bee22e409f96e93d7e117393172a;
        key = 128'h2b7e151628aed2a6abf7158809cf4f3c;
        #1;
        state = 128'h529f16c2978615cae01aae54ba1a2659;
        key = 128'ha0fafe1788542cb123a339392a6c7605;
        #1;
        state = 128'h0f31e929319a3558aec9589339f04d87;
        key = 128'hf2c295f27a96b9435935807a7359f67f;
        #1;
        state = 128'h9151abe1e5541cfd014a713eda7e3134;
        key = 128'h3d80477d4716fe3e1e237e446d7a883b;
        #1;
        state = 128'h4d25cb1eecf716467658c73b49bcc9e9;
        key = 128'hef44a541a8525b7fb671253bdb0bad00;
        #1;
        state = 128'hf89b35ec4e40724e025b00c734d7d81b;
        key = 128'hd4d1c6f87c839d87caf2b8bc11f915bc;
        #1;
        state = 128'ha0c563696fb884e44840bfbee1d32f0a;
        key = 128'h6d88a37a110b3efddbf98641ca0093fd;
        #1;
        state = 128'hac394c731f8de8c76711b210253ddb33;
        key = 128'h4e54f70e5f5fc9f384a64fb24ea6dc4f;
        #1;
        state = 128'hab05b572c8eb2b92ec04e2fd7d21ec34;
        key = 128'head27321b58dbad2312bf5607f8d292f;
        #1;

    end

endmodule