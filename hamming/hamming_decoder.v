`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Hamming(7,4) Decoder
// in: Hamming Encoded data from Sender Side Unit
// out: Hamming Decoded data
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////
module hamming_decoder(CLK, nRST, in, out, error, error_index);
	input	CLK;
	input	nRST;
	input [1:58] in;

	output reg[0:33] out;     // corrected message 
	output reg[2:0] error_index[0:7];  // corrected bit number (1-7)
	output reg[0:7] error;        // 1 if at least one error has been detected


	reg P1, P2, P4;// parity bits
	reg D1, D2, D3, D4; //data bits
	reg[1:7] my_in;

	always@(posedge CLK or negedge nRST)
	begin
		if(!nRST) begin
			out = 34'd0;
		end 
		else begin
			integer i,j,k;
				j=1;
				k=0;
			for(i=1;i<9;i++) begin
				my_in = in[j+:7];
				P1 = my_in[1];
				P2 = my_in[2];
				P4 = my_in[4];

				D1 = my_in[3];
				D2 = my_in[5];
				D3 = my_in[6];
				D4 = my_in[7];

				P1 = P1 ^ D1 ^ D2 ^ D4;
				P2 = P2 ^ D1 ^ D3 ^ D4;
				P4 = P4 ^ D2 ^ D3 ^ D4;

				error[i-1] = 0;
				error_index[i-1] = {P4, P2, P1};
				if(error_index[i-1] != 0) // we have an error and try to correct it
				begin
					error[i-1] = 1;
					my_in[error_index[i-1]] = my_in[error_index[i-1]] ^ 1; //flip the error bit
				end
			 // decode the string
				out[k]   = my_in[3];
				out[k+1] = my_in[5];
				out[k+2] = my_in[6];
				out[k+3] = my_in[7];
				j = j+7;
				k = k+4;
			end
			out[32]=in[57];
			out[33]=in[58];
		end
	end
endmodule


