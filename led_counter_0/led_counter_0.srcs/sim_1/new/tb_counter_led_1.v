`timescale 1ns/1ns

module tb_counter_led_1;

    // 定义输入输出端口
    reg Clk;
    reg Reset_n;
    wire Led;

    // 例化，贴标签
    counter_led_1
    #(
        .MCNT(50000)
    )
    led_flash (
        .Clk(Clk),
        .Reset_n(Reset_n), 
        .Led(Led)
    );

    initial  Clk = 1; // 程序初始化的时候 Clk 赋值为 1
    always #10 Clk = !Clk; // 每延时 10ns 翻转一次，一个周期 20ns 的时钟
    
    initial begin
        Reset_n = 0;
        #201; // 避开 Clk 的上升沿
        Reset_n = 1; 
        #2000000000; // Led 每 500ms 才变化一次
        $stop;
    end
    
endmodule
