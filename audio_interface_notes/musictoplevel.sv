module musictoplevel(
input logic Run, Reset,
input logic Run_start,
input logic End,
input logic Eff,
input logic Clk,


input logic  AUD_ADCDAT,
				 AUD_DACLRCK,
				 AUD_ADCLRCK,
				 AUD_BCLK,
output logic AUD_MCLK, 
				 AUD_DACDAT, 
				 I2C_SDAT, 
				 I2C_SCLK,
output logic  [31:0] ADCDATA

);

logic SW6, SW5, SW4, SW3, SW2, SW1, SW0;
logic SW17, SW14, SW13, SW12, SW11, SW10, SW9, SW8, SW7;
logic Run_Piano;


piano pi( 
	.Run(Run_Piano), .Reset,
	.Clk,
	.SW6, .SW5, .SW4, .SW3, .SW2, .SW1, .SW0,
	.SW17, .SW14, .SW13, .SW12, .SW11, .SW10, .SW9, .SW8, .SW7,
   .AUD_ADCDAT,
	.AUD_DACLRCK,
	.AUD_ADCLRCK,
	.AUD_BCLK,
	.AUD_MCLK, 
	.AUD_DACDAT, 
	.I2C_SDAT, 
	.I2C_SCLK,
	.ADCDATA
);



pianocontroller controller(
	.Reset, .Clk,
   .Run_start,
	.End,
	.Eff,
	.Run_Piano,
   .SW6, .SW5, .SW4, .SW3, .SW2, .SW1, .SW0,
	.SW17, .SW14, .SW13, .SW12, .SW11, .SW10, .SW9, .SW8, .SW7
);




endmodule 