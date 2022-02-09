`timescale 1ns/1ns
`include "inv_mix_cols.v"

module inv_mix_cols_tb;
    reg [127:0] state;
    wire [127:0] mixed;
    
    inv_mix_cols mx(.state(state), .mixed(mixed));

    initial begin
        $monitor("state = %x\nmixed_col = %x", state, mixed);

        state = 128'h529f16c2978615cae01aae54ba1a2659;
        #1;
        state = 128'h0f31e929319a3558aec9589339f04d87;
        #1;
        state = 128'h9151abe1e5541cfd014a713eda7e3134;
        #1;
        state = 128'h4d25cb1eecf716467658c73b49bcc9e9;
        #1;
        state = 128'hf89b35ec4e40724e025b00c734d7d81b;
        #1;
        state = 128'ha0c563696fb884e44840bfbee1d32f0a;
        #1;
        state = 128'hac394c731f8de8c76711b210253ddb33;
        #1;
        state = 128'hab05b572c8eb2b92ec04e2fd7d21ec34;
        #1;
        state = 128'h1741a11891c991688c36386f23ad82aa;
        #1;

    end

endmodule