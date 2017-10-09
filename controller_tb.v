`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Main testbench for compressor unit
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module controller_tb;
	// Input
	reg CLK;
	reg nRST;
	reg [103:0] in;

	// Output
	reg [1:58] out; // 7*8+2=58 //expected: h34a5e0599802ccf

	// Instantiate the Unit Under Test (UUT)
	controller uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		in = 104'b0110_1000_0110_1001_0111_0000_0010_0000_0110_1000_0110_1111_0111_0000_0010_0000_0110_1000_0110_0001_0111_0000_0111_0000_0111_1001;

		// Wait 10 ns for global reset to finish
		#10;
			nRST = 1;
	end
	parameter DELAY = 1;
	always
		#DELAY CLK =~CLK;
      
endmodule
