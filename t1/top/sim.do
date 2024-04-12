if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vlog -work work ../clocks/clocks.sv
vlog -work work ../drivers/dspl_drv_NexysA7.v
vlog -work work ../drivers/edge_detector_no_count.v
vlog -work work  ./top2.sv
vlog -work work  ./tb.sv



vsim -voptargs=+acc=lprn -t ns work.tb

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1

do wave.do 

run 500 us