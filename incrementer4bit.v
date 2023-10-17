module incrementer4bit(
    input [3:0]a,
    output [4:0]sum,
    output Cout
);
    
  wire c0, c1, c2;
 
  full_adder FA0(a[0], 1'b1,1'b0, sum[0], c0);
  full_adder FA1(a[1], 1'b0, c0, sum[1], c1);
  full_adder FA2(a[2], 1'b0, c1, sum[2], c2);
  full_adder FA3(a[3], 1'b0, c2, sum[3], sum[4]);

endmodule

module full_adder(
    input a,b,cin,
    output s,c
);
    half_adder h1(a,b,s1,c1);
    half_adder h2(s1,cin,s,c2);
    or_gate o1(c1,c2,c);
    
endmodule

module half_adder(
    input a,b,
    output s,c
);
    xor_gate x1(a,b,s);
    and_gate a1(a,b,c);
    
endmodule

module and_gate(
    input a,b,
    output ab
);
    wire abbar;
    
    nand(abbar,a,b);
    nand(ab,abbar,abbar);
    
endmodule

module or_gate(
    input a,b,
    output ab
);
    wire abar,bbar;
    
    nand(abar,a,a);
    nand(bbar,b,b);
    nand(ab,abar,bbar);
    
endmodule

module xor_gate(
    input a,b,
    output c
);
    wire w1,w2,w3;
    
    nand(w1,a,b);
    nand(w2,a,w1);
    nand(w3,b,w1);
    nand(c,w2,w3);
    
endmodule

module incrementer4bit_test();
  reg [3:0] a;
  wire [4:0] sum;
 
  incrementer4bit a1(.a(a),.sum(sum));
  integer count;
 
  initial begin
 
	for(count=0;count<16;count=count+1)
  	begin
    	{a}=count;
    	#20;
  	end
  end
endmodule
