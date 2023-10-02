module run_led_1(
    input Clk,
    input Reset_n,
    output reg [3:0] Led
);

    reg [25:0] counter;

    // 计数器实现
    always @(posedge Clk or negedge Reset_n) begin
        if(!Reset_n) // 注意不能把复位状态和后边的逻辑合并
            counter <= 0;
        else if (counter == 24999999)
            counter <= 0;
        else
            counter <= counter + 26'b1;  // 注意赋值需要加位宽限定
    end

    //移位法实现跑马灯
    always @(posedge Clk or negedge Reset_n) begin
        if(!Reset_n)
            Led <= 4'b0001;
        else if (counter == 24999999)
            Led <= {Led[2:0], Led[3]};  // 使用位拼接进行（循环）移位，注意这里是023而不是034//Led[2:0]而不是Led[0:2]
    end

endmodule
