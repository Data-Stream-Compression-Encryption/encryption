/*

Module: DES Core
Input: 64-bit Input Data for Encryption, 16 48-bit subkeys from Key Schedule
Output: 64-bit Encrypted Data
Modules Used: Initial Permutation
              Feistel
              Final Permutation
*/
`timescale 1 ns/ 1 ps

module DES_Core(data_in, data_out,  
                key_1, key_2, key_3, key_4,
                key_5, key_6, key_7, key_8,
                key_9, key_10, key_11, key_12,
                key_13, key_14, key_15, key_16);
                
  input [63:0] data_in;
  input [47:0]  key_1, key_2, key_3, key_4,
                key_5, key_6, key_7, key_8,
                key_9, key_10, key_11, key_12,
                key_13, key_14, key_15, key_16;
  output [63:0] data_out;

  wire [63:0] IP_out, FP_in;
  wire [31:0] upper, lower;
  wire [31:0] F1_out, F2_out, F3_out, F4_out, 
              F5_out, F6_out, F7_out, F8_out,
              F9_out, F10_out, F11_out, F12_out,
              F13_out, F14_out, F15_out, F16_out;
  wire [31:0] xor_out_1, xor_out_2, xor_out_3, xor_out_4,
              xor_out_5, xor_out_6, xor_out_7, xor_out_8,
              xor_out_9, xor_out_10, xor_out_11, xor_out_12,
              xor_out_13, xor_out_14, xor_out_15, xor_out_16;
  
  Initial_Permutation IP( .in(data_in), .out(IP_out));
  Core_Halfer CH( .in(IP_out), .out_upper(upper), .out_lower(lower) );
  
  Feistel F1( .half_block(lower), .subkey(key_1), .out(F1_out) );
  assign xor_out_1 = F1_out ^ upper;
  
  Feistel F2( .half_block(xor_out_1), .subkey(key_2), .out(F2_out) );
  assign xor_out_2 = F2_out ^ lower;
  
  Feistel F3( .half_block(xor_out_2), .subkey(key_3), .out(F3_out) );
  assign xor_out_3 = F3_out ^ xor_out_1;
  
  Feistel F4( .half_block(xor_out_3), .subkey(key_4), .out(F4_out) );
  assign xor_out_4 = F4_out ^ xor_out_2;
  
  Feistel F5( .half_block(xor_out_4), .subkey(key_5), .out(F5_out) );
  assign xor_out_5 = F5_out ^ xor_out_3;
  
  Feistel F6( .half_block(xor_out_5), .subkey(key_6), .out(F6_out) );
  assign xor_out_6 = F6_out ^ xor_out_4;
  
  Feistel F7( .half_block(xor_out_6), .subkey(key_7), .out(F7_out) );
  assign xor_out_7 = F7_out ^ xor_out_5;
  
  Feistel F8( .half_block(xor_out_7), .subkey(key_8), .out(F8_out) );
  assign xor_out_8 = F8_out ^ xor_out_6;
  
  Feistel F9( .half_block(xor_out_8), .subkey(key_9), .out(F9_out) );
  assign xor_out_9 = F9_out ^ xor_out_7;
  
  Feistel F10( .half_block(xor_out_9), .subkey(key_10), .out(F10_out) );
  assign xor_out_10 = F10_out ^ xor_out_8;
  
  Feistel F11( .half_block(xor_out_10), .subkey(key_11), .out(F11_out) );
  assign xor_out_11 = F11_out ^ xor_out_9;
  
  Feistel F12( .half_block(xor_out_11), .subkey(key_12), .out(F12_out) );
  assign xor_out_12 = F12_out ^ xor_out_10;
  
  Feistel F13( .half_block(xor_out_12), .subkey(key_13), .out(F13_out) );
  assign xor_out_13 = F13_out ^ xor_out_11;
  
  Feistel F14( .half_block(xor_out_13), .subkey(key_14), .out(F14_out) );
  assign xor_out_14 = F14_out ^ xor_out_12;
  
  Feistel F15( .half_block(xor_out_14), .subkey(key_15), .out(F15_out) );
  assign xor_out_15 = F15_out ^ xor_out_13;
  
  Feistel F16( .half_block(xor_out_15), .subkey(key_16), .out(F16_out) );
  assign xor_out_16 = F16_out ^ xor_out_14;
  
  Core_Concatenator CC( .in_upper(xor_out_16), .in_lower(xor_out_15), .out(FP_in) );
  Final_Permutation FP( .in(FP_in), .out(data_out) );

endmodule