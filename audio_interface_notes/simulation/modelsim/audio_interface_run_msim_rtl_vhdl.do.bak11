transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/audio_interface {U:/audio_interface/toplevel.sv}
vcom -93 -work work {U:/audio_interface/audio_interface.vhd}

vlog -sv -work work +incdir+U:/audio_interface {U:/audio_interface/testbench.sv}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 110000 ns
