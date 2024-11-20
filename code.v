module bit_counter_4bit(
    input [3:0] in,
    output reg [3:0] count
);
    integer i;
    always @(*) begin
        count = 0;
        for (i = 0; i < 4; i = i + 1) begin
            if (in[i] == 1) count = count + 1;
        end
    end
endmodule

module adder_4bit(
    input [3:0] a,
    input [3:0] b,
    output [3:0] sum,
    output cout
);
    assign {cout, sum} = a + b;
endmodule

module bit_counter_16bit(
    input [15:0] in,
    output [4:0] result
);
    wire [3:0] count0, count1, count2, count3;
    wire [3:0] sum1, sum2;
    wire [4:0] final_sum;
    wire c_out1, c_out2, c_out3;

    // Four 4-bit counters
    bit_counter_4bit counter0 (.in(in[3:0]), .count(count0));
    bit_counter_4bit counter1 (.in(in[7:4]), .count(count1));
    bit_counter_4bit counter2 (.in(in[11:8]), .count(count2));
    bit_counter_4bit counter3 (.in(in[15:12]), .count(count3));

    // 1st stage of addition
    adder_4bit add1 (.a(count0), .b(count1), .sum(sum1), .cout(c_out1));
    adder_4bit add2 (.a(count2), .b(count3), .sum(sum2), .cout(c_out2));

    // 2nd stage of addition
    adder_4bit add3 (.a(sum1), .b(sum2), .sum(final_sum[3:0]), .cout(c_out3));

    // combine final carry op, 5bit sum
    assign final_sum[4] = c_out1 | c_out2 | c_out3;
    assign result = final_sum;
endmodule
