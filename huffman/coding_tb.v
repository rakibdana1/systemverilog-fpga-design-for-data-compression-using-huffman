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
	reg [6:0] code[0:6]; //[6:0] max code length <= unique characters
	reg [6:0] codeLen[0:6];

	// Outputs
	wire [0:33] compress;
	wire integer length;

	// Instantiate the Unit Under Test (UUT)
	coding uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.code(code),
		.codeLen(codeLen),
		.compress(compress),
		.length(length)
	);

	integer i;
	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		for(i=0; i<7; i++) begin
			code[i]= 7'b0;
			codeLen[i]= 7'b0;
		end
		#10;
		nRST = 1;

	end
	parameter DELAY = 1;
	always 
		#DELAY CLK = ~ CLK;
      
endmodule

