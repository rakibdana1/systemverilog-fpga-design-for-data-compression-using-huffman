`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: hamming_encoder
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module hamming_decoder_tb;

	// Inputs
	reg CLK;
	reg nRST;

	// Outputs
	reg [1:58] in;
	wire [0:33] out;//34h0563ac3af 
	wire [0:7] errorFound;
	wire [2:0] errorIndex[0:7];//we have 8 hamming codes

	// Instantiate the Unit Under Test (UUT)
	hamming_decoder uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.in(in),
		.out(out),
		.error(errorFound),
		.error_index(errorIndex)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
	 	in = 58'h34b5e1599803ccf;//58'h34a5e0599802ccf

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;
	end
	parameter DELAY = 10;
	always 
		# DELAY CLK = ~CLK;

      
endmodule

