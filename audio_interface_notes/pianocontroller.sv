
module pianocontroller(
input logic Reset, Clk,
input logic Run_start,// Run_effect, Run_end,
input logic End, Eff,


output logic Run_Piano,
output logic SW6, SW5, SW4, SW3, SW2, SW1, SW0,
output logic SW17, SW14, SW13, SW12, SW11, SW10, SW9, SW8, SW7,
output logic tone_finish1, tone_finish2, tone_finish3, tone_finish4, tone_finish5, tone_finish6, tone_finish7, 
output logic tone_finish8, tone_finish9, tone_finish10, tone_finish11, tone_finish12, tone_finish13, tone_finish14, tone_finish15,
output logic tone_finish16, tone_finish17, tone_finish18, tone_finish19, tone_finish20, tone_finish21, tone_finish22, 
output logic tone_finish30, tone_finish29, tone_finish28, tone_finish27, tone_finish26, tone_finish25, tone_finish24, tone_finish23,
output logic tone_finish31, tone_finish32, tone_finish33, tone_finish34,tone_finishst1, tone_finishst2,


output logic ttone_finish1, ttone_finish2, ttone_finish3, ttone_finish4, ttone_finish5, ttone_finish6, ttone_finish7, 
output logic ttone_finish8, ttone_finish9, ttone_finish10, ttone_finish11, ttone_finish12, ttone_finish13, ttone_finish14, ttone_finish15,
output logic ttone_finish16, ttone_finish17, ttone_finish18, ttone_finish19, ttone_finish20, ttone_finish21, ttone_finish22, ttone_finish23,
output logic tttone_finish1, tttone_finish2
);



logic Reset_h;
assign Reset_h = ~Reset;
logic Run_start_h;
assign Run_start_h = ~Run_start;

enum logic [7:0]{

SLEEP,
RUN_P,
RUN_P_DONE,
RUN_S,
RUN_S_DONE,
START_MUSIC1,
START_MUSIC2,
START_MUSIC3,
START_MUSIC4,
START_MUSIC5,
START_MUSIC6,
START_MUSIC7,
START_MUSIC8,
START_MUSIC9,
START_MUSIC10,
START_MUSIC11,
START_MUSIC12,
START_MUSIC13,
START_MUSIC14,
START_MUSIC15,
START_MUSIC16,
START_MUSIC17,
START_MUSIC18,
START_MUSIC19,
START_MUSIC20,
START_MUSIC21,
START_MUSIC22,
START_MUSIC23,
START_MUSIC24,
START_MUSIC25,
START_MUSIC26,
START_MUSIC27,
START_MUSIC28,
START_MUSICst1,
START_MUSIC29,
START_MUSIC30,
START_MUSIC31,

START_MUSICst2,
START_MUSIC32,
START_MUSIC33,
START_MUSIC34,

END_S_DONE,

END1,
END2,
END3,
END4,
END5,
END6,
END7,
END8,
END9,
END10,
END11,
END12,
END13,
END14,
END15,
END16,
END17,
END18,
END19,
END20,
END21,
END22,
END23,

EFF_S_DONE,
EFF1,
EFF2

} state, next_state;


always_ff @ (posedge Clk) begin
	if(Reset_h)
		state <= SLEEP;
	else
		state <= next_state;
end


