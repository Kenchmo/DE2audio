module piano(
input Run, Reset,
input Clk,

input logic SW6, SW5, SW4, SW3, SW2, SW1, SW0,
input logic SW17, SW14, SW13, SW12, SW11, SW10, SW9, SW8, SW7,

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








//logic      [15:0] LDATA_sig, 
//logic        [15:0] RDATA_sig, 
//wire		 clk_sig, 
//wire		 Reset_sig,
logic     INIT_sig;
logic	    INIT_FINISH_sig;
logic	    adc_full_sig;
logic     data_over_sig;
//wire	    AUD_MCLK_sig,
//wire	    AUD_BCLK_sig,
//wire      AUD_ADCDAT_sig,
//wire      AUD_DACDAT_sig,
//wire	    AUD_DACLRCK_sig,
//wire	    AUD_ADCLRCK_sig,
//wire	    I2C_SDAT_sig,
//wire	    I2C_SCLK_sig,
//wire 	   [31:0]   ADCDATA_sig;
	
//assign clk_sig = clk;
logic Reset_h, Run_h;
assign Reset_h = ~Reset;
assign Run_h = ~Run;



logic [15:0] AUD_LDATA, AUD_RDATA;
//control c0(
//             .clk,
//             .INIT_FINISH(INIT_FINISH_sig),
//             .Reset, .Run,
//             .data_over(data_over_sig),
//             .AUD_LDATA(LDATA_sig), .AUD_RDATA(RDATA_sig),
//             .INIT(INIT_sig)
//);



audio_interface audio_interface_inst
(
	.LDATA(AUD_LDATA) ,	// input [15:0] LDATA_sig
	.RDATA(AUD_RDATA) ,	// input [15:0] RDATA_sig
	.clk(Clk) ,	// input  clk_sig
	.Reset(Reset_h) ,	// input  Reset_sig
	.INIT(INIT_sig) ,	// input  INIT_sig
	.INIT_FINISH(INIT_FINISH_sig) ,	// output  INIT_FINISH_sig
	.adc_full(adc_full_sig) ,	// output  adc_full_sig
	.data_over(data_over_sig) ,	// output  data_over_sig
	.AUD_MCLK(AUD_MCLK) ,	// output  AUD_MCLK_sig
	.AUD_BCLK(AUD_BCLK) ,	// input  AUD_BCLK_sig
	.AUD_ADCDAT(AUD_ADCDAT) ,	// input  AUD_ADCDAT_sig
	.AUD_DACDAT(AUD_DACDAT) ,	// output  AUD_DACDAT_sig
	.AUD_DACLRCK(AUD_DACLRCK) ,	// input  AUD_DACLRCK_sig
	.AUD_ADCLRCK(AUD_ADCLRCK) ,	// input  AUD_ADCLRCK_sig
	.I2C_SDAT(I2C_SDAT) ,	// output  I2C_SDAT_sig
	.I2C_SCLK(I2C_SCLK) ,	// output  I2C_SCLK_sig
	.ADCDATA(ADCDATA) 	// output [31:0] ADCDATA_sig
);


enum logic [2:0]{
RESET_S,
WAIT,
RUN,
RUN_2,
SEND_DATA,
SEND_DATA_2
} state, next_state;


always_ff @ (posedge Clk) begin
	if(Reset_h)
		state <= RESET_S;
	else
		state <= next_state;
end

always_comb begin
	next_state = state;
	unique case(state)
	RESET_S:
		next_state = WAIT;
	WAIT:
		if(Run_h)
			next_state = RUN;
	RUN:
	   if(~Run_h)
			next_state = RUN_2;
	RUN_2:
		if(INIT_FINISH_sig)
			next_state = SEND_DATA;
	SEND_DATA:
		if(data_over_sig)
			next_state = SEND_DATA_2;
	SEND_DATA_2:
		if(data_over_sig)
		   next_state = SEND_DATA;
   endcase
		
	
end


logic [15:0] LDATA_Buf, RDATA_Buf;
logic [15:0] LDATA_Buf14, RDATA_Buf14;
logic [15:0] LDATA_Buf13, RDATA_Buf13;
logic [15:0] LDATA_Buf12, RDATA_Buf12;
logic [15:0] LDATA_Buf11, RDATA_Buf11;
logic [15:0] LDATA_Buf10, RDATA_Buf10;
logic [15:0] LDATA_Buf9, RDATA_Buf9;
logic [15:0] LDATA_Buf8, RDATA_Buf8;



logic [15:0] LDATA_Buf7, RDATA_Buf7;
logic [15:0] LDATA_Buf6, RDATA_Buf6;
logic [15:0] LDATA_Buf5, RDATA_Buf5;
logic [15:0] LDATA_Buf4, RDATA_Buf4;
logic [15:0] LDATA_Buf3, RDATA_Buf3;
logic [15:0] LDATA_Buf2, RDATA_Buf2;
logic [15:0] LDATA_Buf1, RDATA_Buf1;
logic [15:0] LDATA_Buf0, RDATA_Buf0;


logic freq6, freq5, freq4, freq3, freq2, freq1, freq0;
logic freq14, freq13, freq12, freq11, freq10, freq9, freq8, freq7;

always_comb begin
	INIT_sig = 1'b0;
	AUD_LDATA = 16'd0;
   AUD_RDATA = 16'd0;
	unique case(state)
	RESET_S:;
	WAIT:;
	RUN:
		INIT_sig = 1'b1;
	RUN_2:
		INIT_sig = 1'b1;
	SEND_DATA:
		 begin
		 AUD_LDATA <= LDATA_Buf;
		 AUD_RDATA <= RDATA_Buf;
		 end
   SEND_DATA_2:
		begin 
		 AUD_LDATA <= LDATA_Buf;
		 AUD_RDATA <= RDATA_Buf;
		end 
	endcase
end



always_ff @ (posedge Clk)
begin
	if(SW14)
		begin
			LDATA_Buf <= LDATA_Buf14;
			RDATA_Buf <= RDATA_Buf14;
		end 
	else if(SW13)
		begin
			LDATA_Buf <= LDATA_Buf13;
			RDATA_Buf <= RDATA_Buf13;
		end 
   else if (SW12)
		begin 
			LDATA_Buf <= LDATA_Buf12;
			RDATA_Buf <= RDATA_Buf12;
		end 
	else if (SW11)
		begin 
			LDATA_Buf <= LDATA_Buf11;
			RDATA_Buf <= RDATA_Buf11;
		end
	else if (SW10)
		begin 
			LDATA_Buf <= LDATA_Buf10;
			RDATA_Buf <= RDATA_Buf10;
		end 
	else if (SW9)
		begin 
			LDATA_Buf <= LDATA_Buf9;
			RDATA_Buf <= RDATA_Buf9;
		end 
	else if (SW8)
		begin 
			LDATA_Buf <= LDATA_Buf8;
			RDATA_Buf <= RDATA_Buf8;
		end 
	else if (SW7)
		begin 
			LDATA_Buf <= LDATA_Buf7;
			RDATA_Buf <= RDATA_Buf7;
		end 
	else if (SW6)
		begin 
			LDATA_Buf <= LDATA_Buf6;
			RDATA_Buf <= RDATA_Buf6;
		end 
	else if (SW5)
		begin 
			LDATA_Buf <= LDATA_Buf5;
			RDATA_Buf <= RDATA_Buf5;
		end
	else if (SW4)
		begin 
			LDATA_Buf <= LDATA_Buf4;
			RDATA_Buf <= RDATA_Buf4;
		end 
	else if (SW3)
		begin 
			LDATA_Buf <= LDATA_Buf3;
			RDATA_Buf <= RDATA_Buf3;
		end 
	else if (SW2)
		begin 
			LDATA_Buf <= LDATA_Buf2;
			RDATA_Buf <= RDATA_Buf2;
		end 
	else if (SW1)
		begin 
			LDATA_Buf <= LDATA_Buf1;
			RDATA_Buf <= RDATA_Buf1;
		end 
	else if (SW0)
		begin 
			LDATA_Buf <= LDATA_Buf0;
			RDATA_Buf <= RDATA_Buf0;
		end 
	else
		begin 
			LDATA_Buf <= 16'd0;
			RDATA_Buf <= 16'd0;
		end 	
end 





reg [19:0]  count6, count5, count4, count3, count2, count1, count0;
reg [19:0]  count14, count13, count12, count11, count10, count9, count8, count7;



always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq14 <=  1'b0;
			count14 <= 20'b0; end 
		else if (count14 < 20'd23889)
			count14++;
		else begin 
			freq14 <= ~(freq14);
			count14 <= 20'b0;
	end end 
	
	
always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h)
			begin freq13 <=  1'b0;
			count13 <= 20'b0; end 
		else if (count13 < 20'd25309)
			count13++;
		else begin 
			freq13 <= ~(freq13);
			count13 <= 20'b0;
	end end 
	

always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq12 <=  1'b0;
			count12 <= 20'b0; end 
		else if (count12 < 20'd28409)
			count12++;
		else begin 
			freq12 <= ~(freq12);
			count12 <= 20'b0;
	end end 
	
always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq11 <=  1'b0;
			count11 <= 20'b0; end 
		else if (count11 < 20'd31888)
			count11++;
		else begin 
			freq11 <= ~(freq11);
			count11 <= 20'b0;
	end end 
	
always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq10 <=  1'b0;
			count10 <= 20'b0; end 
		else if (count10 < 20'd35791)
			count10++;
		else begin 
			freq10 <= ~(freq10);
			count10 <= 20'b0;
	end end 
	

always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq9 <=  1'b0;
			count9 <= 20'b0; end 
		else if (count9 < 20'd37919)
			count9++;
		else begin 
			freq9 <= ~(freq9);
			count9 <= 20'b0;
	end end 
	
always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq8 <=  1'b0;
			count8 <= 20'b0; end 
		else if (count8 < 20'd42568)
			count8++;
		else begin 
			freq8 <= ~(freq8);
			count8 <= 20'b0;
	end end 
	
always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq7 <=  1'b0;
			count7 <= 20'b0; end 
		else if (count7 < 20'd47774)
			count7++;
		else begin 
			freq7 <= ~(freq7);
			count7 <= 20'b0;
	end end 
	
	

	
always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h)
			begin freq6 <=  1'b0;
			count6 <= 20'b0; end 
		else if (count6 < 20'd50618)
			count6++;
		else begin 
			freq6 <= ~(freq6);
			count6 <= 20'b0;
	end end 
	

always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq5 <=  1'b0;
			count5 <= 20'b0; end 
		else if (count5 < 20'd56818)
			count5++;
		else begin 
			freq5 <= ~(freq5);
			count5 <= 20'b0;
	end end 
	
always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq4 <=  1'b0;
			count4 <= 20'b0; end 
		else if (count4 < 20'd63776)
			count4++;
		else begin 
			freq4 <= ~(freq4);
			count4 <= 20'b0;
	end end 
	
always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq3 <=  1'b0;
			count3 <= 20'b0; end 
		else if (count3 < 20'd71592)
			count3++;
		else begin 
			freq3 <= ~(freq3);
			count3 <= 20'b0;
	end end 
	

always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq2 <=  1'b0;
			count2 <= 20'b0; end 
		else if (count2 < 20'd75850)
			count2++;
		else begin 
			freq2 <= ~(freq2);
			count2 <= 20'b0;
	end end 
	
always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq1 <=  1'b0;
			count1 <= 20'b0; end 
		else if (count1 < 20'd85122)
			count1++;
		else begin 
			freq1 <= ~(freq1);
			count1 <= 20'b0;
	end end 
	
always_ff @ (posedge Clk or posedge Reset_h)
	begin
		if (Reset_h) begin 
			freq0 <=  1'b0;
			count0 <= 20'b0; end 
		else if (count0 < 20'd95566)
			count0++;
		else begin 
			freq0 <= ~(freq0);
			count0 <= 20'b0;
	end end 
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf14 <= 16'd0;
		RDATA_Buf14 <= 16'd0;
		end
	else if(freq14)
		begin
		LDATA_Buf14 <= 16'b1100000000000000;
		RDATA_Buf14 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf14 <= 16'b0000000000000000;
		RDATA_Buf14 <= 16'b0000000000000000;
		end
end

	
	
	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf13 <= 16'd0;
		RDATA_Buf13 <= 16'd0;
		end
	else if(freq13)
		begin
		LDATA_Buf13 <= 16'b1100000000000000;
		RDATA_Buf13 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf13 <= 16'b0000000000000000;
		RDATA_Buf13 <= 16'b0000000000000000;
		end
end


	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf12 <= 16'd0;
		RDATA_Buf12 <= 16'd0;
		end
	else if(freq12)
		begin
		LDATA_Buf12 <= 16'b1100000000000000;
		RDATA_Buf12 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf12 <= 16'b0000000000000000;
		RDATA_Buf12 <= 16'b0000000000000000;
		end
end
	
	
	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf11 <= 16'd0;
		RDATA_Buf11 <= 16'd0;
		end
	else if(freq11)
		begin
		LDATA_Buf11 <= 16'b1100000000000000;
		RDATA_Buf11 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf11 <= 16'b0000000000000000;
		RDATA_Buf11 <= 16'b0000000000000000;
		end
end
	
	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf10 <= 16'd0;
		RDATA_Buf10 <= 16'd0;
		end
	else if(freq10)
		begin
		LDATA_Buf10 <= 16'b1100000000000000;
		RDATA_Buf10 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf10 <= 16'b0000000000000000;
		RDATA_Buf10 <= 16'b0000000000000000;
		end
end
	
	
	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf9 <= 16'd0;
		RDATA_Buf9 <= 16'd0;
		end
	else if(freq9)
		begin
		LDATA_Buf9 <= 16'b1100000000000000;
		RDATA_Buf9 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf9 <= 16'b0000000000000000;
		RDATA_Buf9 <= 16'b0000000000000000;
		end
end
	

	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf8 <= 16'd0;
		RDATA_Buf8 <= 16'd0;
		end
	else if(freq8)
		begin
		LDATA_Buf8 <= 16'b1100000000000000;
		RDATA_Buf8 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf8 <= 16'b0000000000000000;
		RDATA_Buf8 <= 16'b0000000000000000;
		end
end
	
	

	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf7 <= 16'd0;
		RDATA_Buf7 <= 16'd0;
		end
	else if(freq7)
		begin
		LDATA_Buf7 <= 16'b1100000000000000;
		RDATA_Buf7 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf7 <= 16'b0000000000000000;
		RDATA_Buf7 <= 16'b0000000000000000;
		end
end


	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf6 <= 16'd0;
		RDATA_Buf6 <= 16'd0;
		end
	else if(freq6)
		begin
		LDATA_Buf6 <= 16'b1100000000000000;
		RDATA_Buf6 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf6 <= 16'b0000000000000000;
		RDATA_Buf6 <= 16'b0000000000000000;
		end
end
	
	
	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf5 <= 16'd0;
		RDATA_Buf5 <= 16'd0;
		end
	else if(freq5)
		begin
		LDATA_Buf5 <= 16'b1100000000000000;
		RDATA_Buf5 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf5 <= 16'b0000000000000000;
		RDATA_Buf5 <= 16'b0000000000000000;
		end
end
	
	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf4 <= 16'd0;
		RDATA_Buf4 <= 16'd0;
		end
	else if(freq4)
		begin
		LDATA_Buf4 <= 16'b1100000000000000;
		RDATA_Buf4 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf4 <= 16'b0000000000000000;
		RDATA_Buf4 <= 16'b0000000000000000;
		end
end
	
	
	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf3 <= 16'd0;
		RDATA_Buf3 <= 16'd0;
		end
	else if(freq3)
		begin
		LDATA_Buf3 <= 16'b1100000000000000;
		RDATA_Buf3 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf3 <= 16'b0000000000000000;
		RDATA_Buf3 <= 16'b0000000000000000;
		end
end
	

	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf2 <= 16'd0;
		RDATA_Buf2 <= 16'd0;
		end
	else if(freq2)
		begin
		LDATA_Buf2 <= 16'b1100000000000000;
		RDATA_Buf2 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf2 <= 16'b0000000000000000;
		RDATA_Buf2 <= 16'b0000000000000000;
		end
end
	
	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf1 <= 16'd0;
		RDATA_Buf1 <= 16'd0;
		end
	else if(freq1)
		begin
		LDATA_Buf1 <= 16'b1100000000000000;
		RDATA_Buf1 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf1 <= 16'b0000000000000000;
		RDATA_Buf1 <= 16'b0000000000000000;
		end
end
	
	
	
always_ff @ (posedge Clk)
begin
	if(Reset_h)
		begin
		LDATA_Buf0 <= 16'd0;
		RDATA_Buf0 <= 16'd0;
		end
	else if(freq0)
		begin
		LDATA_Buf0 <= 16'b1100000000000000;
		RDATA_Buf0 <= 16'b1100000000000000;
		end
	else
		begin
		LDATA_Buf0 <= 16'b0000000000000000;
		RDATA_Buf0 <= 16'b0000000000000000;
		end
end
	

endmodule

