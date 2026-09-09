// E155: Lab 1 - FPGA & MCU Setup & Testing
// Ivan Jimenez Pineda, ijimenezpineda@g.hmc.edu
// 9/8/2026
// counter to achieve the 2.4Hz blink rate from a 48MHz clock

module e155_lab1_counter_ivan( input logic clk,
                               input logic reset,
                               input logic enable,
                               output logic led_state );
  // We want 2.4 full cycles per second so we must toggle
  // the led 4.8 times per second so 24MHz / 4.8 = 5,000,000 cycles per toggle             
    logic [23:0] count;
    always_ff @(posedge clk) begin
        if (reset == 0) begin
            count <= 0;
            led_state <= 0;
        end
        else if (enable) begin
            if (count >= 4999999) begin
                count <= 0;
                led_state <= ~led_state; // toggle led at the maximum count
            end
            else begin
                count <= count + 1;
            end
        end
    end
endmodule