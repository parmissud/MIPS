onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /mips_core_tb/CORE/aluA
add wave -noupdate -radix decimal /mips_core_tb/CORE/aluA_signed
add wave -noupdate -radix decimal /mips_core_tb/CORE/aluB
add wave -noupdate -radix decimal /mips_core_tb/CORE/aluB_signed
add wave -noupdate /mips_core_tb/CORE/clk
add wave -noupdate -radix binary /mips_core_tb/CORE/d_alu_func
add wave -noupdate /mips_core_tb/CORE/d_imm16
add wave -noupdate -radix binary /mips_core_tb/CORE/d_ir
add wave -noupdate /mips_core_tb/CORE/d_memwr
add wave -noupdate /mips_core_tb/CORE/d_op
add wave -noupdate /mips_core_tb/CORE/d_pc
add wave -noupdate /mips_core_tb/CORE/d_rd1
add wave -noupdate /mips_core_tb/CORE/d_rd2
add wave -noupdate -radix decimal /mips_core_tb/CORE/d_regA
add wave -noupdate -radix decimal /mips_core_tb/CORE/d_regB
add wave -noupdate /mips_core_tb/CORE/d_regw
add wave -noupdate /mips_core_tb/CORE/d_rs
add wave -noupdate /mips_core_tb/CORE/d_rt
add wave -noupdate /mips_core_tb/CORE/d_s1
add wave -noupdate /mips_core_tb/CORE/d_s2
add wave -noupdate /mips_core_tb/CORE/d_s3
add wave -noupdate /mips_core_tb/CORE/d_s4
add wave -noupdate /mips_core_tb/CORE/d_s5
add wave -noupdate /mips_core_tb/CORE/d_s6
add wave -noupdate /mips_core_tb/CORE/d_s7
add wave -noupdate /mips_core_tb/CORE/d_s8
add wave -noupdate /mips_core_tb/CORE/d_s9
add wave -noupdate /mips_core_tb/CORE/d_s10
add wave -noupdate /mips_core_tb/CORE/daddr
add wave -noupdate /mips_core_tb/CORE/ddin
add wave -noupdate /mips_core_tb/CORE/ddout
add wave -noupdate /mips_core_tb/CORE/dwr
add wave -noupdate -radix binary /mips_core_tb/CORE/f_ir
add wave -noupdate /mips_core_tb/CORE/f_pc
add wave -noupdate -radix binary /mips_core_tb/CORE/func
add wave -noupdate /mips_core_tb/CORE/iaddr
add wave -noupdate /mips_core_tb/CORE/idata
add wave -noupdate /mips_core_tb/CORE/m_aluZ
add wave -noupdate /mips_core_tb/CORE/m_aluZ_signed
add wave -noupdate /mips_core_tb/CORE/m_aluZero
add wave -noupdate /mips_core_tb/CORE/m_ddout
add wave -noupdate /mips_core_tb/CORE/m_memwr
add wave -noupdate /mips_core_tb/CORE/m_rd
add wave -noupdate /mips_core_tb/CORE/m_regB
add wave -noupdate /mips_core_tb/CORE/m_rt
add wave -noupdate /mips_core_tb/CORE/m_s3
add wave -noupdate /mips_core_tb/CORE/m_s4
add wave -noupdate /mips_core_tb/CORE/m_s5
add wave -noupdate /mips_core_tb/CORE/m_s6
add wave -noupdate /mips_core_tb/CORE/m_s7
add wave -noupdate /mips_core_tb/CORE/m_s10
add wave -noupdate -radix decimal /mips_core_tb/CORE/npc
add wave -noupdate /mips_core_tb/CORE/op
add wave -noupdate -radix decimal -childformat {{{/mips_core_tb/CORE/rb[0]} -radix decimal} {{/mips_core_tb/CORE/rb[1]} -radix decimal} {{/mips_core_tb/CORE/rb[2]} -radix decimal} {{/mips_core_tb/CORE/rb[3]} -radix decimal} {{/mips_core_tb/CORE/rb[4]} -radix decimal} {{/mips_core_tb/CORE/rb[5]} -radix decimal} {{/mips_core_tb/CORE/rb[6]} -radix decimal} {{/mips_core_tb/CORE/rb[7]} -radix decimal} {{/mips_core_tb/CORE/rb[8]} -radix decimal} {{/mips_core_tb/CORE/rb[9]} -radix decimal} {{/mips_core_tb/CORE/rb[10]} -radix decimal} {{/mips_core_tb/CORE/rb[11]} -radix decimal} {{/mips_core_tb/CORE/rb[12]} -radix decimal} {{/mips_core_tb/CORE/rb[13]} -radix decimal} {{/mips_core_tb/CORE/rb[14]} -radix decimal} {{/mips_core_tb/CORE/rb[15]} -radix decimal} {{/mips_core_tb/CORE/rb[16]} -radix decimal} {{/mips_core_tb/CORE/rb[17]} -radix decimal} {{/mips_core_tb/CORE/rb[18]} -radix decimal} {{/mips_core_tb/CORE/rb[19]} -radix decimal} {{/mips_core_tb/CORE/rb[20]} -radix decimal} {{/mips_core_tb/CORE/rb[21]} -radix decimal} {{/mips_core_tb/CORE/rb[22]} -radix decimal} {{/mips_core_tb/CORE/rb[23]} -radix decimal} {{/mips_core_tb/CORE/rb[24]} -radix decimal} {{/mips_core_tb/CORE/rb[25]} -radix decimal} {{/mips_core_tb/CORE/rb[26]} -radix decimal} {{/mips_core_tb/CORE/rb[27]} -radix decimal} {{/mips_core_tb/CORE/rb[28]} -radix decimal} {{/mips_core_tb/CORE/rb[29]} -radix decimal} {{/mips_core_tb/CORE/rb[30]} -radix decimal} {{/mips_core_tb/CORE/rb[31]} -radix decimal}} -subitemconfig {{/mips_core_tb/CORE/rb[0]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[1]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[2]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[3]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[4]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[5]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[6]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[7]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[8]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[9]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[10]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[11]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[12]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[13]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[14]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[15]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[16]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[17]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[18]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[19]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[20]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[21]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[22]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[23]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[24]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[25]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[26]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[27]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[28]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[29]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[30]} {-height 15 -radix decimal} {/mips_core_tb/CORE/rb[31]} {-height 15 -radix decimal}} /mips_core_tb/CORE/rb
add wave -noupdate /mips_core_tb/CORE/rs
add wave -noupdate /mips_core_tb/CORE/rst
add wave -noupdate /mips_core_tb/CORE/rt
add wave -noupdate /mips_core_tb/CORE/sham
add wave -noupdate /mips_core_tb/CORE/sub
add wave -noupdate /mips_core_tb/CORE/sum
add wave -noupdate /mips_core_tb/CORE/w_aluZ
add wave -noupdate /mips_core_tb/CORE/w_aluZ_signed
add wave -noupdate /mips_core_tb/CORE/w_ddout
add wave -noupdate /mips_core_tb/CORE/w_rd
add wave -noupdate /mips_core_tb/CORE/w_regw
add wave -noupdate /mips_core_tb/CORE/w_s3
add wave -noupdate /mips_core_tb/CORE/w_s7
add wave -noupdate /mips_core_tb/CORE/w_s10
add wave -noupdate /mips_core_tb/CORE/WB
add wave -noupdate -radix binary /mips_core_tb/CORE/x_alu_func
add wave -noupdate -radix decimal /mips_core_tb/CORE/x_aluZ
add wave -noupdate /mips_core_tb/CORE/x_aluZ_signed
add wave -noupdate /mips_core_tb/CORE/x_aluZero
add wave -noupdate /mips_core_tb/CORE/x_imm16
add wave -noupdate /mips_core_tb/CORE/x_imm32
add wave -noupdate /mips_core_tb/CORE/x_memwr
add wave -noupdate -radix binary /mips_core_tb/CORE/x_op
add wave -noupdate /mips_core_tb/CORE/x_rd
add wave -noupdate /mips_core_tb/CORE/x_rd1
add wave -noupdate /mips_core_tb/CORE/x_rd2
add wave -noupdate /mips_core_tb/CORE/x_regA
add wave -noupdate /mips_core_tb/CORE/x_regB
add wave -noupdate /mips_core_tb/CORE/x_regw
add wave -noupdate /mips_core_tb/CORE/x_rs
add wave -noupdate /mips_core_tb/CORE/x_rt
add wave -noupdate /mips_core_tb/CORE/x_s1
add wave -noupdate /mips_core_tb/CORE/x_s2
add wave -noupdate /mips_core_tb/CORE/x_s3
add wave -noupdate /mips_core_tb/CORE/x_s4
add wave -noupdate /mips_core_tb/CORE/x_s5
add wave -noupdate /mips_core_tb/CORE/x_s6
add wave -noupdate /mips_core_tb/CORE/x_s7
add wave -noupdate /mips_core_tb/CORE/x_s8
add wave -noupdate /mips_core_tb/CORE/x_s10
add wave -noupdate /mips_core_tb/CORE/aluA
add wave -noupdate /mips_core_tb/CORE/aluA_signed
add wave -noupdate /mips_core_tb/CORE/aluB
add wave -noupdate /mips_core_tb/CORE/aluB_signed
add wave -noupdate /mips_core_tb/CORE/clk
add wave -noupdate /mips_core_tb/CORE/d_alu_func
add wave -noupdate /mips_core_tb/CORE/d_imm16
add wave -noupdate -radix binary /mips_core_tb/CORE/d_ir
add wave -noupdate /mips_core_tb/CORE/d_memwr
add wave -noupdate /mips_core_tb/CORE/d_op
add wave -noupdate /mips_core_tb/CORE/d_pc
add wave -noupdate /mips_core_tb/CORE/d_rd1
add wave -noupdate /mips_core_tb/CORE/d_rd2
add wave -noupdate /mips_core_tb/CORE/d_regA
add wave -noupdate /mips_core_tb/CORE/d_regB
add wave -noupdate /mips_core_tb/CORE/d_regw
add wave -noupdate /mips_core_tb/CORE/d_rs
add wave -noupdate /mips_core_tb/CORE/d_rt
add wave -noupdate /mips_core_tb/CORE/d_s1
add wave -noupdate /mips_core_tb/CORE/d_s2
add wave -noupdate /mips_core_tb/CORE/d_s3
add wave -noupdate /mips_core_tb/CORE/d_s4
add wave -noupdate /mips_core_tb/CORE/d_s5
add wave -noupdate /mips_core_tb/CORE/d_s6
add wave -noupdate /mips_core_tb/CORE/d_s7
add wave -noupdate /mips_core_tb/CORE/d_s8
add wave -noupdate /mips_core_tb/CORE/d_s9
add wave -noupdate /mips_core_tb/CORE/d_s10
add wave -noupdate /mips_core_tb/CORE/d_s12
add wave -noupdate /mips_core_tb/CORE/d_sham
add wave -noupdate /mips_core_tb/CORE/daddr
add wave -noupdate /mips_core_tb/CORE/ddin
add wave -noupdate /mips_core_tb/CORE/ddout
add wave -noupdate /mips_core_tb/CORE/dwr
add wave -noupdate -radix binary /mips_core_tb/CORE/f_ir
add wave -noupdate /mips_core_tb/CORE/f_pc
add wave -noupdate /mips_core_tb/CORE/func
add wave -noupdate /mips_core_tb/CORE/iaddr
add wave -noupdate /mips_core_tb/CORE/idata
add wave -noupdate /mips_core_tb/CORE/m_aluZ
add wave -noupdate /mips_core_tb/CORE/m_aluZ_signed
add wave -noupdate /mips_core_tb/CORE/m_aluZero
add wave -noupdate /mips_core_tb/CORE/m_ddout
add wave -noupdate /mips_core_tb/CORE/m_memwr
add wave -noupdate /mips_core_tb/CORE/m_rd
add wave -noupdate /mips_core_tb/CORE/m_regB
add wave -noupdate /mips_core_tb/CORE/m_rt
add wave -noupdate /mips_core_tb/CORE/m_s3
add wave -noupdate /mips_core_tb/CORE/m_s4
add wave -noupdate /mips_core_tb/CORE/m_s5
add wave -noupdate /mips_core_tb/CORE/m_s6
add wave -noupdate /mips_core_tb/CORE/m_s7
add wave -noupdate /mips_core_tb/CORE/m_s10
add wave -noupdate -radix decimal /mips_core_tb/CORE/npc
add wave -noupdate /mips_core_tb/CORE/op
add wave -noupdate /mips_core_tb/CORE/rb
add wave -noupdate /mips_core_tb/CORE/rs
add wave -noupdate /mips_core_tb/CORE/rst
add wave -noupdate /mips_core_tb/CORE/rt
add wave -noupdate /mips_core_tb/CORE/s11
add wave -noupdate /mips_core_tb/CORE/sham
add wave -noupdate /mips_core_tb/CORE/sub
add wave -noupdate /mips_core_tb/CORE/sum
add wave -noupdate /mips_core_tb/CORE/w_aluZ
add wave -noupdate /mips_core_tb/CORE/w_aluZ_signed
add wave -noupdate /mips_core_tb/CORE/w_ddout
add wave -noupdate /mips_core_tb/CORE/w_rd
add wave -noupdate /mips_core_tb/CORE/w_regw
add wave -noupdate /mips_core_tb/CORE/w_s3
add wave -noupdate /mips_core_tb/CORE/w_s7
add wave -noupdate /mips_core_tb/CORE/w_s10
add wave -noupdate /mips_core_tb/CORE/WB
add wave -noupdate /mips_core_tb/CORE/x_alu_func
add wave -noupdate /mips_core_tb/CORE/x_aluZ
add wave -noupdate /mips_core_tb/CORE/x_aluZ_signed
add wave -noupdate /mips_core_tb/CORE/x_aluZero
add wave -noupdate /mips_core_tb/CORE/x_imm16
add wave -noupdate /mips_core_tb/CORE/x_imm32
add wave -noupdate /mips_core_tb/CORE/x_memwr
add wave -noupdate /mips_core_tb/CORE/x_op
add wave -noupdate /mips_core_tb/CORE/x_rd
add wave -noupdate /mips_core_tb/CORE/x_rd1
add wave -noupdate /mips_core_tb/CORE/x_rd2
add wave -noupdate /mips_core_tb/CORE/x_regA
add wave -noupdate /mips_core_tb/CORE/x_regB
add wave -noupdate /mips_core_tb/CORE/x_regw
add wave -noupdate /mips_core_tb/CORE/x_rs
add wave -noupdate /mips_core_tb/CORE/x_rt
add wave -noupdate /mips_core_tb/CORE/x_s1
add wave -noupdate /mips_core_tb/CORE/x_s2
add wave -noupdate /mips_core_tb/CORE/x_s3
add wave -noupdate /mips_core_tb/CORE/x_s4
add wave -noupdate /mips_core_tb/CORE/x_s5
add wave -noupdate /mips_core_tb/CORE/x_s6
add wave -noupdate /mips_core_tb/CORE/x_s7
add wave -noupdate /mips_core_tb/CORE/x_s8
add wave -noupdate /mips_core_tb/CORE/x_s10
add wave -noupdate /mips_core_tb/CORE/x_s12
add wave -noupdate /mips_core_tb/CORE/x_sham
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {45230 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 210
configure wave -valuecolwidth 225
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {24770 ps} {48090 ps}
