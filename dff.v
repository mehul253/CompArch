
module dff_sync_clear(d, clearb,
clock, q);
input d, clearb, clock;
output q;
reg q;
always @ (posedge clock)
begin
if (!clearb) 
q <= 1'b0;
else 
q <= d;
end
endmodule


module dff_async_clear(
        output q,
        input d,
        input clock,
        input clear
    );

    reg q;

        always @(posedge clock or clear) begin

            if(clear)
                q = 0;
            else
                q = d;

        end

    endmodule


module Testing;
reg d, clk, rst;
wire q;
dff_sync_clear dff (d, clk, rst, q); // Or dff_async_clear dff (d, clk,
//rst, q);
//Always at rising edge of clock display the signals
always @(posedge clk)begin
$display($time,"d=%b, clk=%b, rst=%b, q=%b\n", d, clk, rst, q);
end
//Module to generate clock with period 10 time units
initial begin
forever begin
clk=0;
#5
clk=1;
#5
clk=0;
end
end
initial begin
d=0; rst=1;
#4
d=1; rst=0;
#50
d=1; rst=1;
#20
d=0; rst=0;
end
endmodule
