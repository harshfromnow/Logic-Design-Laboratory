module alu(
	input [15:0]x,
	input [15:0]y,
	output [15:0] o1,
	output [15:0] o2,
	output [15:0] o3,
	output [15:0] o4,
	output [15:0] o5,
	output [15:0] o6,
	output [15:0] o7,
	output [15:0] o8,
	output [15:0] o9,
	output [15:0] o10,
	output [15:0] o11,
	output [15:0] o12,
	output [15:0] o13,
	output [15:0] o14,
	output [15:0] o15,
	output [15:0] o16
);

	adder a1(x,y,o1);
	subtractor s1(x,y,o2);
	subtractor s2(y,x,o3);
	bit b1(1'b0,o4);
	bit b2(1'b1,o5);
	negone n1(o6);
	inverter x1(x,o7);
	inverter y1(y,o8);
	negator x2(x,o9);
	negator y2(y,o10);
	incrementer x3(x,o11);
	incrementer y3(y,o12);
	decrementer x4(x,o13);
	decrementer y4(y,o14);
	bitand and1(x,y,o15);
	bitor or1(x,y,o16);
endmodule


module adder(
	input [15:0]a,
input [15:0]b,
	output [15:0]sum
);
   
  wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,Cout;
 
  full_adder FA0(a[0], b[0],1'b0, sum[0], c0);
  full_adder FA1(a[1], b[1], c0, sum[1], c1);
  full_adder FA2(a[2], b[2], c1, sum[2], c2);
  full_adder FA3(a[3], b[3], c2, sum[3], c3);
  full_adder FA4(a[4], b[4], c3, sum[4], c4);
  full_adder FA5(a[5], b[5], c4, sum[5], c5);
  full_adder FA6(a[6], b[6], c5, sum[6], c6);
  full_adder FA7(a[7], b[7], c6, sum[7], c7);
  full_adder FA8(a[8], b[8], c7, sum[8], c8);
  full_adder FA9(a[9], b[9], c8, sum[9], c9);
  full_adder FA10(a[10], b[10],c9, sum[10], c10);
  full_adder FA11(a[11], b[11], c10, sum[11], c11);
  full_adder FA12(a[12], b[12], c11, sum[12], c12);
  full_adder FA13(a[13], b[13], c12, sum[13], c13);
  full_adder FA14(a[14], b[14], c13, sum[14], c14);
  full_adder FA15(a[15], b[15], c14, sum[15], Cout);

endmodule

module subtractor(
	input [15:0]a,
input [15:0]b,
	output [15:0]d
);

  wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15;
 
  full_subtractor FA0(a[0], b[0],1'b0, d[0], c0);
  full_subtractor FA1(a[1], b[1], c0, d[1], c1);
  full_subtractor FA2(a[2], b[2], c1, d[2], c2);
  full_subtractor FA3(a[3], b[3], c2, d[3], c3);
  full_subtractor FA4(a[4], b[4], c3, d[4], c4);
  full_subtractor FA5(a[5], b[5], c4, d[5], c5);
  full_subtractor FA6(a[6], b[6], c5, d[6], c6);
  full_subtractor FA7(a[7], b[7], c6, d[7], c7);
  full_subtractor FA8(a[8], b[8], c7, d[8], c8);
  full_subtractor FA9(a[9], b[9], c8, d[9], c9);
  full_subtractor FA10(a[10], b[10],c9, d[10], c10);
  full_subtractor FA11(a[11], b[11], c10, d[11], c11);
  full_subtractor FA12(a[12], b[12], c11, d[12], c12);
  full_subtractor FA13(a[13], b[13], c12, d[13], c13);
  full_subtractor FA14(a[14], b[14], c13, d[14], c14);
  full_subtractor FA15(a[15], b[15], c14, d[15], c15);

endmodule

module bit(
input a,
output [15:0]o
);
or_gate o1(a,1'b0,o[0]);
or_gate o2(1'b0,1'b0,o[1]);
or_gate o3(1'b0,1'b0,o[2]);
or_gate o4(1'b0,1'b0,o[3]);
or_gate o5(1'b0,1'b0,o[4]);
or_gate o6(1'b0,1'b0,o[5]);
or_gate o7(1'b0,1'b0,o[6]);
or_gate o8(1'b0,1'b0,o[7]);
or_gate o9(1'b0,1'b0,o[8]);
or_gate o10(1'b0,1'b0,o[9]);
or_gate o11(1'b0,1'b0,o[10]);
or_gate o12(1'b0,1'b0,o[11]);
or_gate o13(1'b0,1'b0,o[12]);
or_gate o14(1'b0,1'b0,o[13]);
or_gate o15(1'b0,1'b0,o[14]);
or_gate o16(1'b0,1'b0,o[15]);

endmodule


module negone(
 output [15:0]o
);
wire [15:0]t;
bit bi(1'b1,t);
inverter inv(t,o);

endmodule

module inverter(
input [15:0]a,
output [15:0]o
);
wire [15:0]abar;
negator neg(a,abar);
incrementer inc(abar,o);

endmodule

module negator(
	input [15:0]a,
	output [15:0]b
);
	not_gate n0 (b[0],a[0]);
	not_gate n1 (b[1],a[1]);
	not_gate n2 (b[2],a[2]);
	not_gate n3 (b[3],a[3]);
	not_gate n4 (b[4],a[4]);
	not_gate n5 (b[5],a[5]);
	not_gate n6 (b[6],a[6]);
	not_gate n7 (b[7],a[7]);
	not_gate n8 (b[8],a[8]);
	not_gate n9 (b[9],a[9]);
	not_gate n10 (b[10],a[10]);
	not_gate n11 (b[11],a[11]);
	not_gate n12 (b[12],a[12]);
	not_gate n13 (b[13],a[13]);
	not_gate n14 (b[14],a[14]);
	not_gate n15 (b[15],a[15]);
   
endmodule

module incrementer(
	input [15:0]a,
	output [15:0]sum
);
   
  wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,Cout;
 
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
  full_adder FA15(a[15], 1'b0, c14, sum[15], Cout);

endmodule

module decrementer(
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

module bitand(
	input [15:0]a,
	input [15:0]b,
	output [15:0]o
);
	and_gate a1(a[0], b[0], o[0]);
	and_gate a2(a[1], b[1], o[1]);
	and_gate a3(a[2], b[2], o[2]);
	and_gate a4(a[3], b[3], o[3]);
	and_gate a5(a[4], b[4], o[4]);
	and_gate a6(a[5], b[5], o[5]);
	and_gate a7(a[6], b[6], o[6]);
	and_gate a8(a[7], b[7], o[7]);
	and_gate a9(a[8], b[8], o[8]);
	and_gate a10(a[9], b[9], o[9]);
	and_gate a11(a[10], b[10], o[10]);
	and_gate a12(a[11], b[11], o[11]);
	and_gate a13(a[12], b[12], o[12]);
	and_gate a14(a[13], b[13], o[13]);
	and_gate a15(a[14], b[14], o[14]);
	and_gate a16(a[15], b[15], o[15]);

endmodule

module bitor(
	input [15:0]a,
	input [15:0]b,
	output [15:0]o
);
	or_gate o1(a[0], b[0], o[0]);
	or_gate o2(a[1], b[1], o[1]);
	or_gate o3(a[2], b[2], o[2]);
	or_gate o4(a[3], b[3], o[3]);
	or_gate o5(a[4], b[4], o[4]);
	or_gate o6(a[5], b[5], o[5]);
	or_gate o7(a[6], b[6], o[6]);
	or_gate o8(a[7], b[7], o[7]);
	or_gate o9(a[8], b[8], o[8]);
	or_gate o10(a[9], b[9], o[9]);
	or_gate o11(a[10], b[10], o[10]);
	or_gate o12(a[11], b[11], o[11]);
	or_gate o13(a[12], b[12], o[12]);
	or_gate o14(a[13], b[13], o[13]);
	or_gate o15(a[14], b[14], o[14]);
	or_gate o16(a[15], b[15], o[15]);
    
endmodule

module full_subtractor(
	input a,
	input b,
	input bin,
	output diff,
	output borrow
);
	wire d1, b1, b2;

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


module full_adder(
	input a,b,cin,
	output s,c
);
	wire s1, c1, c2;
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

module alu_tb();
  reg [15:0] x, y;
  wire [15:0] o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16;
 
 alu aa (
	.x(x),
	.y(y),
	.o1(o1),
	.o2(o2),
	.o3(o3),
	.o4(o4),
	.o5(o5),
	.o6(o6),
	.o7(o7),
	.o8(o8),
	.o9(o9),
	.o10(o10),
	.o11(o11),
	.o12(o12),
	.o13(o13),
	.o14(o14),
	.o15(o15),
	.o16(o16)
  );
 
  initial begin
	x = 16'b0;
	y = 16'b0;
    
     repeat(10)begin
     x = $random;
     y = $random;
     #20;
     end
    end
endmodule