always_comb begin
	next_state <= state;
	unique case(state)
	SLEEP:
		next_state <= RUN_P;
	RUN_P:
		next_state <= RUN_P_DONE;	
	RUN_P_DONE:
		next_state <= RUN_S;	
	RUN_S:	
		if (~Run_start)
			next_state <= RUN_S_DONE;
		else if (~End)
			next_state <= END_S_DONE;
		else if (~Eff)
			next_state <= EFF_S_DONE;
	END_S_DONE:
		if (End)
			next_state <= END1;
	RUN_S_DONE:	
		if (Run_start)
			next_state <= START_MUSIC1;
	EFF_S_DONE:
		if (Eff)
			next_state <= EFF1;
			
	EFF1:
		if (tttone_finish1)
			next_state <= EFF2;
	EFF2: 
		if (tttone_finish2)
			next_state <= SLEEP;
		
		
		
		
	START_MUSIC1:
		if (tone_finish1)
			next_state <= START_MUSIC2; 
	START_MUSIC2:
		if (tone_finish2)
			next_state <= START_MUSIC3; 
	START_MUSIC3:
		if (tone_finish3)
			next_state <= START_MUSIC4; 
	START_MUSIC4:
		if (tone_finish4)
			next_state <= START_MUSIC5; 
	START_MUSIC5:
		if (tone_finish5)
			next_state <= START_MUSIC6; 
	START_MUSIC6:
		if (tone_finish6)
			next_state <= START_MUSIC7; 
	START_MUSIC7:
		if (tone_finish7)
			next_state <= START_MUSIC8; 
	START_MUSIC8:
		if (tone_finish8)
			next_state <= START_MUSIC9; 
	START_MUSIC9:
		if (tone_finish9)
			next_state <= START_MUSIC10; 
	START_MUSIC10:
		if (tone_finish10)
			next_state <= START_MUSIC11; 
	START_MUSIC11:
		if (tone_finish11)
			next_state <= START_MUSIC12; 
	START_MUSIC12:
		if (tone_finish12)
			next_state <= START_MUSIC13; 
	START_MUSIC13:
		if (tone_finish13)
			next_state <= START_MUSIC14; 
	START_MUSIC14:
		if (tone_finish14)
			next_state <= START_MUSIC15; 
	START_MUSIC15:
		if (tone_finish15)
			next_state <= START_MUSIC16; 
	START_MUSIC16:
		if (tone_finish16)
			next_state <= START_MUSIC17; 
	START_MUSIC17:
		if (tone_finish17)
			next_state <= START_MUSIC18; 
	START_MUSIC18:
		if (tone_finish18)
			next_state <= START_MUSIC19; 
	START_MUSIC19:
		if (tone_finish19)
			next_state <= START_MUSIC20; 
	START_MUSIC20:
		if (tone_finish20)
			next_state <= START_MUSIC21; 
	START_MUSIC21:
		if (tone_finish21)
			next_state <= START_MUSIC22; 
	START_MUSIC22:
		if (tone_finish22)
			next_state <= START_MUSIC23; 
	START_MUSIC23:
		if (tone_finish23)
			next_state <= START_MUSIC24; 
	START_MUSIC24:
		if (tone_finish24)
			next_state <= START_MUSIC25; 
	START_MUSIC25:
		if (tone_finish25)
			next_state <= START_MUSIC26; 
	START_MUSIC26:
		if (tone_finish26)
			next_state <= START_MUSIC27; 
	START_MUSIC27:
		if (tone_finish27)
			next_state <= START_MUSIC28; 
	START_MUSIC28:
		if (tone_finish31)
			next_state <= START_MUSICst1; 
			
	START_MUSICst1:
		if (tone_finishst1)
			next_state <= START_MUSIC29; 
			
			
			
	START_MUSIC29:
		if (tone_finish29)
			next_state <= START_MUSIC30; 
	START_MUSIC30:
		if (tone_finish30)
			next_state <= START_MUSIC31; 
	START_MUSIC31:
		if (tone_finish31)
			next_state <= START_MUSICst2; 
			
	START_MUSICst2:
		if (tone_finishst2)
			next_state <= START_MUSIC32; 
			
			
	START_MUSIC32:
		if (tone_finish32)
			next_state <= START_MUSIC33; 
	START_MUSIC33:
		if (tone_finish33)
			next_state <= START_MUSIC34; 				
	START_MUSIC34:
		if (tone_finish34)
			next_state <= SLEEP; 
	
	
	
