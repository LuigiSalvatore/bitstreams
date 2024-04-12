if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vlog -work work clocks.sv
vlog -work work tb_counters.sv

vsim -voptargs=+acc=lprn -t ns work.tb

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1

do wave.do 

run 1000ms