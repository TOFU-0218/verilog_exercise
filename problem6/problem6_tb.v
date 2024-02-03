module problem6_tb;
    reg [15:0] i_data = 16'h0;
    reg i_rst = 0;
    reg i_clk = 0;
    wire [2:0] o_data;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    problem6 DUT(
        .i_data (i_data),
        .i_rst (i_rst),
        .i_clk (i_clk),
        .o_data (o_data)
    );
    
    always #1 begin
        i_clk <= ~i_clk;
    end

    initial begin
        #2
        i_data = 16'hbbb0;
        #2
        i_data = 16'hbbb1;
        #2
        i_data = 16'h3422;
        #2
        i_rst = 1;
        #2
        $finish;
    end
endmodule