END1:  if (ttone_finish1) next_state <= END2;
END2:  if (ttone_finish2) next_state <= END3;
END3:  if (ttone_finish3)  next_state <= END4;
END4:  if (ttone_finish4)  next_state <= END5;
END5:  if (ttone_finish5)  next_state <= END6;
END6:  if (ttone_finish6)  next_state <= END7;
END7:  if (ttone_finish7)  next_state <= END8;
END8:  if (ttone_finish8)  next_state <= END9;
END9:  if (ttone_finish9)  next_state <= END10;
END10:  if (ttone_finish10)  next_state <= END11;
END11:  if (ttone_finish11)  next_state <= END12;
END12:  if (ttone_finish12)  next_state <= END13;
END13:  if (ttone_finish13)  next_state <= END14;
END14:  if (ttone_finish14)  next_state <= END15;
END15:  if (ttone_finish15)  next_state <= END16;
END16:  if (ttone_finish16)  next_state <= END17;
END17:  if (ttone_finish17)  next_state <= END18;
END18:  if (ttone_finish18)  next_state <= END19;
END19:  if (ttone_finish19)   next_state <= END20;
END20:  if (ttone_finish20)  next_state <= END21;
END21:  if (ttone_finish21)  next_state <= END22;
END22:  if (ttone_finish22)  next_state <= END23;
END23:  if (ttone_finish23)  next_state <= SLEEP;
	
	
   endcase
end

always_comb begin
SW17 = 1'b0;
SW14 = 1'b0; 
SW13 = 1'b0; 
SW12 = 1'b0; 
SW11 = 1'b0; 
SW10 = 1'b0; 
SW9 = 1'b0; 
SW8 = 1'b0; 
SW7 = 1'b0;
SW6 = 1'b0; 
SW5 = 1'b0; 
SW4 = 1'b0; 
SW3 = 1'b0; 
SW2 = 1'b0; 
SW1 = 1'b0; 
SW0 = 1'b0;
Run_Piano = 1'b1;
	unique case(state)
	SLEEP:;
	RUN_P:
		Run_Piano = 1'b0;
	RUN_P_DONE:
		Run_Piano = 1'b1;
		
	RUN_S:;
	RUN_S_DONE:;
	END_S_DONE:;
	START_MUSIC1:
		SW7 = 1'b1;
	START_MUSIC2:
		SW8 = 1'b1;
	START_MUSIC3:
		SW9 = 1'b1;
	START_MUSIC4:
		SW7 = 1'b1;
	START_MUSIC5:
		SW17 = 1'b1;
	START_MUSIC6:
		SW7 = 1'b1;
	START_MUSIC7:
		SW8 = 1'b1;
	START_MUSIC8:
		SW9 = 1'b1;
	START_MUSIC9:
		SW7 = 1'b1;
	START_MUSIC10:
		SW9 = 1'b1;
	START_MUSIC11:
		SW10 = 1'b1;
	START_MUSIC12:
		SW11 = 1'b1;
	START_MUSIC13:
		SW9 = 1'b1;
	START_MUSIC14:
		SW10 = 1'b1;
	START_MUSIC15:
		SW11 = 1'b1;
	START_MUSIC16:
		SW17 = 1'b1;
	START_MUSIC17:
		SW11 = 1'b1;
	START_MUSIC18:
		SW12 = 1'b1;
	START_MUSIC19:
		SW11 = 1'b1;
	START_MUSIC20:
		SW10 = 1'b1;
	START_MUSIC21:
		SW9 = 1'b1;
	START_MUSIC22:
		SW7 = 1'b1;
	START_MUSIC23:
		SW11 = 1'b1;
	START_MUSIC24:
		SW12 = 1'b1;
	START_MUSIC25:
		SW11 = 1'b1;
	START_MUSIC26:
		SW10 = 1'b1;
	START_MUSIC27:
		SW9 = 1'b1;
	START_MUSIC28:
		SW7 = 1'b1;
		
	START_MUSICst1:
		SW17 = 1'b1;
		
	START_MUSIC29:
		SW8 = 1'b1;
	START_MUSIC30:
		SW4 = 1'b1;
	START_MUSIC31:
		SW7 = 1'b1;

	START_MUSICst2:
		SW17 = 1'b1;
		
		
	START_MUSIC32:
		SW8 = 1'b1;
	START_MUSIC33:
		SW4 = 1'b1;
	START_MUSIC34:
		SW7 = 1'b1;
	
	
	
	
		
