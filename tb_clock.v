
`timescale 1ns/1ps
`define clk_period 20
module clock_tb;



  // Parameters

  //Ports
  reg  clk;
  reg  rst_n;
  //reg [11:0] div;
  wire  Clk_out;

  defparam clock_tb.div=9;

  
  clock  clock_tb (
           .clk(clk),
           .rst_n(rst_n),
           //    .div(div),
           .Clk_out(Clk_out)
         );

  //always #5  clk = ! clk ;
  initial
    clk=1;
  always #(5) clk=~clk;

  initial
  begin

    rst_n=1'b0;
    #21;
    // div=12'd5;
    rst_n=1'b1;
    #40_000;
    $stop;
  end
endmodule
