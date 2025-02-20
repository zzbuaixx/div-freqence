`timescale 1ns / 1ps
//****************************************VSCODE PLUG-IN**********************************//
//----------------------------------------------------------------------------------------
// IDE :                   VSCODE
// VSCODE plug-in version: Verilog-Hdl-Format-2.8.20240817
// VSCODE plug-in author : Jiang Percy
//----------------------------------------------------------------------------------------
//****************************************Copyright (c)***********************************//
// Copyright(C)            Please Write Company name
// All rights reserved
// File name:
// Last modified Date:     2024/08/22 10:30:29
// Last Version:           V1.0
// Descriptions:
//----------------------------------------------------------------------------------------
// Created by:             Please Write You Name
// Created date:           2024/08/22 10:30:29
// mail      :             Please Write mail
// Version:                V1.0
// TEXT NAME:              clock.v
// PATH:                   C:\Users\Z\Desktop\test_F\clock.v
// Descriptions:
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module clock(
    input                           clk                 ,
    input                           rst_n               ,
    //input           [11:0]                div                 ,
    output                          Clk_out
  );
  parameter div = 3'd5;


  reg [11:0]cnt_p,cnt_n;
  reg clk_p,clk_n;


  //正边沿计数器
  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      cnt_p<='d0;
    else if(cnt_p==(div-1))
      cnt_p<='d0;
    else
      cnt_p<=cnt_p+1'b1;
  end
  // 时钟正边沿
  always @(posedge clk or negedge rst_n)
  begin
    if(!rst_n)
      clk_p<=1'd0;
    else if(cnt_p<(div>>1))
      clk_p<=1'b0;
    else
      clk_p<=1'b1;
  end

  //负边沿计数器
  always @(negedge clk or negedge rst_n)
  begin
    if(!rst_n)
      cnt_n<='d0;
    else if(cnt_n==(div-1))
      cnt_n<='d0;
    else
      cnt_n<=cnt_n+1'b1;
  end
  // 时钟负边沿
  always @(negedge clk or negedge rst_n)
  begin
    if(!rst_n)
      clk_n<='d0;
    else if(cnt_p<(div>>1))
      clk_n<='b0;
    else
      clk_n<='b1;
  end


  //div==1时，输出clk，否则输出clk_p&clk_n
  assign Clk_out=(div==12'd1)?clk:((div[0])?(clk_p&clk_n):clk_p);


endmodule