END1: SW7 = 1'b1;
END2: SW14 = 1'b1;
END3: SW13 = 1'b1;
END4: SW11 = 1'b1;
END5: SW12 = 1'b1;
END6: SW13 = 1'b1;
END7: SW14 = 1'b1;
END8: SW7 = 1'b1;
END9: SW12 = 1'b1;
END10: SW11 = 1'b1;
END11: SW5 = 1'b1;
END12: SW10 = 1'b1;
END13: SW9 = 1'b1;
END14: SW7 = 1'b1;
END15: SW8 = 1'b1;
END16: SW9 = 1'b1;
END17: SW10 = 1'b1;
END18: SW8 = 1'b1;
END19: SW6 = 1'b1;
END20: SW7 = 1'b1;
END21: SW8 = 1'b1;
END22: SW9 = 1'b1;
END23: SW7 = 1'b1;
	
EFF1: SW4 = 1'b1;
EFF2: SW0 = 1'b1;
	endcase
end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//creating a sw signal for only one clk cycle after the pose edge of anysw signal

logic anySW;
assign anySW = (SW6 || SW5 || SW4 || SW3 || SW2 || SW1 || SW0 || SW14 || SW13 || SW12 || SW11 || SW10 || SW9 || SW8 || SW7);
logic cSW6, cSW5, cSW4, cSW3, cSW2, cSW1, cSW0;
logic cSW14, cSW13, cSW12, cSW11, cSW10, cSW9, cSW8, cSW7;




//////////////////////////////////////////////////////////////////////
halfsec fo1(.Clk, .Reset_h, .SW(SW4), .htone_finish(tttone_finish1), .hcSW(), .hflag(), .hcount(), .hSWD());
halfsec fo2(.Clk, .Reset_h, .SW(SW0), .htone_finish(tttone_finish2), .hcSW(), .hflag(), .hcount(), .hSWD());

halfsec o1(.Clk, .Reset_h, .SW(SW7), .htone_finish(tone_finish1), .hcSW(), .hflag(), .hcount(), .hSWD());
halfsec o2(.Clk, .Reset_h, .SW(SW8), .htone_finish(tone_finish2), .hcSW(), .hflag(), .hcount(), .hSWD());
halfsec o3(.Clk, .Reset_h, .SW(SW9), .htone_finish(tone_finish3), .hcSW(), .hflag(), .hcount(), .hSWD());
halfsec o4(.Clk, .Reset_h, .SW(SW7), .htone_finish(tone_finish4), .hcSW(), .hflag(), .hcount(), .hSWD());
hhhalfsec o5(.Clk, .Reset_h, .SW(SW17), .hhhtone_finish(tone_finish5), .hhhcSW(), .hhhflag(), .hhhcount(), .hhhSWD());
halfsec o6(.Clk, .Reset_h, .SW(SW7), .htone_finish(tone_finish6), .hcSW(), .hflag(), .hcount(), .hSWD());
halfsec o7(.Clk, .Reset_h, .SW(SW8), .htone_finish(tone_finish7), .hcSW(), .hflag(), .hcount(), .hSWD());
halfsec o8(.Clk, .Reset_h, .SW(SW9), .htone_finish(tone_finish8), .hcSW(), .hflag(), .hcount(), .hSWD());
halfsec o9(.Clk, .Reset_h, .SW(SW7), .htone_finish(tone_finish9), .hcSW(), .hflag(), .hcount(), .hSWD());
halfsec o10(.Clk, .Reset_h, .SW(SW9), .htone_finish(tone_finish10), .hcSW(), .hflag(), .hcount(), .hSWD());
halfsec o11(.Clk, .Reset_h, .SW(SW10), .htone_finish(tone_finish11), .hcSW(), .hflag(), .hcount(), .hSWD());
onesec o12(.Clk, .Reset_h, .SW(SW11), .tone_finish(tone_finish12), .cSW(), .flag(), .count(), .SWD());
halfsec o13(.Clk, .Reset_h, .SW(SW9), .htone_finish(tone_finish13), .hcSW(), .hflag(), .hcount(), .hSWD());
halfsec o14(.Clk, .Reset_h, .SW(SW10), .htone_finish(tone_finish14), .hcSW(), .hflag(), .hcount(), .hSWD());
onesec o15(.Clk, .Reset_h, .SW(SW11), .tone_finish(tone_finish15), .cSW(), .flag(), .count(), .SWD());
hhhalfsec o16(.Clk, .Reset_h, .SW(SW17), .hhhtone_finish(tone_finish16), .hhhcSW(), .hhhflag(), .hhhcount(), .hhhSWD());

