module srlatch(
    input s,r,en,
    output qfinal,qbarfinal
);
    wire sen,ren,q,qbar;
    
    nand(sen,s,en);
    nand(ren,r,en);
    nand(q,sen,qbar);
    nand(qbar,ren,q);
    and_gate a3(out,q,qbar);
    mux m1(q,out,qfinal);
    mux m2(qbar,out,qbarfinal);
    
endmodule

module not_gate(
	output abar,
	input a
);
	nand(abar,a,a);

endmodule

module and_gate(
    output ab,
    input a,b
);
    wire abbar;
    
    nand(abbar,a,b);
    nand(ab,abbar,abbar);
    
endmodule

module or_gate(
    output ab,
    input a,b
);
    wire abar,bbar;
    
    nand(abar,a,a);
    nand(bbar,b,b);
    nand(ab,abar,bbar);
    
endmodule

module mux(
    input a,b,
    output o
);
    wire bbar,d0,d1;
 
   not_gate n1(bbar,b);
   and_gate a1(d0,a,bbar);
   and_gate a2(d1,b,1'bx);
   or_gate o2(o,d0,d1);
 
endmodule

//TESTBENCH

module srlatch_tb();
    reg en,s,r;
    wire qfinal,qbarfinal;
    
    srlatch uut (.en(en),.s(s),.r(r),.qfinal(qfinal),.qbarfinal(qbarfinal));
    integer count;
    
    initial begin
    for (count=0;count<8;count=count+1)begin
   	 {en,s,r}=count;
   	 #20;
   	 end
    end
endmodule
    	
