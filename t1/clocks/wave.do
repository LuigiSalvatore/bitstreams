onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/dut/BASE_CLOCK
add wave -noupdate /tb/dut/bits_half_sec
add wave -noupdate /tb/dut/bits_half_cs
add wave -noupdate /tb/dut/clk
add wave -noupdate /tb/dut/reset
add wave -noupdate /tb/dut/clock_cs
add wave -noupdate /tb/dut/clock_s
add wave -noupdate /tb/dut/clock_m
add wave -noupdate /tb/dut/clock_h
add wave -noupdate /tb/dut/sec_reg
add wave -noupdate /tb/dut/cs_reg
add wave -noupdate /tb/dut/min_reg
add wave -noupdate /tb/dut/hour_reg
add wave -noupdate /tb/dut/clk_cs
add wave -noupdate /tb/dut/clk_s
add wave -noupdate /tb/dut/clk_m
add wave -noupdate /tb/dut/clk_h
add wave -noupdate /tb/dut/medidor
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1295002615 ns} 0}
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
WaveRestoreZoom {0 ns} {2171243114 ns}
