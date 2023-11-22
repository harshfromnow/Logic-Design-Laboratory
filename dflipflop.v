module dff_preset_clear(
	input d,clk,preset,clear,
	output reg q
);
	always @(posedge clk) begin
	if (preset) begin
		q=1'b1;
	end else if (clear) begin
		q=1'b0;
	end else begin
		q=d;
	end
	end
endmodule

//TESTBENCH

module dff_preset_clear_tb;
	reg d,clk=1,preset,clear;
	wire q;
	
	dff_preset_clear uut(.d(d),.clk(clk),.preset(preset),.clear(clear),.q(q));
	
	always begin
		#5 clk=~clk;
	end
	
	initial begin
	
	d=0;
	preset=0;
	clear=0;
	#10;
	
	d=1;
	preset=0;
	clear=0;
	#10;
	
	d=0;
	preset=1;
	clear=0;
	#10;
	
	d=1;
	preset=1;
	clear=0;
	#10;
	
	d=0;
	preset=0;
	clear=1;
	#10;
	
	d=1;
	preset=0;
	clear=1;
	#10;
	
	$finish;
	end
endmodule
