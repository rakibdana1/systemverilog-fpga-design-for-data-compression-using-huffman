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

	// Outputs
	wire [6:0] code[0:6]; //max code length <= total characters(7)
	wire [6:0] codeLen[0:6];

	// Instantiate the Unit Under Test (UUT)
	coding uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.code(code),
		.codeLen(codeLen)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;

		#100;
		nRST = 1;

	end
	parameter DELAY = 10;
	always 
		#DELAY CLK = ~ CLK;
      
endmodule

