`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: coding
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module coding_test;

	// Inputs
	reg CLK;
	reg nRST;
	reg [6:0] chars[0:6];
	reg [6:0] code[0:6]; //[6:0] max code length <= unique characters
	reg [6:0] codeLen[0:6];

	// Outputs
	reg [0:33] out;//h0563ac3af
	wire integer length;
	wire [90:0] in;
	//Input: "hip hop happy"
	assign in=91'b110_1000_110_1001_111_0000_010_0000_110_1000_110_1111_111_0000_010_0000_110_1000_110_0001_111_0000_111_0000_111_1001;


	// Instantiate the Unit Under Test (UUT)
	coding uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.in(in),
		.chars(chars),
		.code(code),
		.codeLen(codeLen),
		.out(out),
		.length(length)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		chars[0] = 7'b1111001;//y
		code[0]= 7'b0001111;
		codeLen[0]= 4;
		
		chars[1] = 7'b1101111;//o
		code[1]= 7'b0001110;
		codeLen[1]= 4;
		
		chars[2] = 7'b1101001;//i
		code[2]= 7'b0000010;
		codeLen[2]= 3;
		
		chars[3] = 7'b1100001;//a
		code[3]= 7'b0000011;
		codeLen[3]= 3;
		
		chars[4] = 7'b0100000;// 
		code[4]= 7'b0000110;
		codeLen[4]= 3;
		
		chars[5] = 7'b1101000;//h
		code[5]= 7'b0000000;
		codeLen[5]= 2;
		
		chars[6] = 7'b1110000;//p
		code[6]= 7'b0000010;
		codeLen[6]= 2;
		#10;
		nRST = 1;

	end
	parameter DELAY = 1;
	always 
		#DELAY CLK = ~ CLK;
      
endmodule

