`timescale 1ns/1ns //定义仿真时间刻度

//模块定义，测试模块不需要输入输出端口
module tb_decoder_3_8;

    //定义测试平台上的信号
    reg s_a;
    reg s_b;
    reg s_c;
    wire [7:0]out;

    //将被测试模块放在桌子上，贴个标签
    decoder_3_8 decoder_3_8(
        //连线，前边打点，后边加括号
        .a(s_a),
        .b(s_b),
        .c(s_c),
        .out(out)
    );

    initial begin
        s_a = 0; s_b = 0; s_c = 0;
        #200;
        s_a = 0; s_b = 0; s_c = 1;
        #200;
        s_a = 0; s_b = 1; s_c = 0;
        #200;
        s_a = 0; s_b = 1; s_c = 1;
        #200;
        s_a = 1; s_b = 0; s_c = 0;
        #200;
        s_a = 1; s_b = 0; s_c = 1;
        #200;
        s_a = 1; s_b = 1; s_c = 0;
        #200;
        s_a = 1; s_b = 1; s_c = 1;
        #200;
        $stop;
        end        
endmodule