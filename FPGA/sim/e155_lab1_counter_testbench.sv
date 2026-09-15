// E155: Lab 1 - FPGA & MCU Setup & Testing
// Ivan Jimenez Pineda, iijimenezpineda@g.hmc.edu
// 9/8/2026
// testbench code for e155_lab1_counter_ivan

`timescale 1ns/1ps

module e155_lab1_counter_testbench();
    logic clk;
    logic reset; 
    logic enable; 
    logic led_state;

    e155_lab1_counter_ivan dut(.clk(clk), .reset(reset), .enable(enable), .led_state(led_state));

    // Generate the simulated clock
    always begin 
        clk = 1; #5; 
        clk = 0; #5; 
        end
    initial begin
        // test active-low reset
        reset = 0; 
        enable = 1; #20;
        assert(led_state == 0) else $error("Reset failed");

        // release reset to start counting
        reset = 1; #100;
        
        $display("Counter test initialized.");
        $stop; 
    end
endmodule