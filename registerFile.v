module regfile (
	input  clk,
	input  [ 4:0] RN1,
	input  [ 4:0] RN2,
    input [4:0] WN,
	output [31:0] RD1,
	output [31:0] RD2,
    input [31:0] Input,
    input RegWrite,
);

	reg [31:0] regbank[63:0];
    reg [31:0]WD;
    

	always @(RN1 or regbank[RN1]) begin
		if (0 == RN1) begin
			RD1 = 0;
		end else begin
			RD1 = regbank[RN1];
		end
	end

	always @(RN2 or regbank[RN2]) begin
		if (0 == RN2) begin
			RD2 = 0;
		end else begin
			RD2 = regbank[RN2];
		end
	end

	always@ (posedge clk) begin
		if(RegWrite==1'b1) begin
            regbank[WN]=Input;
        end
	end

endmodule