// Define the stimulus module -- Note the toplevel Stimulus module
//	has no ports!

`timescale 1 ns/ 1 ps

module TB_Initial_Permutation;


// Declare the inputs to be connected
reg clk;
reg [63:0] test_value;
reg [3:0] counter;

wire [63:0] out;

// Instantiate the Module to be tested

Initial_Permutation U1()
// Stimulate the inputs

// Define the input stimulus module

// Generate a 50 MHz clock
initial
	clk = 1'b0;
always
	#10 clk = ~clk;

// Toggle the SW inputs	
initial begin
	test_value <= 64'h5555555555555555;
end
	
always @(posedge clk)
begin
	counter <= counter + 1;
end

always @(counter)
begin
	case counter:
	begin
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
		
	end
end


endmodule