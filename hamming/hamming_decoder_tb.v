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
	wire [1:7] code;

	// Instantiate the Unit Under Test (UUT)
	hamming_encoder uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.hammingCode(code)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;
	end
	parameter DALAY = 1;
	always 
		# DALAY CLK = ~CLK;
      
endmodule

