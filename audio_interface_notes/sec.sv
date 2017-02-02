

module onesec(
input logic Clk, Reset_h,
input logic SW,

output logic tone_finish,
output reg [25:0] count,
output logic SWD
);

always_ff @ (posedge Clk)
begin 
	if (Reset_h)
		count <= 25'b0;
	else if (SW)
		SWD <= 1'b1;
	else if ( tone_finish == 1'b1)
		tone_finish <= 1'b0;
	else if ( count == 25'b1111111111111111111111111)
		begin 
			tone_finish <= 1'b1;
			count <= 25'b0;
			SWD <= 1'b0;
		end 
	else if (SWD)
		count++;
	else if (tone_finish)
		tone_finish <= 1'b0;
end 

endmodule
