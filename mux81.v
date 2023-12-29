module mux(
    input s0,
    input s1,
    input s2,
    input d0,
    input d1,
    input d2,
    input d3,
    input d4,
    input d5,
    input d6,
    input d7,
    output out
    );
    
    wire t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11;
    
    not (t1,s0);
    not (t2,s1);
    not (t3,s2);
    
    and (t4,d0,t1,t2,t3);
    and (t5,d1,s0,t2,t3);
    and (t6,d2,s1,t1,t3);
    and (t7,d3,s0,s1,t3);
    and (t8,d4,s2,t1,t2);
    and (t9,d5,s0,s2,t2);
    and (t10,d6,s1,s2,t1);
    and (t11,d7,s0,s1,s2);
    
    or(out,t4,t5,t6,t7,t8,t9,t10,t11);
    
endmodule

//Testbench

module mux_test();
  reg s0;
  reg s1;
  reg s2;
  reg d0;
  reg d1;
  reg d2;
  reg d3;
  reg d4;
  reg d5;
  reg d6;
  reg d7;
  wire out;
  
  mux m1(.s0(s0),.s1(s1),.s2(s2),.d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7),.out(out));
  integer count;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  
  initial begin
    for(count=0;count<2048;count=count+1)
      begin
        {s0,s1,s2,d0,d1,d2,d3,d4,d5,d6,d7}=count;
        #20;
      end
  end
endmodule
