// E155: Lab 1 - FPGA & MCU Setup & Testing
// Ivan Jimenez Pineda, ijimenezpineda@g.hmc.edu
// 9/8/2026
// Top level module that maps the switches to the LEDs and the 7-segment display

module e155_lab1_ivan(	input logic 	reset,
					    input logic		[3:0]s,
					    output logic 	[2:0]led,
					    output logic	[6:0]seg
				    );
	
	assign led[0] = s[1] ^ s[0];		// XOR for led[0]

	assign led[1] = s[3] & s[2];		// AND for led[1]
    
    logic int_osc;
    logic led_state; 

	// HSOSC 
	HSOSC #(.CLKHF_DIV(2'b01)) 		// divide it down to 24MHz
		hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
  
    // use counter module to achieve 2.4Hz blink rate from 48MHz clock
    e155_lab1_counter_ivan blink(.clk(int_osc), .reset(reset), .enable(1'b1), .led_state(led_state));

	assign led[2] = led_state; // assign the toggling state to led[2]

    seven_segment seven_segment_start(s, seg);

endmodule