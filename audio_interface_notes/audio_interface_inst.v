// Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.


// Generated by Quartus II 64-Bit Version 15.0 (Build Build 153 07/15/2015)
// Created on Sat Apr 23 14:50:35 2016

audio_interface audio_interface_inst
(
	.LDATA(LDATA_sig) ,	// input [15:0] LDATA_sig
	.RDATA(RDATA_sig) ,	// input [15:0] RDATA_sig
	.clk(clk_sig) ,	// input  clk_sig
	.Reset(Reset_sig) ,	// input  Reset_sig
	.INIT(INIT_sig) ,	// input  INIT_sig
	.INIT_FINISH(INIT_FINISH_sig) ,	// output  INIT_FINISH_sig
	.adc_full(adc_full_sig) ,	// output  adc_full_sig
	.data_over(data_over_sig) ,	// output  data_over_sig
	.AUD_MCLK(AUD_MCLK_sig) ,	// output  AUD_MCLK_sig
	.AUD_BCLK(AUD_BCLK_sig) ,	// input  AUD_BCLK_sig
	.AUD_ADCDAT(AUD_ADCDAT_sig) ,	// input  AUD_ADCDAT_sig
	.AUD_DACDAT(AUD_DACDAT_sig) ,	// output  AUD_DACDAT_sig
	.AUD_DACLRCK(AUD_DACLRCK_sig) ,	// input  AUD_DACLRCK_sig
	.AUD_ADCLRCK(AUD_ADCLRCK_sig) ,	// input  AUD_ADCLRCK_sig
	.I2C_SDAT(I2C_SDAT_sig) ,	// output  I2C_SDAT_sig
	.I2C_SCLK(I2C_SCLK_sig) ,	// output  I2C_SCLK_sig
	.ADCDATA(ADCDATA_sig) 	// output [31:0] ADCDATA_sig
);

