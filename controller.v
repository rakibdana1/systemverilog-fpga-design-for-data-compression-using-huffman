`timescale 1ns / 1ps
`include "bitstuffing/bit_compress.v"
`include "huffman/count_characters.v"
`include "huffman/sort_frequencies.v"
`include "huffman/build_tree.v"
`include "huffman/generate_code.v"
`include "huffman/coding.v"
`include "hamming/hamming_encoder.v"
//////////////////////////////////////////////////////////////////////////////////
// Controller
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////
module controller(CLK,nRST,in,out);
	input CLK;
	input nRST;
	input [103:0] in;//total 13 characters
	output out[1:58];

	wire [90:0] bitCompressOut;//h68d3c1068dfc1068c3c3879
	// Bit stuffing
	bit_compress bc (
		.CLK(CLK), 
		.nRST(nRST), 
		.in(in), 
		.out(bitCompressOut)
	);
	
	wire [6:0] freq[0:6];
	wire [6:0] CHARS[0:6];
	// Finding frequencies
	count_characters cc (
		.CLK(CLK), 
		.nRST(nRST), 
		.stringIn(bitCompressOut), 
		.freq(freq),
		.characters(CHARS)
	);
	
	wire [6:0] sorted[0:6];
	wire [6:0] charsOut[0:6];
	//Sort frequencies
	sort_frequencies sf (
		.CLK(CLK), 
		.nRST(nRST), 
		.freq(freq), 
		.charsIn(CHARS),
		.sorted(sorted),
		.charsOut(charsOut)
	);
	
	reg [7:0] id[0:6];
	initial begin
		id[0] = 8'd1;
		id[1] = 8'd2;
		id[2] = 8'd3;
		id[3] = 8'd4;
		id[4] = 8'd5;
		id[5] = 8'd6;
		id[6] = 8'd7;
	end
	
	wire [23:0] nodes[0:12];
	reg done;
	//Building Huffman tree
	build_tree bt (
		.CLK(CLK), 
		.nRST(nRST), 
		.freq(sorted),
		.chars(charsOut), 
		.id(id),
		.nodes(nodes),
		.done(done)
	);
	
	wire [6:0] code[0:6]; //[6:0] max code length <= unique characters
	wire [6:0] codeLen[0:6];
	// Generate huffman codes
	generate_code gc (
		.CLK(CLK), 
		.nRST(nRST), 
		.nodes(nodes), 
		.characters(charsOut), 
		.code(code), 
		.codeLen(codeLen)
	);
	
	wire [0:33] huffmanCompress;
	wire integer length;
	// Huffman compression with generated code
	coding compression (
		.CLK(CLK), 
		.nRST(nRST), 
		.in(bitCompressOut),
		.chars(charsOut),
		.code(code),
		.codeLen(codeLen),
		.out(huffmanCompress),
		.length(length)
	);
	
	reg [1:58] out; // 7*8+2=58
	// Hamming encoding
	hamming_encoder he (
		.CLK(CLK), 
		.nRST(nRST), 
		.en(done),
		.in(huffmanCompress),
		.out(out)
	);
endmodule

