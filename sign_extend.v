module sign_extend (
	input  [15:0] input,
	output [31:0] output
);

	reg [31:0] output;

	always @(input) begin 
		output = {{16{idata[15]}}, inputdata};
	end

endmodule