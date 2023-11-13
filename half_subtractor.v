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

module half_subtractor_test();
reg a,b;
wire diff,borrow;

half_subtractor h1(.a(a),.b(b),.diff(diff),.borrow(borrow));

  initial begin
    $monitor("At time %0t: a=%b b=%b, difference=%b, borrow=%b",$time, a,b,diff,borrow);
    a = 0; b = 0;
    #10;
    a = 0; b = 1;
    #10;
    a = 1; b = 0;
    #10;
    a = 1; b = 1;
#10;
  end
endmodule
