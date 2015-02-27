/*

Module: Rotate_2
Input: 28-bit input
Output: 28-bit output with 2-bit rotation of the input
Modules Used: N/A

*/

`timescale 1 ns/ 1 ps

module Rotate_2(in, out);
  input [27:0] in;
  output [27:0] out;
  
  assign out = {in[25:0], in[27:26]};
  
endmodule
