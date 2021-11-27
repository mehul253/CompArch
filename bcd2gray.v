module bcdtogray (a, b);
	input [3:0]a;
	output [3:0]b;
	
	and a1(b[3], a[3], 1);
	xor x1(b[2], a[3], a[2]);
	xor x2(b[1], a[2], a[1]);
	xor x3(b[0], a[1], a[0]);
endmodule
module testbench;
	reg [3:0]a;
	wire [3:0]b;
	bcdtogray gray (a, b);
	initial
		begin
			$monitor(, "Time: %3d", $time, " Binary:%4b  Gray:%4b", a, b); 
			#0 a = 4'b0000;
			repeat(15)
				#10 a = a+4'b0001; //Only this will be repeated. Use begin-end for multiple statements.
			#160 $finish;
		end
endmodule