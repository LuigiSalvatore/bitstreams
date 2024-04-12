module tb;


logic clock;
logic reset;
logic start;
logic split;
logic stop;
logic [7:0] an;
logic [7:0] dec_cat;

always #5 clock = ~clock;

initial begin
    start = 0;
    stop = 0;
    split = 0;
    clock = 0;
    reset = 1;
    #30000
    reset = 0;
    #10
    start = 1;
    #20
    start = 0;
    #40000 
    //stop = 1;
    #20 
    //stop = 0;
    #200 
    //split = 1;
    #20 
    split = 0;
    #20000
    start  =1;
    #20
    start = 0;
    #40000
    //split = 1;
    #20
    split = 0;
    #300000
    //split = 1;
    #20
    split = 0;
    //#100000
    //stop = 1;
    //#20
    //stop = 0;
end

top #(100_000_000, 1)top_inst(
    .clock(clock),
    .reset(reset),
    .start(start),
    .split(split),
    .stop(stop),
    .an(an),
    .dec_cat(dec_cat)
);




endmodule