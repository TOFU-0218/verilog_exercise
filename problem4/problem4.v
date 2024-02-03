module problem4(
    input i_clk,
    input i_rst,
    output reg [15:0] o_p
);

    // 加算
    wire [15:0] w_0;
    assign w_0 = 16'b0001 + o_p;

    // MUX
    reg [15:0] r_0 = 16'b0000;
    always @(posedge i_clk) begin
        o_p <= i_rst ? r_0 : w_0;
    end

endmodule