`include "checksum_generate.v"
module bitchecksum_tb();
    reg [31:0] data;
    reg clk;
    wire [7:0] checksum;
          
    bitchecksum dut(.data(data),.checksum(checksum),.clk(clk));
           
   
        initial begin
            clk=0;
            forever
            
            #10 clk=~clk;
            end
            initial begin 
            #8;
            data=32'h00000001;
            #10;
            data=32'h00000010;
            #10;
            data=32'h00000100;
            #10;
            data=32'h00001000;
            #10;
            data=32'h00010000;
            #10;
            data=32'h00100000;
            #10;
            data=32'h01000000;
            #10;
            data=32'h10000000;
            #10;
                        
        end
        initial begin
        $dumpfile("checksum.vcd");
        $dumpvars(1,bitchecksum_tb);
    end
endmodule
