`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Generate Huffman Codes
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////
module coding(CLK,nRST,code,codeLen);
	input CLK;
	input nRST;
	output [6:0] code[0:6]; //max code length <= total characters(7)
	output [6:0] codeLen[0:6];
	
	reg [90:0] data;//reg??
	wire [6:0] freq[0:6];
	wire [6:0] chars[0:6];
	
	//Input: hip hop happy
	assign data=91'b110_1000_110_1001_111_0000_010_0000_110_1000_110_1111_111_0000_010_0000_110_1000_110_0001_111_0000_111_0000_111_1001;
	integer done1,done2,done3,done4;
	count_characters count (
		.CLK(CLK), 
		.nRST(nRST), 
		.stringIn(data), 
		.freq(freq),
		.characters(chars),
		.done(done1)
	);

	reg [6:0] freqIn[0:6];
	reg [6:0] charsIn[0:6];
	wire [6:0] sorted[0:6];
	wire [6:0] charsOut[0:6];

	always @ (posedge CLK  or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freqIn = freq;
			charsIn= chars;
		end
	end

	sort_frequencies sort (
		.CLK(CLK), 
		.nRST(nRST), 
		.freq(freqIn), 
		.charsIn(charsIn),
		.done1(done1),
		.sorted(sorted),
		.charsOut(charsOut),
		.done2(done2)
	);

	reg [6:0] sortedIn[0:6];
	reg [6:0] charsIn2[0:6];
	wire [23:0] nodes[0:12];

	always @ (posedge CLK  or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			sortedIn = sorted;
			charsIn2 = charsOut;
		end
	end

	build_tree tree (
		.CLK(CLK), 
		.nRST(nRST), 
		.freq(sortedIn),
		.chars(charsIn2), 
		.nodes(nodes)
	);

	reg [6:0] charsIn3[0:6];
	reg [23:0] nodesIn[0:12]; // total characters

	// Outputs
	wire [6:0] code[0:6]; //[2:0] max code length <= total characters
	wire [6:0] codeLen[0:6];

	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			nodesIn = nodes;
			charsIn3 = charsIn2;
		end
	end

	generate_code codeUnit (
		.CLK(CLK), 
		.nRST(nRST), 
		.nodes(nodesIn), 
		.characters(charsIn3), 
		.code(code), 
		.codeLen(codeLen)
	);

endmodule
