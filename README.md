# FPGA学习笔记

- 小梅哥Xilinx FPGA入门教程笔记

- 视频地址：[【零基础轻松学习FPGA】小梅哥Xilinx FPGA基础入门到项目应用培训教程_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1va411c7Dz/?spm_id_from=333.999.0.0)

---

❤️对你有帮助的话点个star吧~❤️

## 🆕最新消息

- 2023年9月19日
  - 仓库初始化，上传02A笔记
- 2023年9月20日
  - 上传02B笔记
- 2023年9月21日
  - 上传03-04笔记
- 2023年9月22日
	- 上传05笔记



## 💬遇到的问题

### 50MHZ时钟引脚分配

![image-20230921111334307](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230921111334307.png)

<img src="https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230921111422116.png" alt="image-20230921111422116" style="zoom:50%;" />

### counter作为中间量不分配引脚？

```verilog
set_property IOSTANDARD LVCMOS33 [get_ports {counter[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[0]}]
set_property PACKAGE_PIN N13 [get_ports Reset_n]
set_property PACKAGE_PIN D22 [get_ports Led]
set_property PACKAGE_PIN V4 [get_ports Clk]
set_property IOSTANDARD LVCMOS33 [get_ports Clk]
set_property IOSTANDARD LVCMOS33 [get_ports Led]
set_property IOSTANDARD LVCMOS33 [get_ports Reset_n]

```

![image-20230921111512944](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230921111512944.png)

### 引脚分配的时候IO std选择的原则是什么？

![image-20230921111559292](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230921111559292.png)

![image-20230921111653065](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230921111653065.png)

### 板子重启后烧录的程序不见了，还是回到了默认的流水灯

### Vivado的开发流程到底是什么样子的？

- 哪些是必须的哪些是可选的

![image-20230923202310368](https://lgy0404.oss-cn-shanghai.aliyuncs.com/typoraimage-20230923202310368.png)

### 跑马灯第4位到第0位有空缺？

