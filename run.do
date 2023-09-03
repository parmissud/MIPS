vlog -reportprogress 300 -work work imem.v 
vlog -reportprogress 300 -work work dmem.v 
vlog -reportprogress 300 -work work mips_core.v 
vlog -reportprogress 300 -work work mips_core_tb.v 
vsim -gui work.mips_core_tb -voptargs=+acc
do wave.do
run 100ns 
