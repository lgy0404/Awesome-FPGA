module counter_led_0(
    input Clk,
    input Reset_n,
    output reg Led // 在always中对Led赋值，这里定义为reg型
    );

    reg [25:0]counter;

    parameter MCNT = 50000000;

    // 计数器部分实现
    always @(posedge Clk or negedge Reset_n) begin
        if (!Reset_n)
            counter <= 0;
        else if (counter == MCNT - 1)
            counter <=0;
        else 
            counter <= counter +1'b1;
    end 

    // Led闪烁部分实现
    always @(posedge Clk or negedge Reset_n) begin
        if (!Reset_n)
            Led <= 0;
        else if (counter == MCNT - 1)
            Led <= 0;
        else if (counter == MCNT/2 -1)
            Led <= 1;
    end
endmodule
