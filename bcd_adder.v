module bcd_adder(
  input [3:0]a,
  input [3:0]b,
  input cin,
  output [3:0]sumfinal,
  output cout
);
  wire [3:0]s;
  wire [3:0]sum;
  wire c,c0,c1,c2,c3,and1,and2; 
  
  adder a1(a,b,cin,s,c);
  and a2(and1,s[3],s[2]);
  and a3(and2,s[3],s[1]);
  or o1(cout,and1,and2,c);
  
  full_adder faa1(s[0],1'b0,cin,sum[0],c0);
  full_adder faa2(s[1],cout,c0,sum[1],c1);
  full_adder faa3(s[2],cout,c1,sum[2],c2);
  full_adder faa4(s[3],1'b0,c2,sum[3],c3);
  
  wire greater,greater1,greater2;
  
  and(greater1,a[3],a[2]);
  and(greater2,a[3],a[1]);
  or(greater,greater1,greater2);
  
  wire check,check1,check2;
  
  and(check1,b[3],b[2]);
  and(check2,b[3],b[1]);
  or(check,check1,check2);
  
  wire greatercheck;
  
  or(greatercheck,greater,check);
  
  mux21 m1(sum[0],greatercheck,sumfinal[0]);
  mux21 m2(sum[1],greatercheck,sumfinal[1]);
  mux21 m3(sum[2],greatercheck,sumfinal[2]);
  mux21 m4(sum[3],greatercheck,sumfinal[3]);
  
endmodule

module mux21(
  input a,b,
  output o
);
  wire bbar,d0,d1;
  
  not(bbar,b);
  and(d0,a,bbar);
  and(d1,b,1'bx);
  or(o,d0,d1);
  
endmodule
  
module full_adder(
  input a,
  input b,
  input cin,
  output sum,
  output cout
);
  
  wire t1,t2,t3;
  
  xor x1(t1,a,b);
  xor x2(sum,t1,cin);
  and a1(t2,a,b);
  and a2(t3,t1,cin);
  or o1(cout,t3,t2);
 
endmodule

module adder(
  input [3:0]a,
  input [3:0]b,
  input cin,
  output [3:0]sum,
  output cout
);
  
  wire c0,c1,c2;
  
  full_adder FA1(a[0],b[0],cin,sum[0],c0);
  full_adder FA2(a[1],b[1],c0,sum[1],c1);
  full_adder FA3(a[2],b[2],c1,sum[2],c2);
  full_adder FA4(a[3],b[3],c2,sum[3],cout);
  
endmodule
  



//TESTBENCH

module bcd_adder_test();
  reg [3:0]a;
  reg [3:0]b;
  reg cin;
  wire [3:0]sumfinal;
  wire cout;
  
  bcd_adder uut (.a(a),.b(b),.cin(cin),.cout(cout),.sumfinal(sumfinal));
  integer count;
  
  initial begin
    cin=1'b0;
    for (count=0;count<256;count=count+1) begin
      {a,b}=count;
      #10;
    end
  end
endmodule
