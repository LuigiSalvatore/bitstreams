vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/ip/ila_elapsed/hdl/verilog" \
"../../../../project_1.gen/sources_1/ip/ila_elapsed/sim/ila_elapsed.v" \


vlog -work xil_defaultlib \
"glbl.v"

