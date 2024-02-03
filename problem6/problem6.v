module problem6(
    input [15:0] i_data,
    input i_rst,
    input i_clk,
    output reg [2:0] o_data
);

    // 第一段階のMUX
    wire [2:0] w_0;
    function [2:0] mux_function(
        input [15:0] i_data_input
    );
    begin
        case (i_data_input[1:0])
        2'b00 : mux_function = i_data_input[4:2];
        2'b01 : mux_function = i_data_input[7:5];
        2'b10 : mux_function = i_data_input[10:8];
        2'b11 : mux_function = i_data_input[13:11];
        default : mux_function = 3'b000;
        endcase
    end
    endfunction
    assign w_0 = mux_function(i_data);


    // 第二段階のMUX
    always @(posedge i_clk) begin
        if (i_rst) begin
            o_data <= 3'b000;
        end else begin
            o_data <= w_0;
        end
    end
endmodule