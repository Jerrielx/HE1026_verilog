module clock_100hz(output CLOCK_100HZ);

    wire baseclock;
    reg [15:0] counter;

    //Clock divider
    parameter period = 100;

    //10KHz base clock
    SB_LFOSC inthosc (
        .CLKLFPU(1'b1),
        .CLKLFEN(1'b1),
        .CLKLF(baseclock)
    );

    initial begin
        counter = 0;
    end

    //Clock is high for half of the period for symmetric waveform
    assign CLOCK_100HZ = counter < (period >> 1);

    //Reset counter at period end
    always @(posedge baseclock) begin
        if(counter == (period - 1)) counter <= 0;
        else counter <= counter + 1;
    end

endmodule

