`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Hamming(7,4) Encoder
// in: 4 bit input data
// hammingCode: Hamming(7, 4) code
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////
module hamming_encoder(CLK,nRST,en,in,out);
	input	CLK;
	input	nRST;
	input [0:33] in;//h0563ac3af
	input en;
	output[1:58] out;
	
	reg [0:33] in;
	reg [1:58] out;
	reg [1:58] outTemp;
	reg en;
	integer i,j,k;
	always@(posedge CLK or negedge nRST)
	begin
		if(!nRST) begin
			outTemp= 58'd0;
		end else if(en==0) begin
		end
		else begin
			//@(en == 0);  // Wait till en goes high
			j=0;
			k=0;
			outTemp= 58'd0;
			for(i=1;i<9;i++) begin
				outTemp[j+1]  = in[k] ^ in[k+1] ^ in[k+3];//P1 = D1 ^ D2 ^ D4
				outTemp[j+2]  = in[k] ^ in[k+2] ^ in[k+3];//P2 = D1 ^ D3 ^ D4 
				outTemp[j+3]  = in[k];//D1
				outTemp[j+4]  = in[k+1] ^ in[k+2] ^ in[k+3];//P4 = D2 ^ D3 ^ D4
				outTemp[j+5]  = in[k+1];//D2
				outTemp[j+6]  = in[k+2];//D3
				outTemp[j+7]  = in[k+3];//D4
				j= j+7;
				k= k+4;
			end
			outTemp[j+1]=in[k];
			outTemp[j+2]=in[k+1];//remaining bits
			out = outTemp[1:58];
		end
	
	end
	
endmodule


