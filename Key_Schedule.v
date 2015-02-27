/*

Module: Key_Schedule
Input: 64-bit Encryption Key
Output: 16 48-bit subkeys to be used in the DES encryption
Modules Used: Permuted_Choice_1
              Permuted_Choice_2
              Halfer
              Concatenator
              Rotate_1
              Rotate_2
*/

`timescale 1 ns/ 1 ps

module Key_Schedule(key_in, sub_1, sub_2, sub_3, sub_4,
                            sub_5, sub_6, sub_7, sub_8,
                            sub_9, sub_10, sub_11, sub_12,
                            sub_13, sub_14, sub_15, sub_16);

  input [63:0] key_in;
  output [47:0] sub_1, sub_2, sub_3, sub_4, sub_5, sub_6, sub_7, sub_8,
                sub_9, sub_10, sub_11, sub_12, sub_13, sub_14, sub_15, sub_16;
  
  wire [55:0] PC1_halfer;
  wire [27:0] left_0, right_0, left_1, right_1, left_2, right_2, left_3, right_3,
              left_4, right_4, left_5, right_5, left_6, right_6, left_7, right_7,
              left_8, right_8, left_9, right_9, left_10, right_10, left_11, right_11,
              left_12, right_12, left_13, right_13, left_14, right_14, left_15, right_15,
              left_16, right_16;
  wire [55:0] PC2_input_1, PC2_input_2, PC2_input_3, PC2_input_4, PC2_input_5, 
              PC2_input_6, PC2_input_7, PC2_input_8, PC2_input_9, PC2_input_10, 
              PC2_input_11, PC2_input_12, PC2_input_13, PC2_input_14, PC2_input_15, 
              PC2_input_16;
  
  Permuted_Choice_1 PC1( .in(key_in), .out(PC1_halfer) );
  Halfer halfer( .in(PC1_halfer), .out_upper(left_0), .out_lower(right_0) );
  
  // Round 1: 1 rotation
  Rotate_1 round_1a( .in(left_0), .out(left_1) );
  Rotate_1 round_1b( .in(right_0), .out(right_1) );
  Concatenator c1( .in_upper(left_1), .in_lower(right_1), .out(PC2_input_1) );
  Permuted_Choice_2 PC2_module_1( .in(PC2_input_1), .out(sub_1) );
  
  // Round 2: 1 rotation
  Rotate_1 round_2a( .in(left_1), .out(left_2) );
  Rotate_1 round_2b( .in(right_1), .out(right_2) );
  Concatenator c2( .in_upper(left_2), .in_lower(right_2), .out(PC2_input_2) );
  Permuted_Choice_2 PC2_module_2( .in(PC2_input_2), .out(sub_2) );
  
  // Round 3: 2 rotations
  Rotate_2 round_3a( .in(left_2), .out(left_3) );
  Rotate_2 round_3b( .in(right_2), .out(right_3) );
  Concatenator c3( .in_upper(left_3), .in_lower(right_3), .out(PC2_input_3) );
  Permuted_Choice_2 PC2_module_3( .in(PC2_input_3), .out(sub_3) );
  
  // Round 4: 2 rotations
  Rotate_2 round_4a( .in(left_3), .out(left_4) );
  Rotate_2 round_4b( .in(right_3), .out(right_4) );
  Concatenator c4( .in_upper(left_4), .in_lower(right_4), .out(PC2_input_4) );
  Permuted_Choice_2 PC2_module_4( .in(PC2_input_4), .out(sub_4) );
  
  // Round 5: 2 rotations
  Rotate_2 round_5a( .in(left_4), .out(left_5));
  Rotate_2 round_5b( .in(right_4), .out(right_5) );
  Concatenator c5( .in_upper(left_5), .in_lower(right_5), .out(PC2_input_5) );
  Permuted_Choice_2 PC2_module_5( .in(PC2_input_5), .out(sub_5) );
  
  // Round 6: 2 rotations
  Rotate_2 round_6a( .in(left_5), .out(left_6));
  Rotate_2 round_6b( .in(right_5), .out(right_6) );
  Concatenator c6( .in_upper(left_6), .in_lower(right_6), .out(PC2_input_6) );
  Permuted_Choice_2 PC2_module_6( .in(PC2_input_6), .out(sub_6) );
  
  // Round 7: 2 rotations
  Rotate_2 round_7a( .in(left_6), .out(left_7));
  Rotate_2 round_7b( .in(right_6), .out(right_7) );
  Concatenator c7( .in_upper(left_7), .in_lower(right_7), .out(PC2_input_7) );
  Permuted_Choice_2 PC2_module_7( .in(PC2_input_7), .out(sub_7) );
  
  // Round 8: 2 rotations
  Rotate_2 round_8a( .in(left_7), .out(left_8));
  Rotate_2 round_8b( .in(right_7), .out(right_8) );
  Concatenator c8( .in_upper(left_8), .in_lower(right_8), .out(PC2_input_8) );
  Permuted_Choice_2 PC2_module_8( .in(PC2_input_8), .out(sub_8) );
  
  // Round 9: 1 rotation
  Rotate_1 round_9a( .in(left_8), .out(left_9));
  Rotate_1 round_9b( .in(right_8), .out(right_9) );
  Concatenator c9( .in_upper(left_9), .in_lower(right_9), .out(PC2_input_9) );
  Permuted_Choice_2 PC2_module_9( .in(PC2_input_9), .out(sub_9) );
  
  // Round 10: 2 rotations
  Rotate_2 round_10a( .in(left_9), .out(left_10));
  Rotate_2 round_10b( .in(right_9), .out(right_10) );
  Concatenator c10( .in_upper(left_10), .in_lower(right_10), .out(PC2_input_10) );
  Permuted_Choice_2 PC2_module_10( .in(PC2_input_10), .out(sub_10) );
  
  // Round 11: 2 rotations
  Rotate_2 round_11a( .in(left_10), .out(left_11));
  Rotate_2 round_11b( .in(right_10), .out(right_11) );
  Concatenator c11( .in_upper(left_11), .in_lower(right_11), .out(PC2_input_11) );
  Permuted_Choice_2 PC2_module_11( .in(PC2_input_11), .out(sub_11) );
  
  // Round 12: 2 rotations
  Rotate_2 round_12a( .in(left_11), .out(left_12));
  Rotate_2 round_12b( .in(right_11), .out(right_12) );
  Concatenator c12( .in_upper(left_12), .in_lower(right_12), .out(PC2_input_12) );
  Permuted_Choice_2 PC2_module_12( .in(PC2_input_12), .out(sub_12) );
  
  // Round 13: 2 rotations
  Rotate_2 round_13a( .in(left_12), .out(left_13));
  Rotate_2 round_13b( .in(right_12), .out(right_13) );
  Concatenator c13( .in_upper(left_13), .in_lower(right_13), .out(PC2_input_13) );
  Permuted_Choice_2 PC2_module_13( .in(PC2_input_13), .out(sub_13) );
  
  // Round 14: 2 rotations
  Rotate_2 round_14a( .in(left_13), .out(left_14));
  Rotate_2 round_14b( .in(right_13), .out(right_14) );
  Concatenator c14( .in_upper(left_14), .in_lower(right_14), .out(PC2_input_14) );
  Permuted_Choice_2 PC2_module_14( .in(PC2_input_14), .out(sub_14) );
  
  // Round 15: 2 rotations
  Rotate_2 round_15a( .in(left_14), .out(left_15));
  Rotate_2 round_15b( .in(right_14), .out(right_15) );
  Concatenator c15( .in_upper(left_15), .in_lower(right_15), .out(PC2_input_15) );
  Permuted_Choice_2 PC2_module_15( .in(PC2_input_15), .out(sub_15) );
  
  // Round 16: 1 rotation
  Rotate_1 round_16a( .in(left_15), .out(left_16));
  Rotate_1 round_16b( .in(right_15), .out(right_16) );
  Concatenator c16( .in_upper(left_16), .in_lower(right_16), .out(PC2_input_16) );
  Permuted_Choice_2 PC2_module_16( .in(PC2_input_16), .out(sub_16) );
  
endmodule