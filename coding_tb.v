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
	wire [7:0] DATA_OUT;

	// Instantiate the Unit Under Test (UUT)
	coding uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.DATA_OUT(DATA_OUT)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;

		#10;
		nRST = 1;

	end
	parameter DELAY = 1;
	always 
		#DELAY CLK = ~ CLK;
      
endmodule

