
module decrementer16bit(
    input [15:0]a,
    output [15:0]d
);

  wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15;
 
  full_subtractor FA0(a[0], 1'b1,1'b0, d[0], c0);
  full_subtractor FA1(a[1], 1'b0, c0, d[1], c1);
  full_subtractor FA2(a[2], 1'b0, c1, d[2], c2);
  full_subtractor FA3(a[3], 1'b0, c2, d[3], c3);
  full_subtractor FA4(a[4], 1'b0, c3, d[4], c4);
  full_subtractor FA5(a[5], 1'b0, c4, d[5], c5);
  full_subtractor FA6(a[6], 1'b0, c5, d[6], c6);
  full_subtractor FA7(a[7], 1'b0, c6, d[7], c7);
  full_subtractor FA8(a[8], 1'b0, c7, d[8], c8);
  full_subtractor FA9(a[9], 1'b0, c8, d[9], c9);
  full_subtractor FA10(a[10], 1'b0,c9, d[10], c10);
  full_subtractor FA11(a[11], 1'b0, c10, d[11], c11);
  full_subtractor FA12(a[12], 1'b0, c11, d[12], c12);
  full_subtractor FA13(a[13], 1'b0, c12, d[13], c13);
  full_subtractor FA14(a[14], 1'b0, c13, d[14], c14);
  full_subtractor FA15(a[15], 1'b0, c14, d[15], c15);


endmodule


module full_subtractor(
    input a,
    input b,
    input bin,
    output diff,
    output borrow
);
    wire t1,t2;

    half_subtractor ha1(a,b,d1,b1);
    half_subtractor ha2(d1,bin,diff,b2);
    or_gate or1(b1,b2,borrow);

endmodule

module half_subtractor(
    input a,b,
    output diff,borrow
);

    wire abar;

    xor_gate x1(a,b,diff);
    not_gate n1(abar,a);
    and_gate a1(abar,b,borrow);

endmodule

module not_gate(
    output abar,
    input a
);
    nand(abar,a,a);

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

//TESTBENCH

module decrementer16bit_test();
  reg [15:0] a;
  wire [15:0] d;
 
  decrementer16bit a1(.a(a),.d(d));
  integer count;
 
  initial begin
    for(count=0;count<65536;count=count+1)
      begin
   	 {a}=count;
   	 #20;
      end
  end

endmodule
