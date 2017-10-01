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

		nodes[0] = 24'h0800ef;
		nodes[1] = 24'h088179;
		nodes[2] = 24'h090261;
		nodes[3] = 24'h0981e9;
		nodes[4] = 24'h0a047f;
		nodes[5] = 24'h0a82a0;
		nodes[6] = 24'h0b04ff;
		nodes[7] = 24'h0b8368;
		nodes[8] = 24'h0c057f;
		nodes[9] = 24'h0c83f0;
		nodes[10] = 24'h0d067f;
		nodes[11] = 24'h0d85ff;
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

