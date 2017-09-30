`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for generate_code.v
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module generate_code_test;

	// Inputs
	reg CLK;
	reg nRST;
	reg [6:0] characters[0:3];
	reg [23:0] nodes[0:6]; // total characters


	// Outputs
	wire [3:0] code[0:3]; //[2:0] max code length <= total characters
	wire [3:0] codeLen[0:3];

	// Instantiate the Unit Under Test (UUT)
	generate_code uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.nodes(nodes), 
		.characters(characters), 
		.code(code), 
		.codeLen(codeLen)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		characters[0]= 7'b110_0001;
		characters[1]= 7'b110_0010;
		characters[2]= 7'b110_0011;
		characters[3]= 7'b110_0100;

/*              |   23 --- 16   |   15   |  14 --- 7  | 6 --- 0
/*              |    0-255      |   0-1  |   0-255    |  0-127
/*              | parent number | 0 or 1 | node_id    | character
******************************************************************/
/*
		nodes[0] = 24'b000_0011_0_0000_0001_110_0001;
		nodes[1] = 23'b000_0011_1_0000_0001_110_0011;
		nodes[2] = 23'b000_0101_1_0000_0010_111_1111;
		nodes[3] = 23'b000_0100_0_0000_0010_110_0010;
		nodes[4] = 23'b111_1111_1_0000_0100_111_1111;
		nodes[5] = 23'b111_1111_0_0000_0011_110_0100;
		nodes[6] = 23'b000_0000_0_0000_0111_000_0000; */

		nodes[0] = 24'b0000_0011_0_0000_0001_110_0001;
		nodes[1] = 24'b0000_0011_1_0000_0010_110_0011;
		nodes[2] = 24'b0000_0101_1_0000_0011_111_1111;
		nodes[3] = 24'b0000_0101_0_0000_0100_110_0010;
		nodes[4] = 24'b1111_1111_1_0000_0101_111_1111;
		nodes[5] = 24'b1111_1111_0_0000_0110_110_0100;
		nodes[6] = 24'b0000_0000_0_1111_1111_111_1111;

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;
		// Add stimulus here

	end
	parameter DELAY = 1;
	always
		#DELAY CLK = ~CLK; 
      
endmodule

