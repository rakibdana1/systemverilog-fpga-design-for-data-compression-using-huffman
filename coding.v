`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Generate Huffman Codes
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////
module coding(CLK,nRST,DATA_OUT);
	input CLK;
	input nRST;
	output [3:0] DATA_OUT;
	
	wire [90:0] string;//reg??
	wire [6:0] freq[0:6];
	wire [6:0] chars[0:6];
	wire [6:0] sorted[0:6];
	wire [6:0] charsOut[0:6];
	wire [23:0] nodes[0:12];
	wire [3:0] code[0:6]; //max code length <= total characters(7)
	wire [3:0] codeLen[0:6];
	
	//Input: hip hop happy
	assign string=91'b110_1000_110_1001_111_0000_010_0000_110_1000_110_1111_111_0000_010_0000_110_1000_110_0001_111_0000_111_0000_111_1001;
	
	count_characters count (
		.CLK(CLK), 
		.nRST(nRST), 
		.stringIn(string), 
		.freq(freq),
		.characters(chars)
	);

	sort_frequencies sort (
		.CLK(CLK), 
		.nRST(nRST), 
		.freq(freq), 
		.charsIn(chars),
		.sorted(sorted),
		.charsOut(charsOut)
	);

	build_tree tree (
		.CLK(CLK), 
		.nRST(nRST), 
		.freq(freq),
		.chars(chars), 
		.nodes(nodes)
	);

	integer nodeCount=13;//Total nodes in huffman tree
	integer charCount=7;//Total unique characters
	generate_code uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.nodes(nodes), 
		.nodeCount(nodeCount), 
		.characters(chars), 
		.charCount(charCount), 
		.code(code), 
		.codeLen(codeLen)
	);

endmodule
