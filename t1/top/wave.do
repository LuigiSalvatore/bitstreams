onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb/top_inst/BASE_CLOCK
add wave -noupdate -radix unsigned /tb/top_inst/clock
add wave -noupdate -radix unsigned /tb/top_inst/reset
add wave -noupdate -radix unsigned /tb/top_inst/start
add wave -noupdate -radix unsigned /tb/top_inst/stop
add wave -noupdate -radix unsigned /tb/top_inst/split
add wave -noupdate -radix unsigned /tb/top_inst/an
add wave -noupdate -radix unsigned /tb/top_inst/dec_cat
add wave -noupdate -radix unsigned /tb/top_inst/clock_cs
add wave -noupdate -radix unsigned /tb/top_inst/clock_s
add wave -noupdate -radix unsigned /tb/top_inst/clock_m
add wave -noupdate -radix unsigned /tb/top_inst/clock_h
add wave -noupdate -radix unsigned /tb/top_inst/start_int
add wave -noupdate -radix unsigned /tb/top_inst/stop_int
add wave -noupdate -radix unsigned /tb/top_inst/split_int
add wave -noupdate -radix unsigned /tb/top_inst/enable_counting
add wave -noupdate -radix unsigned /tb/top_inst/elapsed_cs
add wave -noupdate -radix unsigned /tb/top_inst/elapsed_s
add wave -noupdate -radix unsigned /tb/top_inst/elapsed_m
add wave -noupdate -radix unsigned /tb/top_inst/elapsed_h
add wave -noupdate -radix unsigned /tb/top_inst/u_cs
add wave -noupdate -radix unsigned /tb/top_inst/d_cs
add wave -noupdate -radix unsigned /tb/top_inst/u_s
add wave -noupdate -radix unsigned /tb/top_inst/d_s
add wave -noupdate -radix unsigned /tb/top_inst/u_m
add wave -noupdate -radix unsigned /tb/top_inst/d_m
add wave -noupdate -radix unsigned /tb/top_inst/u_h
add wave -noupdate -radix unsigned /tb/top_inst/d_h
add wave -noupdate -radix unsigned /tb/top_inst/s_reg_u_cs
add wave -noupdate -radix unsigned /tb/top_inst/s_reg_d_cs
add wave -noupdate -radix unsigned /tb/top_inst/s_reg_u_s
add wave -noupdate -radix unsigned /tb/top_inst/s_reg_d_s
add wave -noupdate -radix unsigned /tb/top_inst/s_reg_u_m
add wave -noupdate -radix unsigned /tb/top_inst/s_reg_d_m
add wave -noupdate -radix unsigned /tb/top_inst/s_reg_u_h
add wave -noupdate -radix unsigned /tb/top_inst/s_reg_d_h
add wave -noupdate -radix unsigned /tb/top_inst/count_split
add wave -noupdate -radix unsigned /tb/top_inst/done_split
add wave -noupdate -radix unsigned /tb/top_inst/EA
add wave -noupdate -radix unsigned /tb/top_inst/PE
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {97186 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {525 us}
