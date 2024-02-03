module problem_tb;
    reg [15:0] i_data_0 = 16'h0;
    reg [15:0] i_data_1 = 16'hf;
    reg [15:0] i_data_2 = 16'h5;
    reg [15:0] i_data_3 = 16'h8;
    reg [1:0] i_ctrl = 0;
    reg i_clk = 0;
    wire [15:0] o_data;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    problem5 DUT(
        .i_data_0   (i_data_0   ),
        .i_data_1   (i_data_1   ),
        .i_data_2   (i_data_2   ),
        .i_data_3   (i_data_3   ),
        .i_ctrl     (i_ctrl     ),
        .i_clk      (i_clk      ),
        .o_data     (o_data     )
    );

    always #1 begin
        i_clk <= ~i_clk;
    end

    initial begin
        #2
        i_ctrl = 2'd0;
        #2
        i_ctrl = 2'd1;
        #2
        i_ctrl = 2'd2;
        #2
        i_ctrl = 2'd3;
        #2
        i_data_0 = 16'hb;
        i_ctrl = 2'd0;
        #2
        $finish;
    end
endmodule
