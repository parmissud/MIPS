module alu (
    input  [31:0] ALUIn1, ALUIn2,
    input  [ 2:0] ALUOp ,
    input [5:0] ALUFunc,
    output        zero,
    output [31:0] ALUOut
);
zero=1'b0;
    if(ALUOp==2'b00)begin
        if (ALUFunc==6'b100000) begin
            ALUOut=ALUIn1+ALUIn2;
        end
    end
    if (ALUOp==2'b01) begin
        ALUOut=ALUIn1+ALUIn2;
    end
    if (ALUOp==2'b10) begin
        if (ALUIn1==ALUIn2) begin
            assign zero=1'b1;
        end
    end
endmodule