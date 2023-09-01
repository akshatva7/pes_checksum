`include "checksum_generate.v"
module _8bitchecksum_tb();
    reg [31:0] data;
    wire [7:0] checksum;
    
    _8bitchecksum dut(.data(data),.checksum(checksum));
        initial begin
            data=32'h00000001;
            #10
            $display("%b",checksum);

            
        end
endmodule

