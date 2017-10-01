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
	reg [6:0] characters[0:6];
	reg [23:0] nodes[0:12]; // total characters

	// Outputs
	wire [6:0] code[0:6]; //[6:0] max code length <= unique characters
	wire [6:0] codeLen[0:6];

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
		characters[0] = 7'b111_0000;
		characters[1] = 7'b110_1000;
		characters[2] = 7'b010_0000;
		characters[3] = 7'b110_0001;
		characters[4] = 7'b110_1001;
		characters[5] = 7'b110_1111;
		characters[6] = 7'b111_1001;

/*              |   23 --- 16   |   15   |  14 --- 7  | 6 --- 0
/*              |    0-255      |   0-1  |   0-255    |  0-127
/*              | parent number | 0 or 1 | node_id    | character
******************************************************************/

		nodes[0] = 24'h0300f0;
		nodes[1] = 24'h038168;
		nodes[2] = 24'h060279;
		nodes[3] = 24'h0682ef;
		nodes[4] = 24'h0903ff;
		nodes[5] = 24'h098461;
		nodes[6] = 24'h0f057f;
		nodes[7] = 24'h060279;
		nodes[8] = 24'h12087f;
		nodes[9] = 24'h1288a0;
		nodes[10] = 24'h0f09ff;
		nodes[11] = 24'h0f8a7f;
		nodes[12] = 24'h00ffff;

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;
		// Add stimulus here

	end
	parameter DELAY = 1;
	always
		#DELAY CLK = ~CLK; 
      
endmodule

