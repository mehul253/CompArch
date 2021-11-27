module my_gates(a,b,out1,out2,out3);
input a,b;
output out1,out2,out3;
//my_or
wire or1,or2;
nand(or1,a,a);
nand(or2,b,b);
nand my_or(out1,or1,or2);

//my_and
wire and1;
nand(and1,a,b);
nand my_and(out2,and1,and1);

//my_not
nand my_not(out3,a,a);

endmodule


module xor_gate (a1,b1,out);
input a1,b1;
output out;
wire o1,o2,o3,o4;
my_gates m1(.a(a1),.out3(o1));
my_gates m2(.a(b1),.out3(o2));
my_gates m3(.a(o1),.b(b1),.out2(o3));
my_gates m4(.a(a1),.b(o2),.out2(o4));
my_gates m5(.a(o3),.b(o4),.out1(out));
endmodule


module stimulus;
reg a,b;
wire out;
xor_gate x(a,b,out);
initial begin
    a=1'b1 ;b=1'b1;
    #5 a=1'b1; b=1'b0;
end

initial begin
$monitor($time," a=%b b=%b xor=%b",a,b,out);    
end

endmodule    

    
// endmodule
// module stimulus;
// reg a,b;
// wire out1,out2,out3;
// my_gates mg(a,b,out1,out2,out3);

// initial begin
// $monitor($time," a=%b b=%b or=%b and=%b not=%b",a,b,out1,out2,out3);    
// end
// initial begin
//     a=1'b1 ;b=1'b1;
//     #5 a=1'b1; b=1'b0;
// end
// endmodule