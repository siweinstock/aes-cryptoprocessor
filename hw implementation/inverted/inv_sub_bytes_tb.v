`include "inv_sub_bytes.v"

module inv_sub_bytes_tb;
    reg [127:0] state;
    wire [127:0] state_out;
    
    inv_sub_bytes sb(.state(state), .state_out(state_out));

    initial begin
        $monitor("state = %x\nstate_out = %x\n", state, state_out);

        state = 128'h090862bf6f28e3042c747feeda4a6a47;
        #1;
        state = 128'h894d9b03c0b512212e56883c6038534a;
        #1;
        state = 128'h540d10b9b3fe64af68b0611ed6d3ea41;
        #1;
        state = 128'h913ecede3a2c982ec0f976daa9f25676;
        #1;
        state = 128'h3aef9fcf1b06e312baa598634fa9431e;
        #1;
        state = 128'h71d60dfa232edfdde8d36c213f31bd5c;
        #1;
        state = 128'hbde3ba7df36df4d4dc561216f1666568;
        #1;
        state = 128'h983ceaff09b5fd1811a9543a7f14c510;
        #1;
        state = 128'hea05c6e9c4c3e33b4994823192a1131c;
        #1;

    end

endmodule