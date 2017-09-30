`timescale 1ns / 1ps


//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: count_characters
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module count_characters_test;
	// Inputs
	reg CLK;
	reg nRST;
	reg [90:0] CHARACTER_IN;

	// Outputs
	wire [6:0] FREQUENT_OUT[0:6];

	// Instantiate the Unit Under Test (UUT)
	count_characters uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.stringIn(CHARACTER_IN), 
		.freq(FREQUENT_OUT)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		CHARACTER_IN = 91'b110_1000_110_1001_111_0000_010_0000_110_1000_110_1111_111_0000_010_0000_110_1000_110_0001_111_0000_111_0000_111_1001;

		// Wait 10 ns for global reset to finish
		#10;
			nRST = 1;
	end
	parameter DELAY = 1;
	always
		#DELAY CLK =~CLK;
      
endmodule

