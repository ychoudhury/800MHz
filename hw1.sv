// Generated HW1 Spring'26 assignment hw1_10

module hw1_10(input clk, input reset,input pushin,
        input logic signed [32:0] M00,
        input logic signed [32:0] M01,
        input logic signed [32:0] M02,
        input logic signed [32:0] M03,
        input logic signed [32:0] M04,
        input logic signed [32:0] M05,
        input logic signed [32:0] M06,
        input logic signed [32:0] M07,
        input logic signed [32:0] M08,
        input logic signed [32:0] M09,
        input logic signed [32:0] M10,
        input logic signed [32:0] M11,
        input logic signed [32:0] C00,
        input logic signed [32:0] C01,
        input logic signed [32:0] C02,
        input logic signed [32:0] C03,
        input logic signed [32:0] C04,
        input logic signed [32:0] C05,
        input logic signed [32:0] C06,
        input logic signed [32:0] C07,
        input logic signed [32:0] C08,
        input logic signed [32:0] C09,
        input logic signed [32:0] C10,
        input logic signed [32:0] C11,
        input logic signed [65:0] D00,
        input logic signed [65:0] D01,
        input logic signed [65:0] D02,
        input logic signed [65:0] D03,
        input logic signed [65:0] D04,
        input logic signed [65:0] D05,
        input logic signed [65:0] D06,
        input logic signed [65:0] D07,
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
    reg signed [65:0] DL00;
    reg signed [65:0] DL01;
    reg signed [65:0] DL02;
    reg signed [65:0] DL03;
    reg signed [65:0] DL04;
    reg signed [65:0] DL05;
    reg signed [65:0] DL06;
    reg signed [65:0] DL07;
    reg signed [74:0] rd_d,rdi;
    reg push1,pusho;
    assign rd=rdi;
    assign pushout=pusho;
    always @(*) begin
        rd_d=ML00*(ML11<CL03?CL02:CL00)+((ML02>=ML09?ML03:ML04)*(ML04>CL06?CL01:ML05)+DL07)-((ML08<=ML00?ML10:CL05)*(CL07>ML01?ML02:ML08)+DL05)-(ML10<ML05?ML08:ML02)*CL03+(ML11<CL03?CL02:CL00)^CL04+((ML02>=ML09?ML03:ML04)*(ML04>CL06?CL01:ML05)+DL06)+(ML06*(ML08<=ML00?ML10:CL05)+DL02)+ML07*(CL07>ML01?ML02:ML08)-((ML10<ML05?ML08:ML02)*CL08+DL03)-((ML11<CL03?CL02:CL00)*CL09+DL01)+((ML02>=ML09?ML03:ML04)*CL10+DL04)+((ML04>CL06?CL01:ML05)*CL11+DL00);
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
            pusho <= #1 push1;
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

