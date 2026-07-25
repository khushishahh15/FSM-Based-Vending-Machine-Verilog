`timescale 1ns/1ps

module vending_machine_tb;

reg clk;
reg rst;
reg [1:0] in;

wire out;
wire [3:0] change;

vending_machine uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out),
    .change(change)
);
always #5 clk = ~clk;

initial
begin
    $dumpfile("vending_machine.vcd");
    $dumpvars(0, vending_machine_tb);
    clk = 0;
    rst = 1;
    in = 2'b00;

    #10 rst = 0;

    #10 in = 2'b01;
    #10 in = 2'b10;

    #20 in = 2'b10;
    #10 in = 2'b01;

    #20 in = 2'b10;
    #10 in = 2'b10;

    #20 in = 2'b01;
    #10 in = 2'b00;

    #20 in = 2'b10;
    #10 in = 2'b00;

    #20 $finish;
end

initial
begin
    $monitor("Time=%0t  Input=%b  Output=%b  Change=%d",
              $time, in, out, change);
end

endmodule
