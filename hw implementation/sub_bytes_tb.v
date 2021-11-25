`include "sub_bytes.v"

module sub_bytes_tb;
    reg [127:0] state;
    wire [127:0] state_out;
    
    sub_bytes sb(.state(state), .state_out(state_out));

    initial begin
        $monitor("state = %x\nstate_out = %x\n", state, state_out);

        state = 128'h40bfabf406ee4d3042ca6b997a5c5816;
        #1;
        state = 128'hf265e8d51fd2397bc3b9976d9076505c;
        #1;
        state = 128'hfdf37cdb4b0c8c1bf7fcd8e94aa9bbf8;
        #1;
        state = 128'hacd1ec9ca242e2c31f690f7ab704b90f;
        #1;
        state = 128'ha2616e5f44a54d39c029e20092b764e9;
        #1;
        state = 128'h2c4af31432c3efc9c8a9b87b252ecda7;
        #1;
        state = 128'hcd4dc0137eb3ba1993b939ff2bd3bcf7;
        #1;
        state = 128'he26dbb7d40d22134e3b7fda26b9b077c;
        #1;
        state = 128'h41d7c6537d669140dd2f179d02acc51b;
        #1;

    end

endmodule