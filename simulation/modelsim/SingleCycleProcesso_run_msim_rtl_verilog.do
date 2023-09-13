transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/SingleCycleProcessor.v}
vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/Mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/pc.v}
vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/pcadder.v}
vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/regfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/alucontrol.v}
vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/control_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/maindecoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/aludecoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/datamem.v}
vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/signextend.v}
vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/instrmem.v}

vlog -vlog01compat -work work +incdir+C:/Users/hp/Desktop/SingleCycle {C:/Users/hp/Desktop/SingleCycle/SingleCycleProcessor_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  SingleCycleProcessor_tb

add wave *
view structure
view signals
run -all
