`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Sort the symbol frequency array
// freq: 7 bit frequency array of 4 characters.
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module sort4(CLK, nRST, freq, charsIn, sorted, charsOut);
	input	CLK;
	input	nRST;
	input[6:0] freq[0:3];
	input[6:0] charsIn[0:3];
	output[6:0] sorted[0:3];
	output[6:0] charsOut[0:3];

	integer i, j;
	reg [6:0] array[1:4];
	reg [6:0] arrayChar[1:4];
	reg[6:0] sorted[0:3];
	reg[6:0] charsOut[0:3];
	reg [6:0] temp;
	reg [6:0] tempChar;

always @(posedge CLK or negedge nRST) begin
	if(!nRST) begin
		for(i=1;i<5;i=i+1) begin
			array[i] <= 7'b000_0000;
			arrayChar[i] <= 7'b000_0000;
			sorted[i-1] <= 7'b000_0000;
			charsOut[i-1] <= 7'b000_0000;
		end
		temp <= 7'b000_0000;
		tempChar <= 7'b000_0000;
	end
	else begin
		for (i = 1; i < 5; i=i+1) begin
			array[i] <= freq[i-1];// get the frequencies
			arrayChar[i] <= charsIn[i-1];// get the chars
		end
  		for (i = 4; i > 0; i = i - 1) begin
  			for (j = 1 ; j < i; j = j + 1) begin
				if (array[j] < array[j + 1]) begin
					temp = array[j];
					array[j] = array[j + 1];
					array[j + 1] = temp;
				// Sort associate characters
					tempChar = arrayChar[j];
					arrayChar[j] = arrayChar[j + 1];
					arrayChar[j + 1] = tempChar;
				end 
			end
		end 
		for (i = 0; i < 4; i=i+1) begin
			sorted[i] <= array[4-i][6:0];
			charsOut[i] <= arrayChar[4-i];
		end
	end
end
endmodule
