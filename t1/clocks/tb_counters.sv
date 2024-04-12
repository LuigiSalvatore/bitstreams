module tb;

logic clk;
logic reset;
initial begin
    clk = 0;
    reset = 1;
    #20 reset = 0;
end

always begin
    #5 clk = ~clk;
end


clocks  dut  (
    .clk(clk),
    .reset(reset),
    .clock_cs(clk_cs),
    .clock_s(clk_s),
    .clock_m(clk_m),
    .clock_h(clk_h)
);

endmodule