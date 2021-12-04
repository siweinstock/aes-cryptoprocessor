`include "enc.v"

module enc_tb;
    reg [127:0] plaintext;
    reg [1407:0] exp_key;
    reg enable;
    
    wire valid;
    wire [127:0] ciphertext;
    reg clk;

    enc uut(.clk(clk), .plaintext(plaintext), .exp_key(exp_key), .ciphertext(ciphertext), .enable(enable), .valid(valid));

    initial begin
        $dumpfile("enc_tb.vcd");
        $dumpvars(0, enc_tb);

        clk = 1;
        enable = 1;
        plaintext = 128'h6bc1bee22e409f96e93d7e117393172a;
        exp_key = 1408'h2b7e151628aed2a6abf7158809cf4f3ca0fafe1788542cb123a339392a6c7605f2c295f27a96b9435935807a7359f67f3d80477d4716fe3e1e237e446d7a883bef44a541a8525b7fb671253bdb0bad00d4d1c6f87c839d87caf2b8bc11f915bc6d88a37a110b3efddbf98641ca0093fd4e54f70e5f5fc9f384a64fb24ea6dc4fead27321b58dbad2312bf5607f8d292fac7766f319fadc2128d12941575c006ed014f9a8c9ee2589e13f0cc8b6630ca6;
        #10;
        enable = 0;
        plaintext = 128'hae2d8a571e03ac9c9eb76fac45af8e51;
        #10;
        plaintext = 128'h30c81c46a35ce411e5fbc1191a0a52ef;
        #10;
        enable = 1;
        plaintext = 128'hf69f2445df4f9b17ad2b417be66c3710;
        #10;
        plaintext = 128'hx;
        #200;
        
        $finish;

    end

    always #5 clk = ~clk;


endmodule;