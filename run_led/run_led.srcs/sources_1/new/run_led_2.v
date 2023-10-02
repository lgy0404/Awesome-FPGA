// 四位led无法使用三八译码器实现
module run_led_2(
    input Clk,
    input Reset_n,
    output [3:0] Led  // 这里添加了reg型定义
);

    // 计数器1实现
    reg [25:0] counter;

    always @(posedge Clk or negedge Reset_n) begin
        if(!Reset_n) // 注意不能把复位状态和后边的逻辑合并
            counter <= 0;
        else if (counter == 24999999)
            counter <= 0;
        else
            counter <= counter + {25'b0,1'b1};  // 注意赋值需要加位宽限定
    end

    // 计数器2实现
    reg [2:0] counter2;

    always @(posedge Clk or negedge Reset_n) begin
        if(!Reset_n) // 注意不能把复位状态和后边的逻辑合并
            counter2 <= 0;
        else if (counter2 == 7)
            counter2 <= 0;
        else if (counter == 24999999)
            counter2 <= counter2 + 3'b1;  // 注意赋值需要加位宽限定
    end   

    //调用三八译码器模块实现跑马灯（例化一个写好的模块）
    decoder_3_8 decoder_3_8(
        .a(counter2[2]),
        .b(counter2[1]),
        .c(counter2[0]),
        .out(Led)
    );

endmodule
