module ring(
  input clk,
  input reset,
  output [3:0]Count_out
);
  reg [3:0]Count_temp;

  always @ (posedge clk, reset)
    begin
      if (reset==1'b1)
        Count_temp=4'b0001;
      else if (clk==1'b1)
        Count_temp={Count_temp[2:0],Count_temp[3])};
    end
  assign Count_out=Count_temp;
endmodule

//TESTBENCH

module ring_tb;
  reg clk;
  reg reset;
  wire [3:0]Count_out;

  ring uut(.clk(clk),.reset(reset),.Count_out(Count_out));

  initial clk=0;
  always #10 clk=~clk;

  initial begin
    reset=1;
    #50; 
    reset=0;
  end
endmodule

