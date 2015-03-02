/*

Module: Core_Concatenator
Input: Two 32-bit inputs
Output: One 64-bit output
Modules Used: N/A

*/

`timescale 1 ns/ 1 ps

module Core_Concatenator(in_upper, in_lower, out);
  input [31:0] in_upper;
  input [31:0] in_lower;
  output [63:0] out;
  
  assign out = {in_upper, in_lower};

endmodule
