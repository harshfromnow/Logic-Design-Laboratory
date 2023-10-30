module negator16bit(
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

module not_gate(
    output abar,
    input a
);

    nand (abar,a,a);
    
endmodule

//TESTBENCH

module negator16bit_test();
    reg [15:0]a;
    wire [15:0]b;
    
    negator16bit uut (.a(a),.b(b));
    integer count;
    
    initial begin
    for(count=0;count<65536;count=count+1) begin
   	 {a}=count;
   	 #20;
   	 end
    end
endmodule
