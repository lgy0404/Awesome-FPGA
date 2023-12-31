module decoder_3_8(
    input a,
    input b,
    input c,
    output reg [7:0] out
);
// 以always块描述的信号赋值，被赋值对象必须定义为reg类型
// {a,b,c}变成一个三位的信号，这种操作叫位拼接
    always @(*) begin
        case ({a, b, c})
            3'b000: out = 8'b0000_0001; // 当输入为 3'b000 时，输出 8'b0000_0001
            3'b001: out = 8'b0000_0010; // 当输入为 3'b001 时，输出 8'b0000_0010
            3'b010: out = 8'b0000_0100; // 当输入为 3'b010 时，输出 8'b0000_0100
            3'b011: out = 8'b0000_1000; // 当输入为 3'b011 时，输出 8'b0000_1000
            3'b100: out = 8'b0001_0000; // 当输入为 3'b100 时，输出 8'b0001_0000
            3'd5:   out = 8'b0010_0000; // 当输入为 3'd5 时，输出 8'b0010_0000
            3'b110: out = 8'b0100_0000; // 当输入为 3'b110 时，输出 8'b0100_0000
            3'b111: out = 8'b1000_0000; // 当输入为 3'b111 时，输出 8'b1000_0000
            default: out = 8'b0000_0000; // 默认情况下，输出为全0
        endcase
    end

endmodule