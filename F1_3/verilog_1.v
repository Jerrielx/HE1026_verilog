module and_gate(input a, input b, output y);
assign y = a & b;
endmodule

// Moduler - input/output
module modulnamn(input [1:0] in, output y)
// kod som beskriver kretsens beteende
endmodule

reg [1:0] stage; // 2 bitar bred, typen reg, variabelnamn state, bitvektor
state = {bit1, bit0}
state[1] = MSB
state[0] = LSB

// utan vektor
module not_32b(input in0, input in1, ... input in31, output out0, ... output out31);
// kod som beskriver kretsens beteende
endmodule
// Med vektor
module not_32b(input [31:0] in, output [31:0] out);
endmodule

assign y = a & b;   // kombinatoriska kretsar
övning
assign F = (A & B) | (!A & !B);
assign F = !(A^B);      // xnor

// Instansiering - kombinatoriska kretsar
// xnor
module xnor_gate(input a, input b, output y);
    assign y = !(a ^ b);
endmodule
// xnor4
module four_xnor(input [3:0] a, input [3:0] b, output [3:0] y);
    xnor_gate xn0(a[0], b[0], y[0]);
    xnor_gate xn1(a[1], b[1], y[1]);
    xnor_gate xn2(a[2], b[2], y[2]);
    xnor_gate xn3(a[3], b[3], y[3]);
endmodule
// inbyggda primitiver
// and, or, xor, nand, nor, xnor

// Procedurer - AND-grind
// exempel
module and_gate(input a, input b, output reg y);

    // always, sensitivitet
    // gör detta när a eller b ändras
    // input behöver inte vara reg
    always @(a or b) begin
    // always @(*) begin    gör detta när någon signal inom proceduren ändras

        if(a == 1'b1 & b == 1'b1) y = 1'b1;
        else y = 1'b0;
    end
endmodule

if(a == b) begin
    y = a;
    c = 1'b0;
end else begin
    y = 1'b0;
    c = b;
end

// Procedurer - case
module mux4(input [3:0] d, input [1:0] sel, output reg y);
    always @(d, sel) begin
        case(sel)
        2'b00: y = d[0];
        2'b01: y = d[1];
        2'b10: y = d[2];
        2'b11: y = d[3];
        endcase
    end
endmodule
module mux4(input [3:0] d, input [1:0] sel, output reg y);
    assign y = d[sel];
endmodule

// Procedurer - "Miniräknare"
module miniraknare(
    input [7:0] a, input [7:0] b,
    input [1:0] operation,
    output reg [7:0] y);
    always @(*) begin
        case(operation)
        2'b00: y = a + b; //plus
        2'b01: y = a - b; //Minus
        2'b10: y = a & b; //AND
        2'b11: y = a | b; //OR
        endcase
    end
endmodule
