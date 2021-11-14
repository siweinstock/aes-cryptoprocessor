`include "ke_core.v"

module ke (key, expanded);
    input [127:0] key;
    output [1407:0] expanded;

    assign expanded[1407:1280] = key[127:0];

    ke_core kc1(expanded[1407:1280], expanded[1279:1152], 8'd1);
    ke_core kc2(expanded[1279:1152], expanded[1151:1024], 8'd2);
    ke_core kc3(expanded[1151:1024], expanded[1023:896], 8'd3);
    ke_core kc4(expanded[1023:896], expanded[895:768], 8'd4);
    ke_core kc5(expanded[895:768], expanded[767:640], 8'd5);
    ke_core kc6(expanded[767:640], expanded[639:512], 8'd6);
    ke_core kc7(expanded[639:512], expanded[511:384], 8'd7);
    ke_core kc8(expanded[511:384], expanded[383:256], 8'd8);
    ke_core kc9(expanded[383:256], expanded[255:128], 8'd9);
    ke_core kc10(expanded[255:128], expanded[127:0], 8'd10);

    
endmodule