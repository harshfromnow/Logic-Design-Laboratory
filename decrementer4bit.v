module decrementer4bit(
    input [3:0]a,
    output [3:0]d
);
  wire c0, c1, c2,c3;
 
  full_subtractor FA0(a[0], 1'b1,1'b0, d[0], c0);
  full_subtractor FA1(a[1], 1'b0, c0, d[1], c1);
  full_subtractor FA2(a[2], 1'b0, c1, d[2], c2);
  full_subtractor FA3(a[3], 1'b0, c2, d[3], c3);

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


module decrementer4bit_test();
  reg [3:0] a;
  wire [3:0] d;
 
  decrementer4bit a1(.a(a),.d(d));
  integer count;
 
  initial begin
    for(count=0;count<16;count=count+1)
      begin
   	 {a}=count;
   	 #20;
      end
  end

endmodule

