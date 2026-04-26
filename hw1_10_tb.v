//test bench for hw 10 assignment

`timescale 1ns/10ps

`include "hw1_10.v"
// These are included in case used for pipelining
`include "DW02_mult_2_stage.v"
`include "DW02_mult_3_stage.v"
`include "DW02_mult_4_stage.v"

module tb10();
    reg clk,reset;
    reg signed [74:0] ev;
    wire signed [74:0] rd;
    reg pushin;
    wire pushout;
    reg signed [32:0] M00,C00;
    reg signed [32:0] M01,C01;
    reg signed [32:0] M02,C02;
    reg signed [32:0] M03,C03;
    reg signed [32:0] M04,C04;
    reg signed [32:0] M05,C05;
    reg signed [32:0] M06,C06;
    reg signed [32:0] M07,C07;
    reg signed [32:0] M08,C08;
    reg signed [32:0] M09,C09;
    reg signed [32:0] M10,C10;
    reg signed [32:0] M11,C11;
    reg signed [65:0] D00;
    reg signed [65:0] D01;
    reg signed [65:0] D02;
    reg signed [65:0] D03;
    reg signed [65:0] D04;
    reg signed [65:0] D05;
    reg signed [65:0] D06;
    reg signed [65:0] D07;
    reg signed [74:0] fifo [65:0];
    reg [6:0] hp=0,tp=0;
    reg [6:0] fmax=63;
    integer seedvalue=10*10+3815;
    initial begin
        clk=1;
        repeat(1_510_000*2) begin
            #5 clk=~clk;
        end
        $display("Error --- Ran out of clocks");
        $finish;
    end
    always @(posedge(clk)) begin
        if(!reset) begin
            if(pushout===1) begin
                if(hp==tp)  begin
                    $display("Error --- Got a pushout when none expected");
                    #10 $finish;
                end

                if(rd===fifo[tp]) begin
                    tp+=1;
                    if(tp>fmax) tp=0;
                end else begin
                    $display("Error --- Data error");
                    $display("Got %h expected %h",rd,fifo[tp]);
                    #10 $finish;
                end
            end
        end
    end
    task setev;
      begin
        ev=evcalc(0);
        fifo[hp]=ev;
        hp+=1;
        if(hp==tp) begin
            $display("Error --- Fifo overflow, perhaps no pushout");
            #10 $finish;
        end
        if(hp>fmax) hp=0;
      end
    endtask
    initial begin
        reset=1;
        pushin=0;
        setrv;
        M00=$urandom(seedvalue);
        repeat(3) @(posedge(clk)) #1;
        reset=0;
        repeat(2) @(posedge(clk)) #1;
        repeat(500000) begin
            if($urandom_range(10)>6) begin
                repeat($urandom_range(3,1)) @(posedge(clk)) #1;
            end
            pushin=1;
            setrv;
            setev;
            @(posedge(clk)) #1;
            pushin=0;
            setrv;
        end
        repeat(30) @(posedge(clk)) #1;
        if(hp!=tp) begin
            $display("Not all data pushed out of DUT at end");
            $finish;
        end
        $display("\n\n\nOh happy time, it worked\n\n\n");
        $finish;
    end

    function signed [74:0] evcalc;
        input trash;
        reg signed [74:0] cv;
      begin
        cv=M00*(M11<C03?C02:C00)+((M02>=M09?M03:M04)*(M04>C06?C01:M05)+D07)-((M08<=M00?M10:C05)*(C07>M01?M02:M08)+D05)-(M10<M05?M08:M02)*C03+(M11<C03?C02:C00)^C04+((M02>=M09?M03:M04)*(M04>C06?C01:M05)+D06)+(M06*(M08<=M00?M10:C05)+D02)+M07*(C07>M01?M02:M08)-((M10<M05?M08:M02)*C08+D03)-((M11<C03?C02:C00)*C09+D01)+((M02>=M09?M03:M04)*C10+D04)+((M04>C06?C01:M05)*C11+D00);
        evcalc = cv;
      end
    endfunction
    task setrv;
        M00={$urandom,$urandom};
        C00={$urandom,$urandom};
        M01={$urandom,$urandom};
        C01={$urandom,$urandom};
        M02={$urandom,$urandom};
        C02={$urandom,$urandom};
        M03={$urandom,$urandom};
        C03={$urandom,$urandom};
        M04={$urandom,$urandom};
        C04={$urandom,$urandom};
        M05={$urandom,$urandom};
        C05={$urandom,$urandom};
        M06={$urandom,$urandom};
        C06={$urandom,$urandom};
        M07={$urandom,$urandom};
        C07={$urandom,$urandom};
        M08={$urandom,$urandom};
        C08={$urandom,$urandom};
        M09={$urandom,$urandom};
        C09={$urandom,$urandom};
        M10={$urandom,$urandom};
        C10={$urandom,$urandom};
        M11={$urandom,$urandom};
        C11={$urandom,$urandom};
        D00={$urandom,$urandom,$urandom};
        D01={$urandom,$urandom,$urandom};
        D02={$urandom,$urandom,$urandom};
        D03={$urandom,$urandom,$urandom};
        D04={$urandom,$urandom,$urandom};
        D05={$urandom,$urandom,$urandom};
        D06={$urandom,$urandom,$urandom};
        D07={$urandom,$urandom,$urandom};
    endtask
    initial begin
        $dumpfile("hw1.vcd");
        $dumpvars(0,tb10);
        #10000 $dumpoff();
    end
    hw1_10 hw1(.clk(clk),.reset(reset),.pushin(pushin)
        ,.M00(M00)
        ,.M01(M01)
        ,.M02(M02)
        ,.M03(M03)
        ,.M04(M04)
        ,.M05(M05)
        ,.M06(M06)
        ,.M07(M07)
        ,.M08(M08)
        ,.M09(M09)
        ,.M10(M10)
        ,.M11(M11)
        ,.C00(C00)
        ,.C01(C01)
        ,.C02(C02)
        ,.C03(C03)
        ,.C04(C04)
        ,.C05(C05)
        ,.C06(C06)
        ,.C07(C07)
        ,.C08(C08)
        ,.C09(C09)
        ,.C10(C10)
        ,.C11(C11)
        ,.D00(D00)
        ,.D01(D01)
        ,.D02(D02)
        ,.D03(D03)
        ,.D04(D04)
        ,.D05(D05)
        ,.D06(D06)
        ,.D07(D07)
        ,.pushout(pushout),.rd(rd) );
endmodule


