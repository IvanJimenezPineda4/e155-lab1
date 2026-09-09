// E155: Lab 1 - FPGA & MCU Setup & Testing
// Ivan Jimenez Pineda, iijimenezpineda@g.hmc.edu
// 9/8/2026
// testbench code for e155_lab1_ivan

`timescale 1ns/1ps

module e155_lab1_testbench();
    logic reset;
    logic [3:0] s;
    logic [2:0] led;
    logic [6:0] seg;

    e155_lab1_ivan dut(.reset(reset), .s(s), .led(led), .seg(seg));

    initial begin
        // hold in reset, then release to let HSOSC run
        reset = 0; #100; 
        reset = 1; #100;

        // test switch logic 
        
        s = 4'b0000; #10;
        assert (led[1:0] == 2'b00) else $error("LED logic failed for 0000");
        assert (seg == 7'b1000000) else $error("Seg logic failed for 0000");

        s = 4'b0001; #10;
        assert (led[1:0] == 2'b01) else $error("LED logic failed for 0001");
        assert (seg == 7'b1111001) else $error("Seg logic failed for 0001");
        
        s = 4'b0010; #10;
        assert (led[1:0] == 2'b01) else $error("LED logic failed for 0010");
        assert (seg == 7'b0100100) else $error("Seg logic failed for 0010");

        s = 4'b0011; #10;
        assert (led[1:0] == 2'b00) else $error("LED logic failed for 0011");
        assert (seg == 7'b0110000) else $error("Seg logic failed for 0011");

        s = 4'b0100; #10;
        assert (led[1:0] == 2'b00) else $error("LED logic failed for 0100");
        assert (seg == 7'b0011001) else $error("Seg logic failed for 0100");

        s = 4'b0101; #10;
        assert (led[1:0] == 2'b01) else $error("LED logic failed for 0101");
        assert (seg == 7'b0010010) else $error("Seg logic failed for 0101");

        s = 4'b0110; #10;
        assert (led[1:0] == 2'b01) else $error("LED logic failed for 0110");
        assert (seg == 7'b0000010) else $error("Seg logic failed for 0110");

        s = 4'b0111; #10;
        assert (led[1:0] == 2'b00) else $error("LED logic failed for 0111");
        assert (seg == 7'b1111000) else $error("Seg logic failed for 0111");

        s = 4'b1000; #10;
        assert (led[1:0] == 2'b00) else $error("LED logic failed for 1000");
        assert (seg == 7'b0000000) else $error("Seg logic failed for 1000");

        s = 4'b1001; #10;
        assert (led[1:0] == 2'b01) else $error("LED logic failed for 1001");
        assert (seg == 7'b0011000) else $error("Seg logic failed for 1001");

        s = 4'b1010; #10;
        assert (led[1:0] == 2'b01) else $error("LED logic failed for 1010");
        assert (seg == 7'b0001000) else $error("Seg logic failed for 1010");

        s = 4'b1011; #10;
        assert (led[1:0] == 2'b00) else $error("LED logic failed for 1011");
        assert (seg == 7'b0000011) else $error("Seg logic failed for 1011");

        s = 4'b1100; #10;
        assert (led[1:0] == 2'b10) else $error("LED logic failed for 1100");
        assert (seg == 7'b1000110) else $error("Seg logic failed for 1100");

        s = 4'b1101; #10;
        assert (led[1:0] == 2'b11) else $error("LED logic failed for 1101");
        assert (seg == 7'b0100001) else $error("Seg logic failed for 1101");

        s = 4'b1110; #10;
        assert (led[1:0] == 2'b11) else $error("LED logic failed for 1110");
        assert (seg == 7'b0000110) else $error("Seg logic failed for 1110");

        s = 4'b1111; #10;
        assert (led[1:0] == 2'b10) else $error("LED logic failed for 1111");
        assert (seg == 7'b0001110) else $error("Seg logic failed for 1111");

        $display("tests completed.");
        $stop;
    end
endmodule