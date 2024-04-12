module clocks #(parameter BASE_CLOCK = 100_000_000) (
    input logic clk,
    input logic reset,

    output logic clock_cs
);

    localparam bits_half_sec = $clog2(BASE_CLOCK/2);
    localparam bits_half_cs  = $clog2(BASE_CLOCK/200);
    logic [bits_half_sec-1:0] sec_reg;
    logic [bits_half_cs-1:0]  cs_reg;
    logic [6:0]               min_reg;
    logic [7:0]               hour_reg;
    logic                     clk_cs;
    // logic                     clk_s;


    always_comb begin 
        clock_cs = clk_cs;
        // clock_s  = clk_s;
    end


    always_ff@(posedge clk) begin
        if (reset) begin
            // sec_reg <= '1;
            cs_reg  <= '1;
            clk_cs  <= '1;
            // clk_s   <= '1;
        end else begin
            // if(sec_reg == (BASE_CLOCK/2)) begin
            //     clk_s   <= ~clk_s;
            //     sec_reg <= '0;
            // end else begin
            //     sec_reg <= sec_reg + 1;
            // end
            if(cs_reg == (BASE_CLOCK/200)) begin
                clk_cs <= ~clk_cs;
                cs_reg <= '0;
            end else begin
                cs_reg <= cs_reg + 1;
            end
        end
    end
    logic [31:0] medidor;
    always_ff@(posedge clk_cs or posedge reset) begin 
        if(reset) begin
            medidor <= '0;
        end else begin
            medidor <= medidor + 1'b1;
        end
    end



endmodule