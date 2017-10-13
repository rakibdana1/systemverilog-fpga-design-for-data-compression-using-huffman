`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Generate Huffman Codes
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

/*              |   23 --- 16   |   15   |  14 --- 7  | 6 --- 0
/*              |    0-255      |   0-1  |   0-255    |  0-127
/*              | parent number | 0 or 1 | node_id    | character
******************************************************************/

module generate_code(CLK,nRST,nodes,characters,code,codeLen);
	input CLK;
	input nRST;
	input [6:0] characters[0:6];//input is 7 unique chars
	input [23:0] nodes[0:12]; // total characters

	output [6:0] code[0:6]; //max code length <= unique characters
	output [6:0] codeLen[0:6];
	reg [6:0] code[0:6]; //[charCount:0] max code length <= unique characters
	reg [6:0] codeLen[0:6];
	
	reg[6:0] tc;//temprary code reg. Holds a single bit in each byte
	integer len=0;//code length
	reg [23:0] tNode;

	integer nodeCount= 13;//Total nodes in huffman tree
	integer charCount= 7;//Total unique characters

	function void FindRoot;
		reg [23:0] aNode;//local
		integer i;
		begin
		for (i=0; i<nodeCount;i++) begin // For all nodes
			aNode= nodes[i]; // aNode is current node
			if (tNode[23:16] == aNode[14:7]) begin
				tc[len]= tNode[15];//15th bit of nodes is codebit
				len++;
			//aNode is parent of tNode. Is it root?
				if(aNode[23:16]==8'b0000_0000) begin//or frequency==nodeCount or node_id = 8'b1111_1111
					return;
				end else begin
					tNode=aNode;
					FindRoot();
				end
			end
		end
		end
	endfunction

	always@(posedge CLK or negedge nRST)
	begin
		if(!nRST) begin
		// init
		end 
		else begin 
			// Do code generation
			integer i,j,k;
			for(i= 0;i < charCount;i++) begin // For all character we are going to find codeword
				for(j=0; j<charCount; j++) begin
					code[i][j]= 1'b0;
				end
				codeLen[i]=1'b0;
			end
			for(i= 0;i < charCount;i++) begin // For all character we are going to find codeword
				for(j=0; j<nodeCount; j++) begin
					tNode= nodes[j];//current node
					if (characters[i] == tNode[6:0]) begin
					// Got the character. tNode is a leaf nodes. Lets back track to root.
						break;
					end
				end
				len=0;
				FindRoot();
				for(k=0;k<len;k++) begin
					if (tc[k] == 1'b0) begin
						code[i][k]= 1'b0;
					end else begin
						code[i][k]= 1'b1;
					end
				end
				codeLen[i]= len;
			end
		end
	end
endmodule
