`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Sort 4 input numbers in freq[4] array and return result in 'sorted'
// sorted[3] ... [0]: [Most frequent] .... [Least frequent]
// Caution: Each frequency should be 7 bits.
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////


module sort4(CLK,nRST,freq,sorted);
	input	CLK;
	input	nRST;
	input[6:0] freq[0:3];
	output[6:0] sorted[0:3];

	integer i, j;
	reg [6:0] array[1:4];
	reg[6:0] sorted[0:3];
	reg [6:0] temp;

always @(posedge CLK or negedge nRST) begin
	if(!nRST) begin
		for(i=1;i<5;i=i+1) begin
			array[i] <= 7'b000_0000;
			sorted[i-1] <= 7'b000_0000;
		end
		temp <= 7'b000_0000;
	end
	else begin
		for (i = 1; i < 5; i=i+1) begin
			array[i] <= freq[i-1];// get the frequencies
		end
  		for (i = 4; i > 0; i = i - 1) begin
  			for (j = 1 ; j < i; j = j + 1) begin
				if (array[j] < array[j + 1]) begin
					temp = array[j];
					array[j] = array[j + 1];
					array[j + 1] = temp;
				end 
			end
		end 
	sorted[0] <= array[4][6:0];
	sorted[1] <= array[3][6:0];
	sorted[2] <= array[2][6:0];
	sorted[3] <= array[1][6:0];
	end
end

endmodule
