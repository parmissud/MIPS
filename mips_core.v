`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
module mips_core (clk, rst, iaddr, idata, daddr, dwr, ddout, ddin);
	input  clk;
	input  rst;
	output [5:0]  iaddr;
	input  [31:0] idata;
	output reg [5:0]  daddr;
	input  [31:0] ddout; 
	output reg [31:0] ddin;
	output  reg      dwr;
//Data elements
	wire [31:0] npc;
	reg  [31:0] f_pc;
	reg  [31:0] d_pc;
	reg  [31:0] x_pc;
	wire [31:0] f_ir;
	reg  [31:0] d_ir;
	wire [31:0] d_regA;
	reg  [31:0] x_regA;
	wire [31:0] d_regB;
	reg  [31:0] x_regB;
	reg  [31:0] m_regB;
	reg  [31:0] m_ddout;
	reg  [31:0] w_ddout;
	wire [31:0] WB;
	wire [31:0] aluA;
	wire [31:0] aluB;
	reg  [31:0] x_aluZ;
	wire signed [31:0] aluA_signed;
	wire signed [31:0] aluB_signed;
	reg  signed [31:0] x_aluZ_signed;
	reg  signed [31:0] m_aluZ_signed;
	reg  signed [31:0] w_aluZ_signed;
	reg  [31:0] m_aluZ;
	reg  [31:0] w_aluZ;
	reg  		x_aluZero;
	reg  		m_aluZero;
	//Instruction elements
	wire [5:0]	op;
	reg [5:0]   d_op;
	reg [5:0]   x_op;
	wire [5:0]  func;
	wire [4:0]  sham;
	wire [4:0]  rs;
	wire [4:0]  rt;
	reg [4:0] 	d_rs;
	reg [4:0] 	d_rt;
	reg [4:0]	x_rs;
	reg [4:0] 	x_rt;
	reg [4:0]	m_rt;
	reg [4:0]	d_rd1;
	reg [4:0]   d_rd2;
	reg [4:0]   x_rd1;
	reg [4:0]   x_rd2;
	wire [15:0] d_imm16;
	reg  [15:0] x_imm16;
	wire [31:0] x_imm32;
	reg [31:0]  sum;
	reg [31:0]  sub;
	reg [31:0]  save;
	reg [31:0] rb [0:31]; // 32 rows of 32-bits
	//Control signals
	reg [3:0]	d_alu_func;
	reg [3:0]	x_alu_func;
	reg	[1:0]		d_s5;
	reg	[1:0]		x_s5;
	reg	[1:0]		m_s5;
	reg	[1:0]		d_s6;
	reg [1:0]		s11;
	reg	[1:0]		x_s6;
	reg	[1:0]		m_s6;
	reg 			d_s1;
	reg 			x_s1;
	reg 			d_s2;
	reg 			x_s2;
	reg 			d_s3;
	reg				d_s8;
	reg 			x_s3;
	reg 			m_s3;
	reg 			w_s3;
	reg 			d_s7;
	reg 			x_s7;
	reg 			m_s7;
	reg 			w_s7;
	reg 			d_s9;
	reg				d_s10;
	reg				x_s10;
	reg				m_s10;	
	reg				w_s10;	
	reg 			x_s8;
	reg 			x_s4;
	reg				d_s4;
	reg				m_s4;
	reg 			d_memwr;
	reg 			x_memwr;
	reg				m_memwr;
	reg 			d_regw;
	reg 			x_regw;
	reg				w_regw;
	reg	[4:0]		x_rd;
	reg[4:0] 		m_rd;
	reg	[4:0]		w_rd;
	reg[4:0]		x_sham;
	reg[4:0]		d_sham;
	reg				d_s12;
	reg				x_s12;
//***********************	
// Registers
//***********************	
	always @(posedge clk)
	begin
    if(rst)
		begin
			f_pc = 0;
			d_s3=0;
			m_rd=0;
			d_s5=0;
			d_s6=0;
			x_s5=0;
			d_s5=0;
			m_aluZero=0;
			m_aluZ=0;
			w_aluZ=0;
			m_rt=0;
			d_s8=0;
			sum=0;
			sub=0;
			m_rd=0;
			d_s9=0;
			d_s10=0;
			s11=0;
    	end
	else if (op==6'b000100 |op==6'b010001| op==6'b001100 | op==6'b001101 |op==6'b001110|op==6'b010000|op==6'b000010|op==6'b011111) begin
				
				d_pc <= 0;
				d_ir <= 0;
				x_alu_func <= d_alu_func;
				x_s1 <= d_s1;
				x_s2 <= d_s2;
				x_s3 <= d_s3;
				x_s4 <= d_s4;
				x_s5 <= d_s5;
				x_s6 <= d_s6;
				x_memwr <= d_memwr;
				x_regw <= d_regw;
				x_regA <= d_regA; 
				x_regB <= d_regB;
				x_imm16 <= d_imm16;
				m_aluZero<=x_aluZero;
				m_aluZ<=x_aluZ;
				x_rs<=d_rs;
				x_rt<=d_rt;
				m_rt<=x_rt;
				m_regB<=x_regB;
				m_memwr<=x_memwr;
				w_ddout<=m_ddout;
				w_aluZ<=m_aluZ;
				w_regw<=x_regw;
				w_rd<=m_rd;
				x_rd1<=d_rd1;
				x_rd2<=d_rd2;
				m_ddout<=ddout;
				m_rd<=x_rd;
				m_s5<=x_s5;
				m_s6<=x_s6;
				x_s3<=m_s3;
				m_s3<=x_s3;
				w_s7<=m_s7;
				m_s7<=x_s7;
				x_s7<=d_s7;
				x_s8<=d_s8;
				x_op<=d_op;
				m_s4<=x_s4;
				x_s10<=d_s10;
				m_s10<=x_s10;
				w_s10<=m_s10;
				m_aluZ_signed<=x_aluZ_signed;
				w_aluZ_signed<=m_aluZ_signed;
				s11<=1;
				x_sham<=d_sham;
				x_s12<=d_s12;
	 end 
	else if ((d_rt==x_rt|d_rt==x_rs) &op!=6'b000000) begin
				
				x_alu_func <= 0;
				x_s1 <= 0;
				x_s2 <= 0;
				x_s3 <= 0;
				x_s4 <= 0;
				x_s5 <= 0;
				x_s6 <= 0;
				x_memwr <= 0;
				x_regw <= 0;
				x_regA <= 0; 
				x_regB <= 0;
				x_imm16 <= 0;
				m_aluZero<=x_aluZero;
				m_aluZ<=x_aluZ;
				x_rs<=0;
				x_rt<=0;
				m_rt<=x_rt;
				m_regB<=x_regB;
				m_memwr<=x_memwr;
				w_ddout<=m_ddout;
				w_aluZ<=m_aluZ;
				w_regw<=x_regw;
				w_rd<=m_rd;
				x_rd1<=d_rd1;
				x_rd2<=d_rd2;
				m_ddout<=ddout;
				m_rd<=x_rd;
				m_s5<=x_s5;
				m_s6<=x_s6;
				x_s3<=m_s3;
				m_s3<=x_s3;
				m_s7<=x_s7;
				x_s7<=0;
				w_s7<=m_s7;
				x_s8<=d_s8;
				m_s4<=x_s4;
				x_op<=d_op;
				x_s10<=d_s10;
				m_s10<=x_s10;
				w_s10<=m_s10;
				m_aluZ_signed<=x_aluZ_signed;
				w_aluZ_signed<=m_aluZ_signed;
				s11<=1;
				x_sham<=d_sham;
				x_s12<=d_s12;


	 end
	else 
			begin
				f_pc <= npc;
				d_pc <= f_pc;
				d_ir <= f_ir;
				x_alu_func <= d_alu_func;
				x_s1 <= d_s1;
				x_pc<=d_pc;
				x_s2 <= d_s2;
				x_s3 <= d_s3;
				x_s4 <= d_s4;
				x_s5 <= d_s5;
				x_s6 <= d_s6;
				x_memwr <= d_memwr;
				x_regw <= d_regw;
				x_regA <= d_regA; 
				x_regB <= d_regB;
				x_imm16 <= d_imm16;
				m_aluZero<=x_aluZero;
				m_aluZ<=x_aluZ;
				x_rs<=d_rs;
				x_rt<=d_rt;
				m_rt<=x_rt;
				m_regB<=x_regB;
				m_memwr<=x_memwr;
				w_ddout<=m_ddout;
				w_aluZ<=m_aluZ;
				w_regw<=x_regw;
				w_rd<=m_rd;
				x_rd1<=d_rd1;
				x_rd2<=d_rd2;
				m_ddout<=ddout;
				m_rd<=x_rd;
				m_s5<=x_s5;
				m_s6<=x_s6;
				x_s3<=m_s3;
				m_s3<=x_s3;
				m_s7<=x_s7;
				x_s7<=d_s7;
				w_s7<=m_s7;
				x_s8<=d_s8;
				m_s4<=x_s4;
				x_op<=d_op;
				x_s10<=d_s10;
				m_s10<=x_s10;
				w_s10<=m_s10;
				m_aluZ_signed<=x_aluZ_signed;
				w_aluZ_signed<=m_aluZ_signed;
				s11<=0;
				x_sham<=d_sham;
				x_s12<=d_s12;

			end
	end

	//***********************	
	// Fetch
	//***********************
	assign npc =( f_pc + 1);	
	assign iaddr = f_pc[5:0];
	assign f_ir = idata;
	//**************
	// Decode
	//**************
	assign op = d_ir[31:26];
	assign func = d_ir[5:0];
	assign sham = d_ir[10:6];
	assign rt = d_ir[20:16];
	assign rs = d_ir[25:21];
	//  d_rd1 = d_ir[15:11];
	//  d_rd2 = d_ir[20:16];
	assign d_imm16 = d_ir[15:0];
	// decode
	always @(*)
	begin
		d_sham=sham;
		d_op=op;
		d_rs=rs;
		d_rt=rt;
		d_rd1 = d_ir[15:11];
		d_rd2 = d_ir[20:16];
		d_alu_func = 4'b0000;
		d_s1 = 0;
		d_s2 = 0;
		d_memwr = 0;
		d_regw = 0;
		d_s5=0;
		d_s6=0;
		d_s12=0;
		if(op==6'b000000 )begin
		if (x_rd==d_rs ) begin
			d_s5=1'd1;
		end
		if (x_rd==d_rt ) begin
			d_s6=1'd1;
		end
		if (m_rd==d_rs ) begin
			d_s5=2'b10;
		end
		if (m_rd==d_rt ) begin
			d_s6=2'b10;
		end
		if (m_rt==d_rt & op!=6'b000000) begin
			d_s5=2'b11;
			end
		if(m_rt==d_rs & op!=6'b000000)begin 
			d_s5=2'b11;
			end
		end
		else if(6'b001010|6'b001001|6'b101011 | 6'b000011 |6'b000101 | 6'b000001 |6'b000111|6'b000110|6'b001000)begin  //sw
			if (x_rd==d_rt) begin
			d_s6=1'd1;
			end
			if (m_rd==d_rt) begin
			d_s6=1'd2;
		end
		end
		case (op)
			6'b000000: 	// R-Type
				case (func)
					6'b100000: 	// ADD 
					begin
						d_alu_func = 4'b0000;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
					6'b100000: 	// SLT 
					begin
						d_alu_func = 4'b1110;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
					6'b100110: 	// DIV 
					begin
						d_alu_func = 4'b1011;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=1;
					end
					6'b111111: 	// DIV_UNSIGNED
					begin
						d_alu_func = 4'b1111;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
					6'b100111: 	// NOR
					begin
						d_alu_func = 4'b1100;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
					6'b101111: 	// XOR 
					begin
						d_alu_func = 4'b1101;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
					6'b100011:  // ADD_UNSIGNED
					begin
						d_alu_func = 4'b0100;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_s10=1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
					end
					6'b100010: 	// SUB 
					begin
						d_alu_func = 4'b0001;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
					6'b100101: 	// SUB_UNSIGNED
					begin
						d_alu_func = 4'b0101;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_s10=1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
					end
					
					6'b111000: 	// OR 
					begin
						d_alu_func = 4'b0011;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
					6'b100100: 	// AND 
					begin
						d_alu_func = 4'b0010;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
					6'b110000: 	// MULTIPY
					begin
						d_alu_func = 4'b0110;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
					6'b101010: 	// MULTIPY UNSIGNED
					begin
						d_alu_func = 4'b0110;
						d_s1 = 0;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
					6'b110011: 	// RIGHT_SHIFT_BY_RS
					begin
						d_alu_func = 4'b0111;
						d_s1 = 1;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
						d_s12=1;
					end
					6'b111011: 	// LEFT_SHIFT_BY_RS
					begin
						d_alu_func = 4'b0111;
						d_s1 = 1;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
						d_s12=1;
					end
					6'b111110: 	// SLT_IMM
					begin
						d_alu_func = 4'b1110;
						d_s1 = 1;
						d_s2 = 0;
						d_s3 = 0;
						d_s4 = 1;
						d_memwr = 0;
						d_regw = 1;
						d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end


				endcase				
			6'b000100:	// BEQ
					begin
						d_s1 = 0;
						d_s7 =0;
						d_memwr = 0;
						d_regw = 0;
						d_s2=0;
						d_s3=0;
						d_s4=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
			6'b111111:	// bgezal
					begin
						d_s1 = 0;
						d_s7 =0;
						d_memwr = 0;
						d_regw = 0;
						d_s2=0;
						d_s3=0;
						d_s4=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
			6'b111110:	// bltzal
					begin
						d_s1 = 0;
						d_s7 =0;
						d_memwr = 0;
						d_regw = 0;
						d_s2=0;
						d_s3=0;
						d_s4=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
					end
			6'b001100:	// BGEZ
				begin
					d_s1 = 0;
					d_s7 = 0;
					d_memwr = 0;
					d_regw = 0;
					d_s2=0;
				    d_s3=0;
					d_s4=0;
					d_s8=0;
					d_s9=0;
					d_s10=0;
				end
			6'b111100:	// BGEZ
				begin
					d_s1 = 0;
					d_s7 = 0;
					d_memwr = 0;
					d_regw = 0;
					d_s2=0;
					d_s3=0;
					d_s4=0;
					d_s8=0;
					d_s9=0;
					d_s10=0;
				end
			6'b001101:	// BGTZ
				begin
					d_s1 = 0;
					d_s7 = 0;
					d_memwr = 0;
					d_regw = 0;
					d_s2=0;
						d_s3=0;
						d_s4=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
				end
			6'b001110:	// BLEZ
				begin
					d_s1 = 0;
					d_s7 =0;
					d_memwr = 0;
					d_regw = 0;
					d_s2=0;
						d_s3=0;
						d_s4=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
				end
			6'b010000:	// BLTZ
				begin
					d_s1 = 0;
					d_s7 = 0;
					d_memwr = 0;
					d_regw = 0;
					d_s2=0;
						d_s3=0;
						d_s4=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
				end
			6'b010001:	// BNE
				begin
					d_s1 = 0;
					d_s7 =0;
					d_memwr = 0;
					d_regw = 0;
					d_s2=0;
						d_s3=0;
						d_s4=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
				end			
			6'b100011: //LW
					begin
						d_s4= 0;
						d_s1=1;
						d_s2=1;
						d_regw=1;
						d_memwr=0;
						d_s3=0;
						d_alu_func=4'b0000;
						d_s8=0;
						d_s7=0;
						d_s9=0;
						d_s10=0;
					end
			6'b101011: //SW
					begin
						d_s1=1;
						d_regw=0;
						d_memwr=1;
						d_s3=0;
						d_alu_func=4'b0000;
						d_s2=0;
						d_s4=0;
						d_s8=0;
						d_s9=0;
						d_s7=0;
						d_s10=0;
					end
			6'b000011: //LOAD_IMM	
				begin
				d_alu_func = 4'b1010;
				d_s1 = 1;
				d_s2 = 0;
				d_s3 = 0;
				d_s4 = 1;
				d_memwr = 0;
				d_regw = 1;
				d_s8=0;
				d_s9=0;
				d_s10=0;
				d_s7=0;
				end
			6'b000010: //jump
				begin
					d_s1 = 0;
					d_s3 = 1;
					d_memwr = 0;
					d_regw = 0;
					d_s2=0;
					d_s7=0;
					d_s4=0;
					d_s8=0;
					d_s9=0;
					d_s10=0;
				end
			6'b000010: // jal
				begin
					d_s1 = 0;
					d_s3 = 1;
					d_memwr = 0;
					d_regw = 0;
					d_s2=0;
					d_s7=0;
					d_s4=0;
					d_s8=0;
					d_s9=0;
					d_s10=0;
				end
			6'b011111: //JR
				begin
				d_s1 = 0;
				d_s9=1;
				d_s3 = 1;
				d_memwr = 0;
				d_regw = 0;
				d_s2=0;
						d_s4=0;
						d_s8=0;
						d_s7=0;
						d_s10=0;
				end
			6'b000101:  // ADD_IM
				begin
				d_alu_func = 4'b0100;
				d_s1 = 1;
				d_s2 = 0;
				d_s3 = 0;
				d_s4 = 0;
				d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
				d_memwr = 0;
				d_regw = 1;
				end
			6'b000001:  // ADD_IMMEDIATE_UNSIGNED
				begin
				d_alu_func = 4'b0100;
				d_s1 = 1;
				d_s2 = 0;
				d_s3 = 0;
				d_s4 = 0;
				d_memwr = 0;
				d_regw = 1;
				d_s8=1;
						d_s7=0;
						d_s9=0;
						d_s10=0;
				end
			6'b000111: 	// AND_IMMEDIATE
				begin
				d_alu_func = 4'b0010;
				d_s1 = 1;
				d_s2 = 0;
				d_s3 = 0;
				d_s4 = 0;
				d_memwr = 0;
				d_regw = 1;
				d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
				end
			6'b000110:  // OR_IM
			 begin
			 	d_alu_func = 4'b0011;
			 	d_s1 = 1;
			 	d_s2 = 0;
			 	d_s3 = 0;
			 	d_s4 = 0;
			 	d_memwr = 0;
			 	d_regw = 1;
				d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
			 end
			6'b001000: 	// SHIFT_LEFT_LOGICAL
				begin
					d_alu_func = 4'b0111;
					d_s1 = 1;
					d_s2 = 0;
					d_s3 = 0;
					d_s4 = 1;
					d_memwr = 0;
					d_regw = 1;
					d_s7=0;
					d_s8=0;
					d_s9=0;
					d_s10=0;
				end
			6'b001001: 	// RIGHT_LEFT_LOGICAL
				begin
				d_alu_func = 4'b1000;
				d_s1 = 1;
				d_s2 = 0;
				d_s3 = 0;
				d_s4 = 1;
				d_memwr = 0;
				d_regw = 1;
				d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
				end
			6'b001010: //LOAD_UPPER_IMM
				begin
				d_alu_func = 4'b1001;
				d_s1 = 1;
				d_s2 = 0;
				d_s3 = 0;
				d_s4 = 1;
				d_memwr = 0;
				d_regw = 1;
				d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
				end
			6'b001111: //XOR_IMM
				begin
				d_alu_func = 4'b1101;
				d_s1 = 1;
				d_s2 = 0;
				d_s3 = 0;
				d_s4 = 1;
				d_memwr = 0;
				d_regw = 1;
				d_s7=0;
						d_s8=0;
						d_s9=0;
						d_s10=0;
				end
			
				endcase	
	end

	// Register bank
	assign d_regA = rb[d_rs];
	assign d_regB = rb[d_rt];
	always @(posedge clk)
	begin
		// if (w_regw) begin
			// assign d_rd= d_s4? d_ir[15:11] : d_ir[20:16]; 
			// assign d_rd1 =d_ir[15:11];
			// assign d_rd2 =d_ir[20:16];
		// 	rb[w_rd] = WB;
		// end
		// rb[0] = 32'h0000000B;
		rb[1] = 32'h0000000A;
		rb[2] = 32'h00000002;
		rb[3] = 32'h00000003;
		rb[4] = 32'h00000002;
		rb[5] = 32'b1000000000000000000000000000001;
		rb[6] = 32'h00000002;
		rb[7] = 32'h00000013;
		rb[8] = 32'h00000045;
		rb[9] = 32'h0000001B;

	end

	//*****************
	// Execute 
	//*****************
	assign x_imm32 =d_s8?({16'b0,x_imm16[15:0]}): x_imm16[15] ? {16'b1,x_imm16[15:0]}:{16'b0,x_imm16[15:0]};
	assign aluA =  x_s5==1?(m_s10?m_aluZ_signed: m_aluZ): (x_s5==2? (w_s10?w_aluZ_signed:w_aluZ):(x_s5==3?WB:x_regA));
	assign aluB =  x_s6==1? (m_s10?m_aluZ_signed: m_aluZ) :(x_s6==2? (w_s10?w_aluZ_signed:w_aluZ):(x_s1 ? x_s12?x_sham:x_imm32 : x_regB));
	assign aluA_signed =  x_s5==1 ?(m_s10?m_aluZ_signed: m_aluZ): (x_s5==2? (w_s10?w_aluZ_signed:w_aluZ):(x_s5==3?WB:x_regA));
	assign aluB_signed =  x_s6==1? (m_s10?m_aluZ_signed: m_aluZ) :(x_s6==2? (w_s10?w_aluZ_signed:w_aluZ):(x_s1 ?x_s12?x_sham: x_imm32 : x_regB));
	 

	always @(*)
	begin
		
		x_rd= x_s4? x_rd1 : x_rd2;
		case (x_alu_func)
			4'b0000:		begin x_aluZ_signed = aluA_signed+aluB_signed; 				end
			4'b0001:		begin x_aluZ_signed = aluA_signed-aluB_signed;				end
			4'b0010:		begin x_aluZ = aluA & aluB;				end
			4'b0011:		begin x_aluZ = aluA | aluB;				end
			4'b1100:		begin x_aluZ = ~(aluA | aluB);			end
			4'b1101:		begin x_aluZ = (aluA ^ aluB);			end
			4'b0100:		begin x_aluZ = aluA+aluB; 				end
			4'b0101:		begin x_aluZ = aluA-aluB; 				end
			4'b1011:		begin x_aluZ_signed=aluA_signed/aluB_signed;				end
			4'b0110:		begin x_aluZ = aluA*aluB;				end
			4'b0111:		begin x_aluZ = aluA<<aluB;				end
			4'b1000:		begin x_aluZ = aluA>>aluB;				end
			4'b1001:        begin x_aluZ=aluB*(6'd65536);			end
			4'b1010:		begin x_aluZ=aluB;						end
			4'b1110:		begin x_aluZ=aluB>aluA?1:0;				end
			5'b1111:		begin x_aluZ=aluA/aluB;					end
			default:		begin x_aluZ = 32'b0;					end

		endcase
		if (aluA == aluB & x_op==6'b000100)begin 
			x_aluZero = 1;
			x_s7=1;
			f_pc=f_pc+x_imm32-1;
		end
		if (aluA>=0 & x_op==6'b111111) begin
			x_aluZero=1;
			x_s7=1;
			f_pc=f_pc+x_imm32-1;
			save=x_pc;
		end
		if (aluA>=aluB & x_op==6'b111100) begin
			x_aluZero=1;
			x_s7=1;
			f_pc=f_pc+x_imm32-1;
			save=x_pc;
		end
		if (aluA<0 & x_op==6'b111110) begin
			x_aluZero=1;
			x_s7=1;
			f_pc=f_pc+x_imm32-1;
			save=x_pc;
		end
		if (aluA>=0 & x_op==6'b001100)begin 
			x_aluZero = 1;
			x_s7=1;
			f_pc=f_pc+x_imm32-1;
		end
		if(aluA>0 & x_op==6'b001101)begin 
			x_aluZero = 1;
			x_s7=1;
			f_pc=f_pc+x_imm32-1;
		end
		if(aluA<=0 & x_op==6'b001110)begin 
			x_aluZero = 1;
			x_s7=1;
			f_pc=f_pc+x_imm32-1;
		end
		
		if(aluA<0 & x_op==6'b010000)begin 
			x_aluZero = 1;
			x_s7=1;
			f_pc=f_pc+x_imm32-1;
		end
		if(aluA!=aluB & x_op==6'b010001)begin 
			x_aluZero = 1;
			x_s7=1;
			f_pc=f_pc+x_imm32-1;
		end
		if(x_op==6'b000010 | op==6'b011111)begin 
			f_pc=f_pc+x_imm32-1;
		end
		

		else
			x_aluZero = 0;
		x_regA=aluA;
		x_regB=aluB;
		//x_s3=x_aluZero;
	end

	// Memory
	assign WB = d_s2 ? w_ddout :w_s10?w_aluZ_signed: w_aluZ;
	 always @(*) begin
		daddr=m_aluZ[5:0];
		ddin=m_regB;
		dwr=m_memwr;
	// Write back
	 rb[w_rd]=WB;
	 end
		
	

endmodule 

// assign x = cond ? true_val : false_val

