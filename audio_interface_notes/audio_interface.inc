-- WARNING: Do NOT edit the input and output ports in this file in a text
-- editor if you plan to continue editing the block that represents it in
-- the Block Editor! File corruption is VERY likely to occur.

-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-- Generated by Quartus II 64-Bit Version 15.0 (Build Build 153 07/15/2015)
-- Created on Sat Apr 23 14:51:51 2016

FUNCTION audio_interface (LDATA[15..0], RDATA[15..0], clk, Reset, INIT, AUD_BCLK, AUD_ADCDAT, AUD_DACLRCK, AUD_ADCLRCK)
	RETURNS (INIT_FINISH, adc_full, data_over, AUD_MCLK, AUD_DACDAT, I2C_SDAT, I2C_SCLK, ADCDATA[31..0]);
