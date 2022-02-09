`include "inv_shift_rows.v"

module inv_shift_rows_tb;
    reg [127:0] state;
    wire [127:0] state_out;
    
    inv_shift_rows sr(.state(state), .state_out(state_out));

    initial begin
        $monitor("state = %x\nstate_out = %x\n", state, state_out);

        state = 128'h09287f476f746abf2c4a6204da08e3ee;
        #1;
        state = 128'h89b5884ac05653032e389b21604d123c;
        #1;
        state = 128'h54fe6141b3b0eab968d310afd60d641e;
        #1;
        state = 128'h912c76763af956dec0f2ce2ea93e98da;
        #1;
        state = 128'h3a06981e1ba543cfbaa99f124fefe363;
        #1;
        state = 128'h712e6c5c23d3bdfae8310ddd3fd6df21;
        #1;
        state = 128'hbd6d1268f356657ddc66bad4f1e3f416;
        #1;
        state = 128'h98b5541009a9c5ff1114ea187f3cfd3a;
        #1;
        state = 128'h8333f0afff15a6edc191b409770e815e;
        #1;

    end

endmodule