module bcd_excess3(
  input [3:0]a,
  output [3:0]e
);
  wire [3:0]b;
  
  not(a0bar,a[0]);
  not(a1bar,a[1]);
  not(a2bar,a[2]);
  
  not(b[0],a[0]);
  
  and(a0a1,a0bar,a1bar);
  and(aa01,a[0],a[1]);
  or(b[1],a0a1,aa01);
  
  and(p,a0a1,a[2]);
  or(q,a[0],a[1]);
  and(r,q,a2bar);
  or(b[2],p,q);
  
  and(s,q,a[2]);
  or(b[3],a[3],s);
  
  wire greater,greater1,greater2;
  
  and(greater1,a[3],a[2]);
  and(greater2,a[3],a[1]);
  or(greater,greater1,greater2);
  
  mux21 m1(b[0],greater,e[0]);
  mux21 m2(b[1],greater,e[1]);
  mux21 m3(b[2],greater,e[2]);
  mux21 m4(b[3],greater,e[3]);
  
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



TESTBENCH


module bcd_excess3_test();
  reg [3:0]a;
  wire [3:0]e;
  
  bcd_excess3 uut (.a(a),.e(e));
 
  integer count;
  
  initial begin
    for(count=0;count<16;count=count+1) begin
      {a}=count;
      #10;
    end
  end
endmodule
