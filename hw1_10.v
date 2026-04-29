// Generated HW1 Spring'26 assignment hw1_10

module hw1_10(
	input clk, 
	input reset,
	input pushin,
        input logic signed [32:0] M00, M01, M02, M03, M04, M05, M06, M07, M08, M09, M10, M11,
        input logic signed [32:0] C00, C01, C02, C03, C04, C05, C06, C07, C08, C09, C10, C11,
        input logic signed [65:0] D00, D01, D02, D03, D04, D05, D06, D07,
        
	output logic pushout,output signed [74:0] rd);
   	reg signed [32:0] ML00,CL00;
        reg signed [32:0] ML01,CL01;
        reg signed [32:0] ML02,CL02;
        reg signed [32:0] ML03,CL03;
        reg signed [32:0] ML04,CL04;
        reg signed [32:0] ML05,CL05;
        reg signed [32:0] ML06,CL06;
        reg signed [32:0] ML07,CL07;
        reg signed [32:0] ML08,CL08;
        reg signed [32:0] ML09,CL09;
        reg signed [32:0] ML10,CL10;
        reg signed [32:0] ML11,CL11;
        reg signed [65:0] DL00, DL01, DL02, DL03, DL04, DL05, DL06, DL07;
    
        reg signed [74:0] rd_d,rdi;
        
	reg push1, push2, push3, push4, push5, push6, push7, pusho;
        
	assign rd=rdi;
        assign pushout=pusho;
       
	// Declare MUX wires for readability
	wire signed [32:0] mux_1 = (ML11 <  CL03) ? CL02 : CL00;
	wire signed [32:0] mux_2 = (ML02 >= ML09) ? ML03 : ML04; 
	wire signed [32:0] mux_3 = (ML04 >  CL06) ? CL01 : ML05;
	wire signed [32:0] mux_4 = (ML08 <= ML00) ? ML10 : CL05;
	wire signed [32:0] mux_5 = (CL07 >  ML01) ? ML02 : ML08;
	wire signed [32:0] mux_6 = (ML10 <  ML05) ? ML08 : ML02;

	// instantiate DW02_mult_5_stage
	wire signed [65:0] mult_1, mult_2, mult_3, mult_4, mult_5, mult_6, mult_7, mult_8, mult_9, mult_10;
	
	DW02_mult_3_stage #( .A_width(33), .B_width(33) ) u_mult_1  ( .A(ML00),   .B(mux_1), .TC(1'b1), .CLK(clk), .PRODUCT(mult_1)  );
	DW02_mult_3_stage #( .A_width(33), .B_width(33) ) u_mult_2  ( .A(mux_2),  .B(mux_3), .TC(1'b1), .CLK(clk), .PRODUCT(mult_2)  );
	DW02_mult_3_stage #( .A_width(33), .B_width(33) ) u_mult_3  ( .A(mux_4),  .B(mux_5), .TC(1'b1), .CLK(clk), .PRODUCT(mult_3)  );
	DW02_mult_3_stage #( .A_width(33), .B_width(33) ) u_mult_4  ( .A(mux_6),  .B(CL03),  .TC(1'b1), .CLK(clk), .PRODUCT(mult_4)  );
	DW02_mult_3_stage #( .A_width(33), .B_width(33) ) u_mult_5  ( .A(ML06),   .B(mux_4), .TC(1'b1), .CLK(clk), .PRODUCT(mult_5)  );
	DW02_mult_3_stage #( .A_width(33), .B_width(33) ) u_mult_6  ( .A(ML07),   .B(mux_5), .TC(1'b1), .CLK(clk), .PRODUCT(mult_6)  );
	DW02_mult_3_stage #( .A_width(33), .B_width(33) ) u_mult_7  ( .A(mux_6),  .B(CL08),  .TC(1'b1), .CLK(clk), .PRODUCT(mult_7)  );
	DW02_mult_3_stage #( .A_width(33), .B_width(33) ) u_mult_8  ( .A(mux_1),  .B(CL09),  .TC(1'b1), .CLK(clk), .PRODUCT(mult_8)  );
	DW02_mult_3_stage #( .A_width(33), .B_width(33) ) u_mult_9  ( .A(mux_2),  .B(CL10),  .TC(1'b1), .CLK(clk), .PRODUCT(mult_9)  );
	DW02_mult_3_stage #( .A_width(33), .B_width(33) ) u_mult_10 ( .A(mux_3),  .B(CL11),  .TC(1'b1), .CLK(clk), .PRODUCT(mult_10) );


	// pipeline alignment registers

	reg signed [65:0] DL00_d1, DL01_d1, DL02_d1, DL03_d1, DL04_d1, DL05_d1, DL06_d1, DL07_d1;
	reg signed [65:0] DL00_d2, DL01_d2, DL02_d2, DL03_d2, DL04_d2, DL05_d2, DL06_d2, DL07_d2;
	
	reg signed [32:0] mux_1_d1, mux_1_d2;
	reg signed [32:0] CL04_d1,  CL04_d2;

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			DL00_d1 <= 0; DL01_d1 <= 0; DL02_d1 <= 0; DL03_d1 <= 0; DL04_d1 <= 0; DL05_d1 <= 0; DL06_d1 <= 0; DL07_d1 <= 0;
			DL00_d2 <= 0; DL01_d2 <= 0; DL02_d2 <= 0; DL03_d2 <= 0; DL04_d2 <= 0; DL05_d2 <= 0; DL06_d2 <= 0; DL07_d2 <= 0;
			mux_1_d1 <= 0; mux_1_d2 <= 0;
			CL04_d1  <= 0; CL04_d2  <= 0;
		end else begin
			// Stage 1
			DL00_d1 <= DL00; DL01_d1 <= DL01; DL02_d1 <= DL02; DL03_d1 <= DL03; DL04_d1 <= DL04; DL05_d1 <= DL05; DL06_d1 <= DL06; DL07_d1 <= DL07;
			mux_1_d1 <= mux_1; CL04_d1 <= CL04;
			
			// Stage 2
			DL00_d2 <= DL00_d1; DL01_d2 <= DL01_d1; DL02_d2 <= DL02_d1; DL03_d2 <= DL03_d1; DL04_d2 <= DL04_d1; DL05_d2 <= DL05_d1; DL06_d2 <= DL06_d1; DL07_d2 <= DL07_d1;
			mux_1_d2 <= mux_1_d1; CL04_d2 <= CL04_d1;
		end
	end


	// Pipelined adder registers
	// Level 1 registers
	reg signed [74:0] add1_L_0, add1_L_1, add1_L_2, add1_L_3;
	reg signed [74:0] add1_R_0, add1_R_1, add1_R_2, add1_R_3, add1_R_4, add1_R_5, add1_R_6;

	// Level 2 registers
	reg signed [74:0] add2_L_0, add2_L_1;
	reg signed [74:0] add2_R_0, add2_R_1, add2_R_2, add2_R_3;

	// Level 3 registers
	reg signed [74:0] add3_L_0;
	reg signed [74:0] add3_R_0, add3_R_1;

	// Level 4 registers
	reg signed [74:0] add4_L_final;
	reg signed [74:0] add4_R_final;


	always @(posedge clk or posedge reset) begin
		if (reset) begin
			add1_L_0 <= 0; add1_L_1 <= 0; add1_L_2 <= 0; add1_L_3 <= 0;
			add1_R_0 <= 0; add1_R_1 <= 0; add1_R_2 <= 0; add1_R_3 <= 0; add1_R_4 <= 0; add1_R_5 <= 0; add1_R_6 <= 0;
			add2_L_0 <= 0; add2_L_1 <= 0;
			add2_R_0 <= 0; add2_R_1 <= 0; add2_R_2 <= 0; add2_R_3 <= 0;
			add3_L_0 <= 0;
			add3_R_0 <= 0; add3_R_1 <= 0;
			add4_L_final <= 0;
			add4_R_final <= 0;
		end else begin
			// --- LEVEL 1: Pair up the multiplier outputs and bypass signals ---
			add1_L_0 <= mult_1 + mult_2;
			add1_L_1 <= DL07_d2 - mult_3;
			add1_L_2 <= mux_1_d2 - mult_4;
			add1_L_3 <= -DL05_d2;

			add1_R_0 <= CL04_d2 + mult_2;
			add1_R_1 <= DL06_d2 + mult_5;
			add1_R_2 <= DL02_d2 + mult_6;
			add1_R_3 <= mult_7 + DL03_d2;   // Evaluated here, subtracted in L2
			add1_R_4 <= mult_8 + DL01_d2;   // Evaluated here, subtracted in L2
			add1_R_5 <= mult_9 + DL04_d2;
			add1_R_6 <= mult_10 + DL00_d2;

			// --- LEVEL 2: Combine Level 1 results ---
			add2_L_0 <= add1_L_0 + add1_L_1;
			add2_L_1 <= add1_L_2 + add1_L_3;

			add2_R_0 <= add1_R_0 + add1_R_1;
			add2_R_1 <= add1_R_2 - add1_R_3; // Subtracting group 3
			add2_R_2 <= add1_R_5 - add1_R_4; // Subtracting group 4
			add2_R_3 <= add1_R_6;

			// --- LEVEL 3: Combine Level 2 results ---
			add3_L_0 <= add2_L_0 + add2_L_1;

			add3_R_0 <= add2_R_0 + add2_R_1;
			add3_R_1 <= add2_R_2 + add2_R_3;

			// --- LEVEL 4: Final accumulation ---
			add4_L_final <= add3_L_0;        // Left side is done, pass it through
			add4_R_final <= add3_R_0 + add3_R_1;
		end
	end

	// Final XOR output
	always @(*) begin
		rd_d = add4_L_final ^ add4_R_final;
	end


     always @(posedge(clk) or posedge(reset)) begin
        if(reset) begin
            ML00 <= 0;
            CL00 <= 0;
            ML01 <= 0;
            CL01 <= 0;
            ML02 <= 0;
            CL02 <= 0;
            ML03 <= 0;
            CL03 <= 0;
            ML04 <= 0;
            CL04 <= 0;
            ML05 <= 0;
            CL05 <= 0;
            ML06 <= 0;
            CL06 <= 0;
            ML07 <= 0;
            CL07 <= 0;
            ML08 <= 0;
            CL08 <= 0;
            ML09 <= 0;
            CL09 <= 0;
            ML10 <= 0;
            CL10 <= 0;
            ML11 <= 0;
            CL11 <= 0;
            DL00 <= 0;
            DL01 <= 0;
            DL02 <= 0;
            DL03 <= 0;
            DL04 <= 0;
            DL05 <= 0;
            DL06 <= 0;
            DL07 <= 0;
            pusho <= 0;
            push1 <= 0;
            rdi<=0;
        end else begin
            push1 <= #1 pushin;
            push2 <= #1 push1;
	    push3 <= #1 push2;
	    push4 <= #1 push3;
	    push5 <= #1 push4;
	    push6 <= #1 push5;
	    push7 <= #1 push6;
	    pusho <= #1 push7;
            rdi <= #1 rd_d;
            ML00 <= #1 M00;
            CL00 <= #1 C00;
            ML01 <= #1 M01;
            CL01 <= #1 C01;
            ML02 <= #1 M02;
            CL02 <= #1 C02;
            ML03 <= #1 M03;
            CL03 <= #1 C03;
            ML04 <= #1 M04;
            CL04 <= #1 C04;
            ML05 <= #1 M05;
            CL05 <= #1 C05;
            ML06 <= #1 M06;
            CL06 <= #1 C06;
            ML07 <= #1 M07;
            CL07 <= #1 C07;
            ML08 <= #1 M08;
            CL08 <= #1 C08;
            ML09 <= #1 M09;
            CL09 <= #1 C09;
            ML10 <= #1 M10;
            CL10 <= #1 C10;
            ML11 <= #1 M11;
            CL11 <= #1 C11;
            DL00 <= #1 D00;
            DL01 <= #1 D01;
            DL02 <= #1 D02;
            DL03 <= #1 D03;
            DL04 <= #1 D04;
            DL05 <= #1 D05;
            DL06 <= #1 D06;
            DL07 <= #1 D07;
        end
    end
endmodule