hhalfsec o17(.Clk, .Reset_h, .SW(SW11), .hhtone_finish(tone_finish17), .hhcSW(), .hhflag(), .hhcount(), .hhSWD());
hhalfsec o18(.Clk, .Reset_h, .SW(SW12), .hhtone_finish(tone_finish18), .hhcSW(), .hhflag(), .hhcount(), .hhSWD());
hhalfsec o19(.Clk, .Reset_h, .SW(SW11), .hhtone_finish(tone_finish19), .hhcSW(), .hhflag(), .hhcount(), .hhSWD());
hhalfsec o20(.Clk, .Reset_h, .SW(SW10), .hhtone_finish(tone_finish20), .hhcSW(), .hhflag(), .hhcount(), .hhSWD());
onesec o21(.Clk, .Reset_h, .SW(SW9), .tone_finish(tone_finish21), .cSW(), .flag(), .count(), .SWD());
halfsec o22(.Clk, .Reset_h, .SW(SW7), .htone_finish(tone_finish22), .hcSW(), .hflag(), .hcount(), .hSWD());
hhalfsec o23(.Clk, .Reset_h, .SW(SW11), .hhtone_finish(tone_finish23), .hhcSW(), .hhflag(), .hhcount(), .hhSWD());
hhalfsec o24(.Clk, .Reset_h, .SW(SW12), .hhtone_finish(tone_finish24), .hhcSW(), .hhflag(), .hhcount(), .hhSWD());
hhalfsec o25(.Clk, .Reset_h, .SW(SW11), .hhtone_finish(tone_finish25), .hhcSW(), .hhflag(), .hhcount(), .hhSWD());
hhalfsec o26(.Clk, .Reset_h, .SW(SW10), .hhtone_finish(tone_finish26), .hhcSW(), .hhflag(), .hhcount(), .hhSWD());
onesec o27(.Clk, .Reset_h, .SW(SW9), .tone_finish(tone_finish27), .cSW(), .flag(), .count(), .SWD());
halfsec o28(.Clk, .Reset_h, .SW(SW7), .htone_finish(tone_finish28), .hcSW(), .hflag(), .hcount(), .hSWD());

hhhalfsec ost1(.Clk, .Reset_h, .SW(SW17), .hhhtone_finish(tone_finishst1), .hhhcSW(), .hhhflag(), .hhhcount(), .hhhSWD());

onesec o29(.Clk, .Reset_h, .SW(SW8), .tone_finish(tone_finish29), .cSW(), .flag(), .count(), .SWD());
onesec o30(.Clk, .Reset_h, .SW(SW4), .tone_finish(tone_finish30), .cSW(), .flag(), .count(), .SWD());
onesec o31(.Clk, .Reset_h, .SW(SW7), .tone_finish(tone_finish31), .cSW(), .flag(), .count(), .SWD());

hhalfsec ost2(.Clk, .Reset_h, .SW(SW17), .hhtone_finish(tone_finishst2), .hhcSW(), .hhflag(), .hhcount(), .hhSWD());

onesec o32(.Clk, .Reset_h, .SW(SW8), .tone_finish(tone_finish32), .cSW(), .flag(), .count(), .SWD());
onesec o33(.Clk, .Reset_h, .SW(SW4), .tone_finish(tone_finish33), .cSW(), .flag(), .count(), .SWD());
onesec o34(.Clk, .Reset_h, .SW(SW7), .tone_finish(tone_finish34), .cSW(), .flag(), .count(), .SWD());






