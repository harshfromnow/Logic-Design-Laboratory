module full_subtractor(
input a,
input b,
input b
in,
output diff,
output borrow
);
wire t1,t2;

half_subtractor ha1(a,b,d1,b1);
half_subtractor ha2(d1,bin,diff,b2);
or or1(borrow,b1,b2);

endmodule

module half_subtractor(
input a,b,
output diff,borrow
);

wire abar;


xor x1(diff,a,b);
not n1(abar,a);
and a1(borrow,abar,b);

endmodule





TESTBENCH

module full_subtractor_test();
reg a;
reg b;
reg bin;
wire diff;
wire borrow;

full_subtractor f1(.a(a),.b(b),.bin(bin),.diff(diff),.borrow(borrow));

integer count;

initial begin
for (count=0;count<8;count=count+1) begin
{a,b,bin}=count;
#20;
end
end
endmodule
