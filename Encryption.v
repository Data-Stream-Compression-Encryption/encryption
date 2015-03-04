/*

Module: Encryption_DES
Input: Data In, 64-bits and the Encryption Key
Output: Data Out, 64-bits
Modules Used: DES_Core
              Key Schedule

*/

`timescale 1 ns/ 1 ps

module Encryption_DES(data_in, encryption_key, data_out);
  input [63:0] data_in;
  input [63:0] encryption_key;
  output [63:0] data_out;
  
  wire [47:0] key1, key2, key3, key4,
              key5, key6, key7, key8,
              key9, key10, key11, key12,
              key13, key14, key15, key16;
              
  
  Key_Schedule KS(  .key_in(encryption_key), 
                    .sub_1(key1), .sub_2(key2), .sub_3(key3), .sub_4(key4),
                    .sub_5(key5), .sub_6(key6), .sub_7(key7), .sub_8(key8),
                    .sub_9(key9), .sub_10(key10), .sub_11(key11), .sub_12(key12),
                    .sub_13(key13), .sub_14(key14), .sub_15(key15), .sub_16(key16) );
  
  DES_Core Core(  .data_in(data_in), .data_out(data_out),
                  .key_1(key1), .key_2(key2), .key_3(key3), .key_4(key4),
                  .key_5(key5), .key_6(key6), .key_7(key7), .key_8(key8),
                  .key_9(key9), .key_10(key10), .key_11(key11), .key_12(key12),
                  .key_13(key13), .key_14(key14), .key_15(key15), .key_16(key16) );
                  
  
                    
  
endmodule