onesec eo1(.Clk, .Reset_h, .SW(SW7), .tone_finish(ttone_finish1), .cSW(), .flag(), .count(), .SWD());
onesec eo2(.Clk, .Reset_h, .SW(SW14), .tone_finish(ttone_finish2), .cSW(), .flag(), .count(), .SWD());
onesec eo3(.Clk, .Reset_h, .SW(SW13), .tone_finish(ttone_finish3), .cSW(), .flag(), .count(), .SWD());
	halfsec eo4(.Clk, .Reset_h, .SW(SW11), .htone_finish(ttone_finish4), .hcSW(), .hflag(), .hcount(), .hSWD());
	halfsec eo5(.Clk, .Reset_h, .SW(SW12), .htone_finish(ttone_finish5), .hcSW(), .hflag(), .hcount(), .hSWD());
onesec eo6(.Clk, .Reset_h, .SW(SW13), .tone_finish(ttone_finish6), .cSW(), .flag(), .count(), .SWD());
onesec eo7(.Clk, .Reset_h, .SW(SW14), .tone_finish(ttone_finish7), .cSW(), .flag(), .count(), .SWD());
onesec eo8(.Clk, .Reset_h, .SW(SW7), .tone_finish(ttone_finish8), .cSW(), .flag(), .count(), .SWD());
onesec eo9(.Clk, .Reset_h, .SW(SW12), .tone_finish(ttone_finish9), .cSW(), .flag(), .count(), .SWD());
onesec eo10(.Clk, .Reset_h, .SW(SW11), .tone_finish(ttone_finish10), .cSW(), .flag(), .count(), .SWD());
onesec eo11(.Clk, .Reset_h, .SW(SW5), .tone_finish(ttone_finish11), .cSW(), .flag(), .count(), .SWD());
onesec eo12(.Clk, .Reset_h, .SW(SW10), .tone_finish(ttone_finish12), .cSW(), .flag(), .count(), .SWD());
onesec eo13(.Clk, .Reset_h, .SW(SW9), .tone_finish(ttone_finish13), .cSW(), .flag(), .count(), .SWD());
	halfsec eo14(.Clk, .Reset_h, .SW(SW7), .htone_finish(ttone_finish14), .hcSW(), .hflag(), .hcount(), .hSWD());
	halfsec eo15(.Clk, .Reset_h, .SW(SW8), .htone_finish(ttone_finish15), .hcSW(), .hflag(), .hcount(), .hSWD());
onesec eo16(.Clk, .Reset_h, .SW(SW9), .tone_finish(ttone_finish16), .cSW(), .flag(), .count(), .SWD());
onesec eo17(.Clk, .Reset_h, .SW(SW10), .tone_finish(ttone_finish17), .cSW(), .flag(), .count(), .SWD());
onesec eo18(.Clk, .Reset_h, .SW(SW8), .tone_finish(ttone_finish18), .cSW(), .flag(), .count(), .SWD());
	halfsec eo19(.Clk, .Reset_h, .SW(SW6), .htone_finish(ttone_finish19), .hcSW(), .hflag(), .hcount(), .hSWD());
	halfsec eo20(.Clk, .Reset_h, .SW(SW7), .htone_finish(ttone_finish20), .hcSW(), .hflag(), .hcount(), .hSWD());
onesec eo21(.Clk, .Reset_h, .SW(SW8), .tone_finish(ttone_finish21), .cSW(), .flag(), .count(), .SWD());
onesec eo22(.Clk, .Reset_h, .SW(SW9), .tone_finish(ttone_finish22), .cSW(), .flag(), .count(), .SWD());
onesec eo23(.Clk, .Reset_h, .SW(SW7), .tone_finish(ttone_finish23), .cSW(), .flag(), .count(), .SWD());


endmodule 



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////



module onesec(
input logic Clk, Reset_h,
input logic SW,

output logic tone_finish,
output logic cSW,
output reg flag,

output reg [25:0] count,
output logic SWD

);

