module run_led4_test(
    input Clk,
    input Reset_n, // 复位端口，低电平复位，_n表示低电平有效
    output [3:0]Led // 四位LED灯 
);

    // 例化run_led4模块,注意四次例化每次的标签值不同
    run_led4 run_led4_inst0(
        .Clk(Clk),
        .Reset_n(Reset_n), 
        .Led(Led[0]) 
    );

    // 实现不同模块不同的LED闪烁频率
    defparam run_led4_inst0.MCNT =2499999;
    
    run_led4 run_led4_inst1(
        .Clk(Clk),
        .Reset_n(Reset_n), 
        .Led(Led[1]) 
    );    

    defparam run_led4_inst1.MCNT =4999999;

    run_led4 run_led4_inst2(
        .Clk(Clk),
        .Reset_n(Reset_n), 
        .Led(Led[2]) 
    );

    defparam run_led4_inst2.MCNT =7499999;

    run_led4 run_led4_inst3(
        .Clk(Clk),
        .Reset_n(Reset_n), 
        .Led(Led[3]) 
    );

    defparam run_led4_inst3.MCNT =9999999;
endmodule
