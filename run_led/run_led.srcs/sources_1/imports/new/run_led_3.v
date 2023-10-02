module run_led_3(
    input Clk,
    input Reset_n,
    output reg [3:0] Led
);

    parameter MCNT = 25'd24999999;
    reg [25:0] counter;

    // 计数器实现
    always @(posedge Clk or negedge Reset_n) begin
        if(!Reset_n) 
            counter <= 0;
        else if (counter == MCNT)
            counter <= 0;
        else
            counter <= counter + 26'd1;  // 修正位宽
    end

    //移位法实现跑马灯
    always @(posedge Clk or negedge Reset_n) begin
        if(!Reset_n)
            Led <= 4'b0001;
        else if (counter == MCNT) begin  // 注意这里使用了修正后的名称`counter`
            if (Led == 4'b0000)
                Led <= 4'b0001;
            else
                Led <= Led << 1;  // 在这里，移位操作数是整数，所以不需要位宽修饰
        end
    end

endmodule
