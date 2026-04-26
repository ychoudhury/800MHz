// A simple test driver for the modulator

`timescale 1ns/10ps

module top();

logic clk,reset;
logic pull,pdata;
logic [15:0] samp;
int dir=500;
int sampi;

initial begin
    clk=0;
    #10;
    repeat(4000000) begin
        #5 clk=1;
        #5 clk=0;
    end
    $display("Ran out of clocks");
    $finish();
end
initial begin
    reset=1;
    repeat(3) @(posedge clk) #1;
    reset=0;
end

initial begin
    samp=32768;
    sampi=samp;
end

always @(posedge(clk)) begin
    if ( pull && !reset) begin
        #1 sampi+=dir;
	if (sampi>65536 || sampi<0)begin
		dir=-dir;
        if(sampi<0) sampi+=11; else sampi-=11;
		sampi+=2*dir;
	end
	samp=sampi;
    end
end

mod m(clk,reset,samp,pull,pdata);

`include "mxg.svp"

endmodule : top

`include "mod_gates.v"
