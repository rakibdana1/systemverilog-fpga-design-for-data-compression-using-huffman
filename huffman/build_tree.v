`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Build huffman tree
// freq: Sorted frequency array 
// chars: character array, id: id of each symbol
// nodes: Nodes array of generated Huffman tree as output
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module build_tree(CLK,nRST,freq,chars,id,nodes,done);
	input CLK;
	input nRST;
	input [6:0] freq[0:6];
	input [6:0] chars[0:6];
	input [7:0] id[0:6];

	output [23:0] nodes[0:12];//Not considring register for this output.
	output done;

	//to calculate temp frequencies in huffman tree
	wire [6:0] new_freq_1; 
	wire [6:0] new_freq_2;
	wire [6:0] new_freq_3;
	wire [6:0] new_freq_4;
	wire [6:0] new_freq_5;
	wire [6:0] new_freq_6;

   // to store temp frequencies in huffman tree
	reg[6:0] freq_temp1, freq_temp2;
	reg[7:0] id8,id9,id10,id11,id12,id13;
	integer i,j;
	reg done;

	// Add two least frequncy and get it on wire new_freq_1
	always @ (posedge CLK  or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			done=0;
			id8=8'd8;
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

	assign nodes[0] = {id8,1'b1,id[0],chars[0]};
	assign nodes[1] = {id8,1'b0,id[1],chars[1]};

	// Sort new 6 frequencies.
	reg[6:0] freq_1[0:5];
	reg[6:0] charsIn_1[0:5];
	reg[7:0] idIn_1[0:5];
	wire[6:0] sorted_1[0:5];
	wire[6:0] charsOut_1[0:5];
	wire[7:0] idOut_1[0:5];

	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_1[0] <= new_freq_1;
			charsIn_1[0]<=7'b111_1111; //new symbol
			idIn_1[0]=id8;//new id
			for(i=1;i<6;i++) begin
			freq_1[i]=freq[i+1];
			charsIn_1[i]=chars[i+1];
			idIn_1[i]=id[i+1];
			end
		end
	end
	
	sort6 s1(
		.CLK(CLK),
		.nRST(nRST),
		.freq(freq_1),
		.charsIn(charsIn_1),
		.idIn(idIn_1),
		.sorted(sorted_1),
		.charsOut(charsOut_1),
		.idOut(idOut_1)
	);

//********* STEP-2: *************
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			id9=8'd9;
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

	assign nodes[2] = {id9,1'b1,idOut_1[0],charsOut_1[0]};
	assign nodes[3] = {id9,1'b0,idOut_1[1],charsOut_1[1]};

	// Sort new 5 frequencies.
	reg[6:0] freq_2[0:4];
	reg[6:0] charsIn_2[0:4];
	reg[7:0] idIn_2[0:4];
	wire[6:0] sorted_2[0:4];
	wire[6:0] charsOut_2[0:4];
	wire[7:0] idOut_2[0:4];
	
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_2[0]=new_freq_2;
			charsIn_2[0]=7'b111_1111; //new symbol
			idIn_2[0]=id9;//new id
			for(i=1;i<5;i++) begin
				freq_2[i]=sorted_1[i+1];
				charsIn_2[i]=charsOut_1[i+1];
				idIn_2[i]=idOut_1[i+1];
			end
		end
	end	
	
	sort5 s2(
		.CLK(CLK),
		.nRST(nRST),
		.freq(freq_2),
		.charsIn(charsIn_2),
		.idIn(idIn_2),
		.sorted(sorted_2),
		.charsOut(charsOut_2),
		.idOut(idOut_2)
	);

//********* STEP-3: *************	
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			id10=8'd10;
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

	assign nodes[4] = {id10,1'b1,idOut_2[0],charsOut_2[0]};
	assign nodes[5] = {id10,1'b0,idOut_2[1],charsOut_2[1]};

	// Sort new 4 frequencies.
	reg[6:0] freq_3[0:3];
	reg[6:0] charsIn_3[0:3];
	reg[7:0] idIn_3[0:3];
	wire[6:0] sorted_3[0:3];
	wire[6:0] charsOut_3[0:3];
	wire[7:0] idOut_3[0:3];
	
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_3[0]= new_freq_3;
			charsIn_3[0]= 7'b111_1111; //new symbol
			idIn_3[0]=id10;//new id
			for(i=1;i<4;i++) begin
				freq_3[i]=sorted_2[i+1];
				charsIn_3[i]=charsOut_2[i+1];
				idIn_3[i]=idOut_2[i+1];
			end
		end
	end	
	
	sort4 s3(
		.CLK(CLK),
		.nRST(nRST),
		.freq(freq_3),
		.charsIn(charsIn_3),
		.idIn(idIn_3),
		.sorted(sorted_3),
		.charsOut(charsOut_3),
		.idOut(idOut_3)
	);

//********* STEP-4: *************
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			id11=8'd11;
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

	assign nodes[6] = {id11,1'b1,idOut_3[0],charsOut_3[0]};
	assign nodes[7] = {id11,1'b0,idOut_3[1],charsOut_3[1]};

	// Sort new 3 frequencies.
	reg[6:0] freq_4[0:2];
	reg[6:0] charsIn_4[0:2];
	reg[7:0] idIn_4[0:2];
	wire[6:0] sorted_4[0:2];
	wire[6:0] charsOut_4[0:2];
	wire[7:0] idOut_4[0:2];
	
	always @ (posedge CLK or negedge nRST) begin
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_4[0]= new_freq_4;
			charsIn_4[0]=7'b111_1111; //new symbol
			idIn_4[0]=id11; //new id
			for(i=1;i<3;i++) begin
				freq_4[i]=sorted_3[i+1];
				charsIn_4[i]=charsOut_3[i+1];
				idIn_4[i]=idOut_3[i+1];
			end
		end
	end	
	
	sort3 s4(
		.CLK(CLK),
		.nRST(nRST),
		.freq(freq_4),
		.charsIn(charsIn_4),
		.idIn(idIn_4),
		.sorted(sorted_4),
		.charsOut(charsOut_4),
		.idOut(idOut_4)
	);

//********* STEP-5: *************
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			id12=8'd12;
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

	assign nodes[8] = {id12,1'b1,idOut_4[0],charsOut_4[0]};
	assign nodes[9] = {id12,1'b0,idOut_4[1],charsOut_4[1]};

	// Sort new 2 frequencies.
	reg[6:0] freq_5[0:1];
	reg[6:0] charsIn_5[0:1];
	reg[7:0] idIn_5[0:1];
	wire[6:0] sorted_5[0:1];
	wire[6:0] charsOut_5[0:1];
	wire[7:0] idOut_5[0:1];
	
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			freq_5[0]= new_freq_5;
			charsIn_5[0]=7'b111_1111; //new symbol
			idIn_5[0]=id12;//new id
			for(i=1;i<2;i++) begin
				freq_5[i]=sorted_4[i+1];
				charsIn_5[i]=charsOut_4[i+1];
				idIn_5[i]=idOut_4[i+1];
			end
		end
	end			

	sort2 s5(
		.CLK(CLK),
		.nRST(nRST),
		.freq(freq_5),
		.charsIn(charsIn_5),
		.idIn(idIn_5),
		.sorted(sorted_5),
		.charsOut(charsOut_5),
		.idOut(idOut_5)
	);

	//********* STEP-6: *************
	always @ (posedge CLK or negedge nRST) begin 
		if(!nRST) begin
			// init
		end 
		else begin 
			id13=8'hff;
			freq_temp1= sorted_5[0];
			freq_temp2= sorted_5[1];
			done=1;
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

/* 	assign nodes[0] = {id_temp,1'b0,id[0],chars[0]};
	assign nodes[1] = {id_temp,1'b1,id[1],chars[1]};
	assign nodes[2] = {id_temp,1'b0,idOut_1[0],charsOut_1[0]};
	assign nodes[3] = {id_temp,1'b1,idOut_1[1],charsOut_1[1]};
	assign nodes[4] = {id_temp,1'b0,idOut_2[0],charsOut_2[0]};
	assign nodes[5] = {id_temp,1'b1,idOut_2[1],charsOut_2[1]};
	assign nodes[6] = {id_temp,1'b0,idOut_3[0],charsOut_3[0]};
	assign nodes[7] = {id_temp,1'b1,idOut_3[1],charsOut_3[1]};
	assign nodes[8] = {id_temp,1'b0,idOut_4[0],charsOut_4[0]};
	assign nodes[9] = {id_temp,1'b1,idOut_4[1],charsOut_4[1]}; */
	assign nodes[10] = {id13,1'b1,idOut_5[0],charsOut_5[0]};
	assign nodes[11] = {id13,1'b0,idOut_5[1],charsOut_5[1]};
	assign nodes[12] = {8'b0000_0000,1'b1,8'b1111_1111,7'b111_1111};//ROOT: id:FF parent:00

endmodule
