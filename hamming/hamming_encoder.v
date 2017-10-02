`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Hamming(7,4) Encoder
// in: 4 bit input data
// hammingCode: Hamming(7, 4) code
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////
module hamming_encoder(CLK, nRST, hammingCode);
	input	CLK;
	input	nRST;
	output[1:7] hammingCode;
	
	reg [0:3] in;
	assign in= 4'b1010; //Output should be: 1011 010
	reg [1:7] out;

	always@(posedge CLK or negedge nRST)
	begin
		if(!nRST) begin
			out <= 7'b000_0000;
		end 
		else begin
			//P1 = D1 ^ D2 ^ D4
			out[1]  = in[0] ^ in[1] ^ in[3];
			//P2 = D1 ^ D3 ^ D4 
			out[2]  = in[0] ^ in[2] ^ in[3];
			out[3]  = in[0];//D1
			//P4 = D2 ^ D3 ^ D4 ^ D8 ^ D9 ^ D10 ^ D11
			out[4]  = in[1] ^ in[2] ^ in[3];
			out[5]  = in[1];//D2
			out[6]  = in[2];//D3
			out[7]  = in[3];//D4
		end
	end
	assign  hammingCode = out;
endmodule


