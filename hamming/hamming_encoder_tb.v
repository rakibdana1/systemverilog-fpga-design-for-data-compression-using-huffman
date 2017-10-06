`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: hamming_encoder
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module hamming_encoder_tb;

	// Inputs
	reg CLK;
	reg nRST;

	// Outputs
	reg [1:58] out; // 7*8+2=58
	reg [0:33] in;

	// Instantiate the Unit Under Test (UUT)
	hamming_encoder uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.in(in),
		.out(out)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		in= 34'h300000000;//h0563ac3af

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;
	end
	parameter DELAY = 1;
	always 
		# DELAY CLK = ~CLK;
      
endmodule

