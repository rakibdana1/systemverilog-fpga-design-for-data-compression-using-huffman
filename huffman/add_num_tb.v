`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: add_num
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module add_num_tb;

	// Inputs
	reg CLK;
	reg nRST;
	reg [6:0] NUM_1;
	reg [6:0] NUM_2;

	// Outputs
	wire [6:0] SUM;

	// Instantiate the Unit Under Test (UUT)
	add_num uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.NUM_1(NUM_1), 
		.NUM_2(NUM_2), 
		.SUM(SUM)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		NUM_1 = 7'b000_0001;
		NUM_2 = 7'b000_0011;

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;
	end
	parameter DALAY = 1;
	always 
		# DALAY CLK = ~CLK;
      
endmodule

