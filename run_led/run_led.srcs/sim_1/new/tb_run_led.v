`timescale 1ns/1ns

module tb_run_led;
    // 定义输入输出端口
    reg Clk;
    reg Reset_n;
    wire [3:0] Led;

    //例化
    run_led_3
    #(
        .MCNT(2499)
    )
    run_led_inst(
    .Clk(Clk),
    .Reset_n(Reset_n),
    .Led(Led)
    );

    // defparam run_led_inst.MCNT = 5d'24999;   defparam不可以写在testbench中

    // 产生时钟
    initial Clk = 1;
    always #10 Clk = ~Clk;  // 每10ns一个翻转，每20ns一个上升沿，相当于每20ns一个周期

    // 产生复位信号
    initial begin
        Reset_n = 0;
        #10; // 延时10ns错开时钟边沿，使其与时钟对齐
        Reset_n = 1;
        #50000000; // 延时50ms为示例，根据需要进行调整
        $finish;   // 结束仿真
    end
    
endmodule
