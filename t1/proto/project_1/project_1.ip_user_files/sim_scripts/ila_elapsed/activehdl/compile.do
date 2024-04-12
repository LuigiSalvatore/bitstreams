transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_1.gen/sources_1/ip/ila_elapsed/hdl/verilog" -l xil_defaultlib \
"../../../../project_1.gen/sources_1/ip/ila_elapsed/sim/ila_elapsed.v" \


vlog -work xil_defaultlib \
"glbl.v"

