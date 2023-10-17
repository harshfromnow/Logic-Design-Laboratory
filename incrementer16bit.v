module incrementer16bit(
    input [15:0]a,
    output [16:0]sum,
    output Cout
);
    
  wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14;
 
  full_adder FA0(a[0], 1'b1,1'b0, sum[0], c0);
  full_adder FA1(a[1], 1'b0, c0, sum[1], c1);
  full_adder FA2(a[2], 1'b0, c1, sum[2], c2);
  full_adder FA3(a[3], 1'b0, c2, sum[3], c3);
  full_adder FA4(a[4], 1'b0, c3, sum[4], c4);
  full_adder FA5(a[5], 1'b0, c4, sum[5], c5);
  full_adder FA6(a[6], 1'b0, c5, sum[6], c6);
  full_adder FA7(a[7], 1'b0, c6, sum[7], c7);
  full_adder FA8(a[8], 1'b0, c7, sum[8], c8);
  full_adder FA9(a[9], 1'b0, c8, sum[9], c9);
  full_adder FA10(a[10], 1'b0,c9, sum[10], c10);
  full_adder FA11(a[11], 1'b0, c10, sum[11], c11);
  full_adder FA12(a[12], 1'b0, c11, sum[12], c12);
  full_adder FA13(a[13], 1'b0, c12, sum[13], c13);
  full_adder FA14(a[14], 1'b0, c13, sum[14], c14);
  full_adder FA15(a[15], 1'b0, c14, sum[15], sum[16]);

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


module incrementer16bit_test();
  reg [15:0] a;
  wire [16:0] sum;
 
  incrementer16bit a1(.a(a),.sum(sum));
  integer count;
 
  initial begin
 
	for(count=0;count<65536;count=count+1)
  	begin
    	{a}=count;
    	#20;
  	end
  end

endmodule
