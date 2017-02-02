module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Run, Reset;
logic Clk;

logic AUD_MCLK, 
      AUD_BCLK, 
	   AUD_ADCDAT, 
	   AUD_DACDAT, 
	   AUD_DACLRCK, 
	   AUD_ADCLRCK, 
	   I2C_SDAT, 
		LEDG8,
		LEDR11,
		LEDR10,
		LEDR9,
		LEDG0, LEDG1,
	   I2C_SCLK;
logic [8:0]LEDR;
		
logic [31:0] ADCDATA;
logic SW7, SW6, SW5, SW4, SW3, SW2, SW1, SW0;



				

		
// Instantiating the DUT
// Make sure the module and signal names match with those in your design
toplevel top0(.*);	

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
AUD_DACLRCK = 1'b0;
Reset = 1'b0;
#4
Reset = 1'b1;
Run = 1'b0;
#8
Run = 1'b1;

#100000
AUD_DACLRCK = 1'b1;
end

endmodule
