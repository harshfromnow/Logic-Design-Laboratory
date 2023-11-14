module register(
    input clk,
    input enable,
    input [7:0]d,
    output reg [7:0]q
);

    always @(posedge clk or posedge enable)
   	 begin
   	 if (enable)
   		 begin
   		 q<=d;
   		 end
   	 end
endmodule

//TESTBENCH

module register_tb;
    reg clk;
    reg enable;
    reg [7:0]d;
    wire [7:0]q;
    
    register uut (.clk(clk),.d(d),.enable(enable),.q(q));
    integer count;
    
    always begin
   	 #20 clk=~clk;
    end
    
    initial begin
   	 clk=1;
   	 enable=1'b1;
   	 for (count=0;count<256;count=count+1) begin
   		 d=count;
   		 #40;
   		 end
   	 end
endmodule
