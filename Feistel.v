/*

Module: Feistel
Input: 32-bit half block and 48-bit subkey
Output: 32-bit Feistel Output
Modules Used: Expansion_Function, S_Box_1...S_Box_8, Permutation

*/

`timescale 1 ns/ 1 ps

module Feistel(half_block, subkey, out);
  input [31:0] half_block;
  input [47:0] subkey;
  output [31:0] out;
  
  wire [47:0] e_out;
  wire [47:0] xor_out;
  wire [3:0]  S1_out, S2_out, S3_out, S4_out, 
              S5_out, S6_out, S7_out, S8_out;
  wire [31:0] P_in;
    
  Expansion_Function E(.in(half_block), .out(e_out));
  
  assign xor_out = e_out ^ subkey;
  
  S_Box_1 S1( .in(xor_out[47:42]), .out(S1_out) );
  S_Box_2 S2( .in(xor_out[41:36]), .out(S2_out) );
  S_Box_3 S3( .in(xor_out[35:30]), .out(S3_out) );
  S_Box_4 S4( .in(xor_out[29:24]), .out(S4_out) );
  S_Box_5 S5( .in(xor_out[23:18]), .out(S5_out) );
  S_Box_6 S6( .in(xor_out[17:12]), .out(S6_out) );
  S_Box_7 S7( .in(xor_out[11:6]), .out(S7_out) );
  S_Box_8 S8( .in(xor_out[5:0]), .out(S8_out) );
  
  assign P_in = {S1_out, S2_out, S3_out, S4_out, S5_out, S6_out, S7_out, S8_out};
  
  Permutation P(  .in(P_in), .out(out) );
  
endmodule