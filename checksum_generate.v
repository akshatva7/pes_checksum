module _8bitchecksum(data,checksum);
    input wire [31:0]data;
    output reg [7:0]checksum;

    reg overflow;
    reg sum;

    always@* begin
        {overflow,sum}=data[15:8]+data[7:0];
        sum=sum+overflow;

        {overflow,sum}=data[23:16]+sum;
        sum=sum+overflow;

        {overflow,sum}=data[31:23]+sum;
        sum=sum+overflow;

        checksum=~sum;
    end
endmodule
