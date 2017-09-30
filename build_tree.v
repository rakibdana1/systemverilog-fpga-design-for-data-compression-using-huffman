`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Generate a new tree is to generate the optimal huffman tree
// freq: Sorted frequency array chars: character array
// nodes: Nodes array of generated Huffman tree as output
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module build_tree(CLK,nRST,freq,chars,nodes);
	input CLK;
	input nRST;
	input [6:0] freq[0:6];
	input [6:0] chars[0:6];

	output [23:0] nodes[0:12];//Not considring register for this output.

	//to calculate temp frequencies in huffman tree
	wire [6:0] new_freq_1; 
	wire [6:0] new_freq_2;
	wire [6:0] new_freq_3;
	wire [6:0] new_freq_4;
	wire [6:0] new_freq_5;
	wire [6:0] new_freq_6;

   // to store temp frequencies in huffman tree
	reg[6:0] freq_temp1, freq_temp2;
	integer i,j;

	// Add two least frequncy and get it on wire new_freq_1
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_temp1= freq[0];
			freq_temp2= freq[1];
		end
	end

	add_num add_1(
		.CLK(CLK),
		.nRST(nRST),
		.NUM_1(freq_temp1),
		.NUM_2(freq_temp2),
		.SUM(new_freq_1)
	);

	assign nodes[0] = {8'b0000_0011,1'b0,8'b0000_0001,chars[0]};
	assign nodes[1] = {8'b0000_0011,1'b1,8'b0000_0010,chars[1]};

	// Sort new 6 frequencies.
	reg[6:0] freq_1[0:5];
	reg[6:0] charsIn_1[0:5];
	wire[6:0] sorted_1[0:5];
	wire[6:0] charsOut_1[0:5];

	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_1[0] <= new_freq_1;
			charsIn_1[0]<=7'b111_1111; //new symbol
			for(i=1;i<6;i++) begin
			freq_1[i]=freq[i+1];
			charsIn_1[i]=chars[i+1];
			end
		end
	end
	
	sort6 s1(
		.CLK(CLK),
		.nRST(nRST),
		.freq(freq_1),
		.charsIn(charsIn_1),
		.sorted(sorted_1),
		.charsOut(charsOut_1)
	);

//********* STEP-2: *************
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_temp1= sorted_1[0];
			freq_temp2= sorted_1[1];
		end
	end	

// Add two least frequncy and get it on wire new_freq_2
	add_num add_2(
		.CLK(CLK),
		.nRST(nRST),
		.NUM_1(freq_temp1),
		.NUM_2(freq_temp2),
		.SUM(new_freq_2)
	);
	assign nodes[2] = {8'b0000_0110,1'b0,8'b0000_0100,charsOut_1[0]};
	assign nodes[3] = {8'b0000_0110,1'b1,8'b0000_0101,charsOut_1[1]};

	// Sort new 5 frequencies.
	reg[6:0] freq_2[0:4];
	reg[6:0] charsIn_2[0:4];
	wire[6:0] sorted_2[0:4];
	wire[6:0] charsOut_2[0:4];
	
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_2[0]=new_freq_2;
			charsIn_2[0]=7'b111_1111; //new symbol
			for(i=1;i<5;i++) begin
				freq_2[i]=sorted_1[i+1];
				charsIn_2[i]=charsOut_1[i+1];
			end
		end
	end	
	
	sort5 s2(
		.CLK(CLK),
		.nRST(nRST),
		.freq(freq_2),
		.charsIn(charsIn_2),
		.sorted(sorted_2),
		.charsOut(charsOut_2)
	);

//********* STEP-3: *************	
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_temp1= sorted_2[0];
			freq_temp2= sorted_2[1];
		end
	end		

// Add two least frequncy and get it on wire new_freq_3
	add_num add_3(
		.CLK(CLK),
		.nRST(nRST),
		.NUM_1(freq_temp1),
		.NUM_2(freq_temp2),
		.SUM(new_freq_3)
	);
	assign nodes[4] = {8'b0000_1001,1'b0,8'b0000_0111,charsOut_2[0]};
	assign nodes[5] = {8'b0000_1001,1'b1,8'b0000_1000,charsOut_2[1]};

	// Sort new 4 frequencies.
	reg[6:0] freq_3[0:3];
	reg[6:0] charsIn_3[0:3];
	wire[6:0] sorted_3[0:3];
	wire[6:0] charsOut_3[0:3];
	
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_3[0]= new_freq_3;
			charsIn_3[0]= 7'b111_1111; //new symbol
			for(i=1;i<4;i++) begin
				freq_3[i]=sorted_2[i+1];
				charsIn_3[i]=charsOut_2[i+1];
			end
		end
	end	
	
	sort4 s3(
		.CLK(CLK),
		.nRST(nRST),
		.freq(freq_3),
		.charsIn(charsIn_3),
		.sorted(sorted_3),
		.charsOut(charsOut_3)
	);

//********* STEP-4: *************
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_temp1= sorted_3[0];
			freq_temp2= sorted_3[1];
		end
	end		

// Add two least frequncy and get it on wire new_freq_4
	add_num add_4(
		.CLK(CLK),
		.nRST(nRST),
		.NUM_1(freq_temp1),
		.NUM_2(freq_temp2),
		.SUM(new_freq_4)
	);
	assign nodes[6] = {8'b0000_1111,1'b0,8'b0000_1010,charsOut_3[0]};
	assign nodes[7] = {8'b0000_1111,1'b1,8'b0000_1011,charsOut_3[1]};

	// Sort new 3 frequencies.
	reg[6:0] freq_4[0:2];
	reg[6:0] charsIn_4[0:2];
	wire[6:0] sorted_4[0:2];
	wire[6:0] charsOut_4[0:2];
	
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_4[0]= new_freq_4;
			charsIn_4[0]=7'b111_1111; //new symbol
			for(i=1;i<3;i++) begin
				freq_4[i]=sorted_3[i+1];
				charsIn_4[i]=charsOut_3[i+1];
			end
		end
	end	
	
	sort3 s4(
		.CLK(CLK),
		.nRST(nRST),
		.freq(freq_4),
		.charsIn(charsIn_4),
		.sorted(sorted_4),
		.charsOut(charsOut_4)
	);

//********* STEP-5: *************
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_temp1= sorted_4[0];
			freq_temp2= sorted_4[1];
		end
	end		

// Add two least frequncy and get it on wire new_freq_5
	add_num add_5(
		.CLK(CLK),
		.nRST(nRST),
		.NUM_1(freq_temp1),
		.NUM_2(freq_temp2),
		.SUM(new_freq_5)
	);
	assign nodes[8] = {8'b0001_0010,1'b0,8'b0001_0000,charsOut_4[0]};
	assign nodes[9] = {8'b0001_0010,1'b1,8'b0001_0001,charsOut_4[1]};

	// Sort new 2 frequencies.
	reg[6:0] freq_5[0:1];
	reg[6:0] charsIn_5[0:1];
	wire[6:0] sorted_5[0:1];
	wire[6:0] charsOut_5[0:1];
	
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_5[0]= new_freq_5;
			charsIn_5[0]=7'b111_1111; //new symbol
			for(i=1;i<2;i++) begin
				freq_5[i]=sorted_4[i+1];
				charsIn_5[i]=charsOut_4[i+1];
			end
		end
	end			

	sort2 s5(
		.CLK(CLK),
		.nRST(nRST),
		.freq(freq_5),
		.charsIn(charsIn_5),
		.sorted(sorted_5),
		.charsOut(charsOut_5)
	);

	//********* STEP-6: *************
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_temp1= sorted_5[0];
			freq_temp2= sorted_5[1];
		end
	end		
	// Add two least frequncy and get it on wire new_freq_6
	add_num add_6(
		.CLK(CLK),
		.nRST(nRST),
		.NUM_1(freq_temp1),
		.NUM_2(freq_temp2),
		.SUM(new_freq_6)
	);

	assign nodes[10] = {8'b0000_1111,1'b0,8'b0001_0011,charsOut_5[0]};
	assign nodes[11] = {8'b0000_1111,1'b1,8'b0001_0100,charsOut_5[1]};
	assign nodes[12] = {8'b0000_0000,1'b1,8'b1111_1111,7'b111_1111};//ROOT: id:FF parent:00

endmodule
