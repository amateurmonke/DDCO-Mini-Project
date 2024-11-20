`timescale 1ns / 1ps

module bit_counter_16bit_tb;
    reg [15:0] in;            
    wire [4:0] result;        


    bit_counter_16bit uut (
        .in(in),
        .result(result)
    );

    initial begin
        $dumpfile("dump.vcd"); 
        $dumpvars(0, bit_counter_16bit_tb); 
    end

    initial begin
        // Test case 1
        in = 16'b0000_0000_0000_0000;
        #10;
        $display("Input: %b, Ones Count: %d", in, result);

        // Test case 2
        in = 16'b1111_1111_1111_1111;
        #10;
        $display("Input: %b, Ones Count: %d", in, result);

        // Test case 3
        in = 16'b1010_1010_1010_1010;
        #10;
        $display("Input: %b, Ones Count: %d", in, result);

        // Test case 4
        in = 16'b0101_0101_0101_0101;
        #10;
        $display("Input: %b, Ones Count: %d", in, result);

        // Test case 5
        in = 16'b1100_0011_1110_0001; // 8 ones
        #10;
        $display("Input: %b, Ones Count: %d", in, result);

        // Test case 6
        in = 16'b0000_1001_0001_0001; // 4 ones
        #10;
        $display("Input: %b, Ones Count: %d", in, result);

        // Test case 7
        in = 16'b1000_0000_0000_0000; // 1 one
        #10;
        $display("Input: %b, Ones Count: %d", in, result);

        // Test case 8
        in = 16'b0000_0000_0000_0001; // 1 one
        #10;
        $display("Input: %b, Ones Count: %d", in, result);

        // Test case 9
        in = 16'b1111_0010_1111_0110; // 11 ones
        #10;
        $display("Input: %b, Ones Count: %d", in, result);


        $finish;
    end
endmodule
