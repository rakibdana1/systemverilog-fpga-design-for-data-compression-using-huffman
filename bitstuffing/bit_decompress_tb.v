`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: bit_compress
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////
module bit_decompress_tb;
	// Input
	reg CLK;
	reg nRST;
	reg [90:0] in;

	// Output
	wire [103:0] out;//h68697020686f70206861707079

	// Instantiate the Unit Under Test (UUT)
	bit_decompress uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.in(in), 
		.out(out)
	);
	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		in = 91'h68d3c1068dfc1068c3c3879;

		// Wait 10 ns for global reset to finish
		#10;
			nRST = 1;
	end
	parameter DELAY = 1;
	always
		#DELAY CLK =~CLK;
      
endmodule

