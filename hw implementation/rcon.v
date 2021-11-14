module rcon (i, o);
    input [7:0] i;
    output [7:0] o;

    reg [7:0] o;

    always @(i) begin
        case(i)
            8'h01: o = 8'h1;
            8'h02: o = 8'h2;
            8'h03: o = 8'h4;
            8'h04: o = 8'h8;
            8'h05: o = 8'h10;
            8'h06: o = 8'h20;
            8'h07: o = 8'h40;
            8'h08: o = 8'h80;
            8'h09: o = 8'h1b;
            8'h0A: o = 8'h36;
            default: o = 8'h0;
        endcase
    end
    
endmodule