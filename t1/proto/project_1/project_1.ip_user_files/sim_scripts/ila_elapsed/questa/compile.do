vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../project_1.gen/sources_1/ip/ila_elapsed/hdl/verilog" \
"../../../../project_1.gen/sources_1/ip/ila_elapsed/sim/ila_elapsed.v" \


vlog -work xil_defaultlib \
"glbl.v"

