module led_flash(
    input Clk,
    input Reset_n, // 复位端口，低电平复位，_n表示低电平有效
    output reg Led // 在 always 中对 Led 赋值，需要定义为 reg 型
);

    reg [24:0]counter; // 需要 25 位才能正确表示计数

    // Led 部分
    always @(posedge Clk or negedge Reset_n) begin
        // 时序逻辑描述的标准格式，总是关注时钟的上升沿，以此作为敏感信号进行工作
        // 或者复位信号的下降沿
        if (!Reset_n)
            Led <= 0; // <= 是非阻塞赋值
        else if (counter == 24999999)  // 注意这里24999999
            Led <= !Led;
    end

    // Counter 部分
    always @(posedge Clk or negedge Reset_n) begin
        // 时序逻辑描述的标准格式，总是关注时钟的上升沿，以此作为敏感信号进行工作
        // 或者复位信号的下降沿
        if (!Reset_n)
            counter <= 0;
        else if (counter == 24999999)
            counter <= 0;
        else
            counter <= counter + 1'b1; // 递增计数器
    end

endmodule
