module top #(
    parameter BASE_CLOCK = 100_000_000,
    parameter SIMULATION = 1'b0
) (
    input logic clock,
    input logic reset,
    input logic start,
    input logic stop,
    input logic split,
    output logic [7:0] an,
    output logic [7:0] dec_cat
);

logic       clock_cs;
logic       clock_s;
logic       clock_m;
logic       clock_h;

logic       start_int;
logic       stop_int;
logic       split_int;
logic       enable_counting;

logic [7:0] elapsed_cs;
logic [7:0] elapsed_s;
logic [6:0] elapsed_m;
logic [7:0] elapsed_h;

logic [3:0] u_cs, d_cs;
logic [3:0] u_s, d_s;
logic [3:0] u_m, d_m;
logic [3:0] u_h, d_h;

logic [3:0] s_reg_u_cs, s_reg_d_cs;
logic [3:0] s_reg_u_s,  s_reg_d_s;
logic [3:0] s_reg_u_m,  s_reg_d_m;
logic [3:0] s_reg_u_h,  s_reg_d_h;

logic [5:0] count_split;
logic       done_split;

typedef enum logic[3:0] { 
    IDLE     = 4'b0001,
    COUNTING = 4'b0010,
    SPLIT    = 4'b0100,
    STOP     = 4'b1000
} states;

states EA, PE;

always_ff@(posedge clock) begin
    if(reset) begin 
        EA <= IDLE;
    end else begin 
        EA <= PE;
    end
end

always_comb begin : fsm_switch
PE <= IDLE;
    unique case(EA)
        IDLE: begin
            if(start_int) begin
                PE <= COUNTING;
            end else begin
                PE <= IDLE;
            end
        end
        COUNTING: begin
            if(stop_int) begin
                PE <= STOP;
            end else if(split_int) begin
                PE <= SPLIT;
            end else begin 
                PE <= COUNTING;
            end
        end
        SPLIT: begin
            if(done_split) begin
                PE <= COUNTING;
            end else begin
                PE <= SPLIT;
            end

        end
        STOP: begin
            if(start_int) begin
                PE <= COUNTING;
            end else begin
                PE <= STOP;
            end
        end
    endcase
end

always_ff@(posedge clock_cs) begin
    if(reset) begin
       count_split <= '0;
       done_split  <= 1'b0;
    end else begin
        if(EA == SPLIT) begin
            count_split <= count_split + 1'b1;
        end 
        if(count_split == 6'd50) begin
            count_split <= '0;
            done_split  <= 1'b1;
        end else begin
            done_split  <= 1'b0;
        end
    end
end


always_ff@(posedge clock) begin : fsm_actions
    if(reset) begin
        s_reg_u_cs <= '0; 
        s_reg_d_cs <= '0;
        s_reg_u_s  <= '0;
        s_reg_d_s  <= '0;
        s_reg_u_m  <= '0;
        s_reg_d_m  <= '0;
        s_reg_u_h  <= '0;
        s_reg_d_h  <= '0;

        


        enable_counting <= 1'b0;
    end
    else begin
        if(split_int && EA == COUNTING) begin
            s_reg_u_cs <= u_cs;
            s_reg_d_cs <= d_cs;
            s_reg_u_s  <= u_s;
            s_reg_d_s  <= d_s;
            s_reg_u_m  <= u_m;
            s_reg_d_m  <= d_m;
            s_reg_u_h  <= u_h;
            s_reg_d_h  <= d_h;
        end
        if(EA == COUNTING || EA == SPLIT) begin
            enable_counting <= 1'b1;
        end else begin
            enable_counting <= 1'b0;
        end
    end
end




always_ff@(posedge clock_cs or posedge reset) begin
    if (reset) begin
        elapsed_cs <= '0;
        elapsed_cs <= '0;
        elapsed_s  <= '0;
        elapsed_m  <= '0;
        elapsed_h  <= '0;
    end 
    else begin
       
        if(enable_counting) begin
            if(elapsed_cs == 'd100) begin
                elapsed_cs <= 0;
                elapsed_s <= elapsed_s + 1;
            end
            else begin
                elapsed_cs <= elapsed_cs + 1'b1;
            end
            if(elapsed_s == 'd60) begin
                elapsed_m <= elapsed_m + 1;
                elapsed_s <= 0;
            end
            if(elapsed_m == 'd60) begin
                elapsed_h <= elapsed_h + 1;
                elapsed_m <= 0;
            end
            if(elapsed_h == 'd100) begin
                elapsed_h <= 0;
            end
        end
    end
end







edge_detector edge_start(
    .clock(clock),
    .reset(reset),
    .din(start),
    .rising(start_int)
);
edge_detector edge_stop(
    .clock(clock),
    .reset(reset),
    .din(stop),
    .rising(stop_int)
);
edge_detector edge_split(
    .clock(clock),
    .reset(reset),
    .din(split),
    .rising(split_int)
);

dspl_drv_NexysA7 dspl(
    .clock(clock),
    .reset(reset),
    .d1({1'b1,u_cs,1'b0}),
    .d2({1'b1,d_cs,1'b0}),
    .d3({1'b1,u_s,1'b0}),
    .d4({1'b1,d_s,1'b0}),
    .d5({1'b1,u_m,1'b0}),
    .d6({1'b1,d_m,1'b0}),
    .d7({1'b1,u_h,1'b0}),
    .d8({1'b1,d_h,1'b0}),
    .an(an),
    .dec_cat(dec_cat)
);

ila_elapsed ila(
    .clk(clock),
    .probe0(elapsed_cs),
    .probe1(elapsed_s),
    .probe2(elapsed_m),
    .probe3(elapsed_h)
);

if (SIMULATION == 1'b1) begin
    clocks #(BASE_CLOCK/10000) clocker (
    .clk     (clock),
    .reset   (reset),
    .clock_cs(clock_cs)
    // ,
    // .clock_s (clock_s),
    // .clock_m (clock_m),
    // .clock_h (clock_h)
    );
end else begin
    clocks #(BASE_CLOCK) clocker (
    .clk     (clock),
    .reset   (reset),
    .clock_cs(clock_cs)
    // ,
    // .clock_s (clock_s),
    // .clock_m (clock_m),
    // .clock_h (clock_h)
);
end

always_comb begin
    if(EA ==  SPLIT) begin 
        u_cs = s_reg_u_cs;
        d_cs = s_reg_d_cs;
        u_s  = s_reg_u_s;
        d_s  = s_reg_d_s;
        u_m  = s_reg_u_m;
        d_m  = s_reg_d_m;
        u_h  = s_reg_u_h;
        d_h  = s_reg_d_h;
    end else begin
        u_cs = elapsed_cs % 10;
        d_cs = elapsed_cs / 10;
        u_s  = elapsed_s  % 10;
        d_s  = elapsed_s  / 10;
        u_m  = elapsed_m  % 10;
        d_m  = elapsed_m  / 10;
        u_h  = elapsed_h  % 10;
        d_h  = elapsed_h  / 10;
    end
end



endmodule