module dlatch(
	input clk, 	 
	input d,   	 
	input preset,   
	input clear,    
	output reg q    
);

always @(clear or preset or d) begin
	if (clear) begin
    	q <= 1'b0;   
	end else if (preset) begin
    	q <= 1'b1;   
	end else begin
    	q <= d; 	 
	end
     end
endmodule

//TESTBENCH

module dlatch_tb;
    reg d,clk,preset,clear;
    wire q;
    
    dlatch uut(.d(d),.clk(clk),.preset(preset),.clear(clear),.q(q));
    
    initial begin
    
    clk=0;
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

