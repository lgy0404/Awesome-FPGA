module run_led(
    input Clk,
    input Reset_n,
    output reg [3:0]Led
);

    reg [25:0]conunter;

    // 计数器实现
    always @(posedge Clk or negedge Reset_n) begin
        if(!Reset_n) // 注意不能把复位状态和后边的逻辑合并
            conunter <= 0;
        else if (conunter == 24999999)
            conunter <= 0;
        else
            conunter <= conunter + 1'b1;  // 注意赋值需要加位宽限定
    end

    //移位法实现跑马灯
    always @(posedge Clk or negedge Reset_n) begin
        if(!Reset_n)
            Led <= 4'b0001;
        else if (conunter == 24999999)begin
            if (Led == 4'b0000)
                Led <= 4'b0001;
            else
                Led <= Led << 1;
        end
    end

endmodule