module ripple_carry_adder (  
input [3:0] a,
  input [3:0] b,
  output [3:0] sum,
  output Cout
);

  wire c0, c1, c2;
 
  full_adder FA0(a[0], b[0],1'b0, sum[0], c0);
  full_adder FA1(a[1], b[1], c0, sum[1], c1);
  full_adder FA2(a[2], b[2], c1, sum[2], c2);
  full_adder FA3(a[3], b[3], c2, sum[3], Cout);

endmodule

module half_adder(
  input a,
  input b,
  output sum,
  output Cout
);
xor x1(sum,a,b);
  and a1(Cout,a,b);

endmodule

module full_adder(
  input a,b,Cin,
  output sum,Cout
);

    wire s1,c1,s2,c2;

  half_adder ha0(a,b,s1,c1);
  half_adder ha1(s1,Cin,sum,c2);

  or(Cout,c1,c2);
 
endmodule
  



//TESTBENCH

module ripple_carry_adder_test();
  reg [3:0] a;
  reg [3:0] b;
  wire [3:0] sum;
  wire Cout;
 
  ripple_carry_adder a1(.a(a),.b(b),.sum(sum),.Cout(Cout));
  integer count;
 
  initial begin
 
    for(count=0;count<256;count=count+1)
      begin
        {a,b}=count;
        #20;
      end
  end

endmodule
