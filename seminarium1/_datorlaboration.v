// datorlaboration 1
// FPGA

module and_gate(input a, input b, output y);
    assign y = a & b;
end module

module top(input GP3, input GP4, output GP7);
    and_gate a(GP3, GP4, GP7);
endmodule
