module shift_reg(
	input clk,
	input [7:0] d,
	input sin,
	input reset,
	output reg [7:0] q
);

always @(posedge clk or posedge reset) begin
	if (reset) begin
    	q <= 8'b00000000;
	end else begin
    	q <= {sin, q[7:1]};
	end
end

endmodule

//TESTBENCH

module shift_reg_tb;
  reg clk;
  reg sin;
  reg reset;
  wire [7:0] q;

  shift_reg uut (
	.clk(clk),
	.sin(sin),
	.reset(reset),
	.q(q)
  );


  always begin
	#5 clk = ~clk;
  end


  initial begin

	clk = 0;
	sin = 1'b0;
	reset = 1'b0;

	reset = 1'b1;
	#10 reset = 1'b0;

	sin = 1'b1;
	#10 sin = 1'b0;
	#10 sin = 1'b1;
	#10 sin = 1'b0;
     #10 sin = 1'b0;
     #10 sin = 1'b1;
     #10 sin = 1'b1;
     #10 sin = 1'b0;
     #10 sin = 1'b1;
     #10 sin = 1'b0;

	$finish;
  end

endmodule
