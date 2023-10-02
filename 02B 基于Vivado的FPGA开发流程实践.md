# 02B 基于Vivado的FPGA开发流程实践

## 创建工程

- 创建项目文件夹，可以勾选创建子目录

	<img src="https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920085630628.png" alt="image-20230920085630628" style="zoom: 50%;" />

- 选择项目类型

	<img src="https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920085730741.png" alt="image-20230920085730741" style="zoom:50%;" />

- 选择芯片类型

	<img src="https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920090024726.png" alt="image-20230920090024726" style="zoom:50%;" />

## 软件界面介绍

<img src="https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920090242543.png" alt="image-20230920090242543" style="zoom:50%;" />

## 添加源文件

### 软件操作

![image-20230920090411440](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920090411440.png)

- 端口定义不需要

	![image-20230920090502564](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920090502564.png)

- 二选一多路器 代码示例

	![image-20230920090856265](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920090856265.png)

	### 源文件程序

	```verilog
	`timescale 1ns / 1ps
	//////////////////////////////////////////////////////////////////////////////////
	// Company: 
	// Engineer: 
	// 
	// Create Date: 2023/09/20 09:05:27
	// Design Name: 
	// Module Name: mux2
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
	
	
	module mux2(
	    a;
	    b;
	    sel;
	    out;
	);
	    //定义输入输出
	    input a;
	    input b;
	    input sel;
	    output out;
	
	    //根据sel的值定义输出
	    assign out = (sel == 1)?a:b;
	
	
	endmodule
	```

修复的问题包括：

1. 模块端口应该在一对括号内声明，并且每个端口应该有一个方向（input 或 output）。
2. 端口声明的分号应该被逗号代替。
3. 最后一个端口声明后不需要分号。
4. `assign` 语句的条件表达式中使用了括号，这是正确的。

```verilog
module mux2(
    input a,
    input b,
    input sel,
    output out
);
    // 根据sel的值定义输出
    assign out = (sel == 1) ? a : b;
endmodule

```



## 分析和综合

![image-20230920091732516](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920091732516.png)

![image-20230920091610654](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920091610654.png)

- 快捷键F11

## 仿真验证

### 添加仿真文件

![image-20230920091826343](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920091826343.png)

- 命名：项目名+tb

	![image-20230920091943248](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920091943248.png)

- 以 一瞥开头

	![image-20230920092115715](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoratyporaimage-20230920092115715.png)

[Verilog中的时间尺度与延迟 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/400276246?utm_id=0)

#1 表示延时1ns

- 10的18次方 |艾[可萨] | E
- 10的15次方 |拍[它] | P
- 10的12次方 |太[拉] | T
- 10的 9次方 |吉[咖] | G
- 10的 6次方 | 兆 | M
- 10的 3次方 | 千 | k
- 10的 2次方 | 百 | h
- 10的 1次方 | 十 | da
- 10的-1次方 | 分 | d
- 10的-2次方 | 厘 | c
- 10的-3次方 | 毫 | m
- 10的-6次方 | 微 | μ
- 10的-9次方 |纳[诺] | n
- 10的-12次方 |皮[可] | p
- 10的-15次方 |飞[母托] | f
- 10的-18次方 |阿[托] | a

### testbench原理

- 给输入信号看输出结果

![image-20230920093201494](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920093201494.png)

### 例化

### 最终程序

```verilog
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
module mux2_tb(
//测试平台端口定义
    //输入端口reg（激励）型
    reg s_a;
    reg s_b;
    reg sel;
    //输出端口
    wire out;

//定义激励信号的具体值
    initial begin
        s_a = 0,s_b = 0,sel = 0;
        #200 //延时200ns
        s_a = 0,s_b = 0,sel = 1;
        #200 //延时200ns       
        s_a = 0,s_b = 1,sel = 0;
        #200 //延时200ns
        s_a = 0,s_b = 1,sel = 1;
        #200 //延时200ns
        s_a = 1,s_b = 0,sel = 0;
        #200 //延时200ns
        s_a = 1,s_b = 0,sel = 1;
        #200 //延时200ns
        s_a = 1,s_b = 1,sel = 0;
        #200 //延时200ns
        s_a = 1,s_b = 1,sel = 1;
        #200 //延时200ns
    end


//例化：将模块端口连接测试平台端口
//注意括号内的端口名和模块端口名可相同，可不同
    mux2 mux2_gy(
    .a(s_a);
    .b(s_b);
    .sel(sel);
    .out(out);
);
    );

endmodule

```



最终：

```verilog
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

```



### 进行验证

![image-20230920104506875](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920104506875.png)

![image-20230920105146569](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920105146569.png)



## 布局布线

![image-20230920105102846](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920105102846.png)

- 求和符号显示当前进度
- ![image-20230920105333628](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920105333628.png)

## 时序仿真

![image-20230920105435396](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920105435396.png)

- 注意波形图中的传输延迟、毛刺

- 真正做的时候大部分这一步骤

	![image-20230920105642812](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920105642812.png)

## 板级调试

### io planing

- 注意先打开这里
- ![image-20230920105855147](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920105855147.png)

- 组筛选

	![image-20230920105957278](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920105957278.png)

- 改后

	![image-20230920111142850](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920111142850.png)

- 产生约束文件

	![image-20230920111209770](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920111209770.png)

### bit stream

![image-20230920111256715](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230920111256715.png)
