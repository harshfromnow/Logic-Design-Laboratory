module multiplier (
  input [3:0] a,
  input [3:0] b,
  output [7:0] out
);

    wire [3:0] l1, l2, l3;
    wire [3:0] multi0, multi1, multi2, multi3;
    wire [3:0] c0, c1, c2;
    wire [7:0] product;
    
    multiply mult0(a,b[0],multi0);
    multiply mult1(a,b[1],multi1);
    multiply mult2(a,b[2],multi2);
    multiply mult3(a,b[3],multi3);
    
    halfAdder ha0(multi0[1],multi1[0],l1[0],c0[0]);
    fullAdder fa1(multi0[2],multi1[1],c0[0],l1[1],c0[1]);
    fullAdder fa2(multi0[3],multi1[2],c0[2],l1[2],c0[2]);
    halfAdder ha3(c0[2],multi1[3],l1[3],c0[3]);
    
    halfAdder ha4(l1[1],multi2[0],l2[0],c1[0]);
    fullAdder fa5(l1[2],multi2[1],c1[0],l2[1],c1[1]);
    fullAdder fa6(l1[3],multi2[2],c1[1],l2[2],c1[2]);
    fullAdder fa7(c0[3],multi2[3],c1[2],l2[3],c1[3]);

    halfAdder ha8(l2[1],multi3[0],l3[0],c2[0]);
    fullAdder fa9(l2[2],multi3[1],c2[0],l3[1],c2[1]);
    fullAdder fa10(l2[3],multi3[2],c2[1],l3[2],c2[2]);
    fullAdder fa11(c1[3],multi3[3],c2[2],l3[3],c2[3]);
    
    assign product[0] = multi0[0];
    assign product[1] = l1[0];
    assign product[2] = l2[0];
    assign product[3] = l3[0];
    assign product[4] = l3[1];
    assign product[5] = l3[2];
    assign product[6] = l3[3];
    assign product[7] = c2[3];
    
    assign out = product;
    
endmodule
    
    
module fourBitAdder(
  input [3:0] a,
  input [3:0] b,
  output [3:0] sum,
  output cout
);

  wire [2:0] c;
  wire [4:0] s;

  halfAdder ha0 (a[0], b[0], s[0], c[0]);
  fullAdder fa0 (a[1], b[1], c[0], s[1], c[1]);
  fullAdder fa1 (a[2], b[2], c[1], s[2], c[2]);
  fullAdder fa2 (a[3], b[3], c[2], s[3], cout);

  assign sum = s;

endmodule

module halfAdder (
  input wire a,
  input wire b,
  output wire s,
  output wire cout
);

  assign s = a ^ b;
  assign cout = a & b;

endmodule

module multiply(
  input wire [3:0] a,
  input wire b,
  output wire [3:0] y
);

  assign y[0] = a[0] & b;
  assign y[1] = a[1] & b;
  assign y[2] = a[2] & b;
  assign y[3] = a[3] & b;

endmodule

module fullAdder (
  input wire a,
  input wire b,
  input wire cin,
  output wire s,
  output wire cout
);

  wire axorb;
  wire bb;
  wire cinab;

  assign axorb = a ^ b;
  assign s = axorb ^ cin;

  assign bb = a & b;
  assign cinab= cin & axorb;
  assign cout = bb | cinab;

endmodule



//TESTBENCH

module multiplier_tb;
	reg [3:0] a, b;
	wire [7:0] out;

	multiplier uut (.a(a), .b(b), .out(out));

	integer count;
     initial begin
        for (count = 0; count < 256; count = count + 1) begin
     	  {a,b}=count;
   	 #10;
   	 end
    end
endmodule