always_ff @ (posedge Clk)
begin 
	if (~SW) begin  
		cSW <= 1'b0;
		flag <= 1'b0;
	end 
	else if (SW && (cSW == 1'b0) && (flag == 1'b0)) begin  
		cSW <=1'b1;
		flag <= 1'b1;		
		end 
	else if (SW && (cSW == 1'b1))
		cSW <=1'b0;
end 


always_ff @ (posedge Clk)
begin 
	if (Reset_h)
		count <= 25'b0;
	else if (cSW)
		SWD <= 1'b1;
	else if ( tone_finish == 1'b1)
		begin 
		tone_finish <= 1'b0;
		end 
	else if ( count == 25'b1100000000000000000000000)
		begin 
			tone_finish <= 1'b1;
			count <= 25'b0;
			SWD <= 1'b0;
		end 
	else if (SWD)
		count++;
end 



endmodule


module halfsec(
input logic Clk, Reset_h,
input logic SW,

output logic htone_finish,
output logic hcSW,
output reg hflag,

output reg [25:0] hcount,
output logic hSWD

);

always_ff @ (posedge Clk)
begin 
	if (~SW) begin  
		hcSW <= 1'b0;
		hflag <= 1'b0;
	end 
	else if (SW && (hcSW == 1'b0) && (hflag == 1'b0)) begin  
		hcSW <=1'b1;
		hflag <= 1'b1;		
		end 
	else if (SW && (hcSW == 1'b1))
		hcSW <=1'b0;
end 


always_ff @ (posedge Clk)
begin 
	if (Reset_h)
		hcount <= 25'b0;
	else if (hcSW)
		hSWD <= 1'b1;
	else if ( htone_finish == 1'b1)
		begin 
		htone_finish <= 1'b0;
		end 
	else if ( hcount == 25'b0111110000000000000000000)
		begin 
			htone_finish <= 1'b1;
			hcount <= 25'b0;
			hSWD <= 1'b0;
		end 
	else if (hSWD)
		hcount++;
end 



endmodule


module hhalfsec(
input logic Clk, Reset_h,
input logic SW,

output logic hhtone_finish,
output logic hhcSW,
output reg hhflag,

output reg [25:0] hhcount,
output logic hhSWD

);

always_ff @ (posedge Clk)
begin 
	if (~SW) begin  
		hhcSW <= 1'b0;
		hhflag <= 1'b0;
	end 
	else if (SW && (hhcSW == 1'b0) && (hhflag == 1'b0)) begin  
		hhcSW <=1'b1;
		hhflag <= 1'b1;		
		end 
	else if (SW && (hhcSW == 1'b1))
		hhcSW <=1'b0;
end 


always_ff @ (posedge Clk)
begin 
	if (Reset_h)
		hhcount <= 25'b0;
	else if (hhcSW)
		hhSWD <= 1'b1;
	else if ( hhtone_finish == 1'b1)
		begin 
		hhtone_finish <= 1'b0;
		end 
	else if ( hhcount == 25'b0011110000000000000000000)
		begin 
			hhtone_finish <= 1'b1;
			hhcount <= 25'b0;
			hhSWD <= 1'b0;
		end 
	else if (hhSWD)
		hhcount++;
end 



endmodule



module hhhalfsec(
input logic Clk, Reset_h,
input logic SW,

output logic hhhtone_finish,
output logic hhhcSW,
output reg hhhflag,

output reg [25:0] hhhcount,
output logic hhhSWD

);

always_ff @ (posedge Clk)
begin 
	if (~SW) begin  
		hhhcSW <= 1'b0;
		hhhflag <= 1'b0;
	end 
	else if (SW && (hhhcSW == 1'b0) && (hhhflag == 1'b0)) begin  
		hhhcSW <=1'b1;
		hhhflag <= 1'b1;		
		end 
	else if (SW && (hhhcSW == 1'b1))
		hhhcSW <=1'b0;
end 


always_ff @ (posedge Clk)
begin 
	if (Reset_h)
		hhhcount <= 25'b0;
	else if (hhhcSW)
		hhhSWD <= 1'b1;
	else if ( hhhtone_finish == 1'b1)
		begin 
		hhhtone_finish <= 1'b0;
		end 
	else if ( hhhcount == 25'b0000000000000000010000000)
		begin 
			hhhtone_finish <= 1'b1;
			hhhcount <= 25'b0;
			hhhSWD <= 1'b0;
		end 
	else if (hhhSWD)
		hhhcount++;
end 



endmodule
