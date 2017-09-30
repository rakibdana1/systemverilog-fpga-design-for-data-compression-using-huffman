`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Sort the symbol frequency array
// freq: 7 bit frequency array of 7 characters.
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module sort_frequencies(CLK,nRST,freq,charsIn, sorted, charsOut);
	input	CLK;
	input	nRST;
	input[6:0] freq[0:6];
	input[6:0] charsIn[0:6];
	output[6:0] sorted[0:6];
	output[6:0] charsOut[0:6];

	integer i, j;
	reg [6:0] array[1:7];
	reg [6:0] arrayChar[1:7];
	reg[6:0] sorted[0:6];
	reg[6:0] charsOut[0:6];
	reg [6:0] temp;
	reg [6:0] tempChar;

always @(posedge CLK or negedge nRST) begin
	if(!nRST) begin
		for(i=1;i<8;i=i+1) begin
			array[i] <= 7'b000_0000;
			arrayChar[i] <= 7'b000_0000;
			sorted[i-1] <= 7'b000_0000;
			charsOut[i-1] <= 7'b000_0000;
		end
		temp <= 7'b000_0000;
		tempChar <= 7'b000_0000;
	end
	else begin
		for (i = 1; i < 8; i=i+1) begin
			array[i] <= freq[i-1];// get the frequencies
			arrayChar[i] <= charsIn[i-1];// get the chars
		end
  		for (i = 7; i > 0; i = i - 1) begin
  			for (j = 1 ; j < i; j = j + 1) begin
				if (array[j] < array[j + 1]) begin
					temp = array[j];
					array[j] = array[j + 1];
					array[j + 1] = temp;
				// Sort associate char
					tempChar = arrayChar[j];
					arrayChar[j] = arrayChar[j + 1];
					arrayChar[j + 1] = tempChar;
				end 
			end
		end 
		for (i = 0; i < 7; i=i+1) begin
			sorted[i] <= array[7-i][6:0];
			charsOut[i] <= arrayChar[7-i];
		end
	end
end
endmodule
