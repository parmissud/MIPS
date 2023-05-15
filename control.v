module control( input[5:0] opcode,  
                           input reset,  
                           output reg[1:0] ALUOp,  
                           output reg RegDst,MemToReg,Branch,MemRead,MemWrite,ALUSrc,RegWrite,zero                     
   );  
 always @(*)  
 begin  
      if(reset == 1'b1) begin  
                RegDst = 1'b0;  
                MemToReg = 1'b0;  
                ALUOp = 2'b00;  
                Branch = 1'b0;  
                MemRead = 1'b0;  
                MemWrite = 1'b0;  
                ALUSrc = 1'b0;  
                RegWrite = 1'b0;  
                zero = 1'b0;  
      end  
      else begin  
      case(opcode)   
      6'b000000: begin // add  
                RegDst = 1'b1;  
                MemToReg = 1'b0;  
                ALUOp = 2'b10;    
                Branch = 1'b0;  
                MemRead = 1'b0;  
                MemWrite = 1'b0;  
                ALUSrc = 1'b0;  
                RegWrite = 1'b1;  
                zero = 1'b0;  
                end  
     
     
      6'b100011: begin // lw  
                RegDst = 1'b0;  
                MemToReg = 1'b1;  
                ALUOp = 2'b00;    
                Branch = 1'b0;  
                MemRead = 1'b1;  
                MemWrite = 1'b0;  
                ALUSrc = 1'b1;  
                RegWrite = 1'b1;  
                zero = 1'b0;  
                end  
 
      6'b000100: begin // beq  
                ALUOp = 2'b01;    
                Branch = 1'b1;  
                MemRead = 1'b0;  
                MemWrite = 1'b0;  
                ALUSrc = 1'b0;  
                RegWrite = 1'b0;  
                zero = 1'b0;  
                end  
  
     //  default: begin  
     //            RegDst = 2'b01;  
     //            MemToReg = 2'b00;  
     //            ALUOp = 2'b00;    
     //            Branch = 1'b0;  
     //            MemRead = 1'b0;  
     //            MemWrite = 1'b0;  
     //            ALUSrc = 1'b0;  
     //            RegWrite = 1'b1;  
     //            zero = 1'b1;  
     //            end  
      endcase  
      end  
 end  
 endmodule  