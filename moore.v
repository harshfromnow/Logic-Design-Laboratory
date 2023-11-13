module moore(
  input clk,reset,inbits,
  output reg out
);
  reg[1:0] state; //cuz 4 states are there
  initial begin
    state=2'b00;
  end

  always@(posedge clk,posedge reset) begin
    if (reset)
      state<=2'b00;
    else begin
      case (state)
        2'b00:
          begin if (inbits) state<=2'b01;
            else state<=2'b10;
          end
        2'b01:
          begin if (inbits) state<=2'b11;
            else state<=2'b10;
          end
        2'b10:
          begin if (inbits) state<=2'b01;
            else state<=2'b11;
          end
        2'b11:
          begin if (inbits) state<=2'b01;
            else state<=2'b10;
          end
      endcase
    end
  end

  always@(posedge clk,posedge reset)
    begin
      if (reset)
        out<=0;
      else if (state=2'b11)
        out<=1;
      else
        out<=0;
    end

endmodule

//TESTBENCH

module testbench;
  reg clk;
  reg reset;
  reg inbits;
  wire out;

  moore uut(.clk(clk),.reset(reset),.inbits(inbits),.out(out));

  initial begin
    clk=0;
    reset=0;
    inbits=0;
  end

  initial begin
    reset=1'b1;
    #15 reset=1'b0;
  end

  always begin
    #10 clk=~clk;
  end

  always begin
    #20 inbits=1'b1;
    #20 inbits=1'b0;
    #20 inbits=1'b1;
    #20 inbits=1'b1;
    #20 inbits=1'b0;
    #20 inbits=1'b0;
    #20 inbits=1'b0;
    #20 inbits=1'b1;
    #20 inbits=1'b1;
  end

endmodule


