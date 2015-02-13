// Define the stimulus module -- Note the toplevel Stimulus module
//	has no ports!

`timescale 1 ns/ 1 ps

module TB_Final_Permutation;


// Declare the inputs to be connected
reg clk;
reg [63:0] test_value;
reg [3:0] counter;

wire [63:0] out;

reg [63:0] testpos;
reg [5:0] tp_counter;

reg [63:0] outpos;
reg [5:0] op_counter;


// Instantiate the Module to be tested

Final_Permutation U1(.in(test_value),.out(out));
// Stimulate the inputs

// Define the input stimulus module

// Generate a 50 MHz clock
initial
	clk = 1'b0;
always
	#10 clk = ~clk;

// Toggle the SW inputs	
initial begin
	test_value <= 64'h0000000000000001;
	counter <= 4'h0;
end
	
always @(posedge clk)
begin
	test_value <= test_value << 1;
end

always @(test_value)
begin
  testpos = 64'b1;
  tp_counter = 1;
  while(testpos != test_value && testpos != 64'h0)
  begin
    testpos = testpos << 1;
    tp_counter = tp_counter + 1'b1;
  end
  
end

always @(out)
begin
  outpos = 64'b1;
  op_counter = 1;
  while(outpos != out && outpos != 64'h0)
  begin
    outpos = outpos << 1;
    op_counter = op_counter + 1'b1;
  end
  
end


/*
always @(counter)
begin
	case (counter)
		4'h0:
			test_value = 64'h00000000ffffffff;
		4'h1:
			test_value = 64'hffffffff00000000;
		4'h2:
			test_value = 64'hf0f0f0f0f0f0f0f0;
		4'h3:
			test_value = 64'h0f0f0f0f0f0f0f0f;
		default:
			test_value = 64'haaaaaaaaaaaaaaaa;
	endcase
end
*/


endmodule
