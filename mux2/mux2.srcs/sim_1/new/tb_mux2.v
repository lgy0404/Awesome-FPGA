`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/20 09:19:13
// Design Name: 
// Module Name: mux2_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//测试文件不需要端口
module mux2_tb;

//测试平台端口定义
//输入端口reg（激励）型
reg s_a;
reg s_b;
reg sel;
//输出端口
wire out;

//定义激励信号的具体值
initial begin
    s_a = 0; s_b = 0; sel = 0;
    #200; //延时200ns
    s_a = 0; s_b = 0; sel = 1;
    #200; //延时200ns       
    s_a = 0; s_b = 1; sel = 0;
    #200; //延时200ns
    s_a = 0; s_b = 1; sel = 1;
    #200; //延时200ns
    s_a = 1; s_b = 0; sel = 0;
    #200; //延时200ns
    s_a = 1; s_b = 0; sel = 1;
    #200; //延时200ns
    s_a = 1; s_b = 1; sel = 0;
    #200; //延时200ns
    s_a = 1; s_b = 1; sel = 1;
    #200; //延时200ns
end

//例化：将模块端口连接测试平台端口
//注意括号内的端口名和模块端口名可相同，可不同
mux2 mux2_gy (
    .a(s_a),
    .b(s_b),
    .sel(sel),
    .out(out)
);

endmodule
