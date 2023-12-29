module adder_subtractor(
	output [3:0]sum,
	output c,
	input [3:0]a,
	input [3:0]b,
	input k
);
	wire c1,c2,c3;
	wire xor1,xor2,xor3,xor4;
	
	xor g1(xor1,b[0],k);
	xor g2(xor2,b[1],k);
	xor g3(xor3,b[2],k);
	xor g4(xor4,b[3],k);
	
	full_adder FA0(a[0], xor1, k, sum[0], c1);
	full_adder FA1(a[1], xor2, c1, sum[1], c2);
	full_adder FA2(a[2], xor3, c2, sum[2], c3);
	full_adder FA3(a[3], xor4, c3, sum[3], c);
endmodule

module full_adder(
input a,b,c,
output sum,cout
    );
  wire w1,c1,c2,c3,out1;
  xor x1(w1,a,b);
  xor x2(sum,w1,c);
  
  and a1(c1,a,b);
  and a2(c2,b,c);
  and a3(c3,a,c);
  
  or o1(out1,c1,c2);
  or o2(cout,out1,c3);
 endmodule


//Testbench

module adder_subtractor_test();
  wire [3:0] sum;
  wire c;
  reg [3:0] a;
  reg [3:0] b;
  reg k;
  
  adder_subtractor a1(.sum(sum),.c(c),.a(a),.b(b),.k(k));
  integer count;
  
  initial begin
  	$dumpfile("dump.vcd");
  	$dumpvars(1);
  end
  
  initial begin
    for(count=0;count<512;count=count+1)
      begin
        {a,b,k}=count;
        #20;
      end
  end
  
endmodule
