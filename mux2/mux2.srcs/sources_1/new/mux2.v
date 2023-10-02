module mux2(
    input a,
    input b,
    input sel,
    output out
);
    // 根据sel的值定义输出
    assign out = (sel == 1) ? a : b;
endmodule
