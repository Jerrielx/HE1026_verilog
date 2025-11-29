module xnor_gate(input a, input b, output y);
    assign y = !(a ^ b);
endmodule

module four_xnor(input [3:0] a, input [3:0] b, output [3:0] y);
    xnor_gate xn0(a[0], b[0], y[0]);
    xnor_gate xn1(a[1], b[1], y[1]);
    xnor_gate xn2(a[2], b[2], y[2]);
    xnor_gate xn3(a[3], b[3], y[3]);
endmodule