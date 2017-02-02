module ps2keyboard(

input logic PS2_CLK, PS2_DAT,
input logic Clk, Reset,

output logic LDEG8,
output logic [6:0] HU,
output logic [6:0] HL
);

logic [7:0] keyCode;
logic reset;
assign reset = ~Reset;

keyboard	keyboard_inst( .Clk, .psClk(PS2_CLK), .psData(PS2_DAT), .reset,
					 .keyCode(keyCode),
					 .press(LGDG8));

HexDriver h1( .In0(keyCode[7:4]),
            .Out0(HU) );


HexDriver h2( .In0(keyCode[3:0]),
            .Out0(HL) );



endmodule  