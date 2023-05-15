module data_memory  
 (  
      input clk,  
      input [4:0] rs,
      input [4:0] rt,  
      input MemWrite,  
      input MemRead,
      output [31:0] readData  
 );  
      integer i;  
      reg [63:0] mem [31:0];    
      initial begin  
           for(i=0;i<64;i=i+1)  
                mem[i] <= 32'd0;  
      end  
      always @(posedge clk) begin  
           if (MemWrite)  
                mem[rs] <= ;  
      end  
      assign mem_read_data = (mem_read==1'b1) ? mem[mem_addr]: 16'd0;   
 endmodule 