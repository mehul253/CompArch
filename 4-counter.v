module counter4bit(
	output [3:0] q,
	input clock,
	input rst,
	input en
);
	wire clk;
	wire [3:0] t;
	assign t[0] = 1'b1;
	assign t[1] = q[0];
	and(t[2], q[1], q[0]);
	and(t[3], q[2], t[2]);

	assign clk = clock & en;

	tff ff1(q[0], t[0], clk, rst);
	tff ff2(q[1], t[1], clk, rst);
	tff ff3(q[2], t[2], clk, rst);
	tff ff4(q[3], t[3], clk, rst);

endmodule