module data_memory  
 (  
      input clk,  
      input [31:0] Addr,
      input [31:0] WriteData,  
      input MemWrite,  
      input MemRead,
      output [31:0] ReadData  
 );  
      integer i;  
      reg [63:0] mem [31:0];    
      initial begin  
           for(i=0;i<64;i=i+1)  
                mem[i] <= 32'd0;  
      end  
      always @(posedge clk) begin  
           if (MemWrite)  
                mem[Addr]  <= WriteData ;
               ReadData <= 0
      end  
          else (MemRead) begin
               ReadData <= mem[Addr];
               end
 endmodule 