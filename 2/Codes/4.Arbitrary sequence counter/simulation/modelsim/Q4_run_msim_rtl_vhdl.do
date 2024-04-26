transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/HW2Q4/Q4.vhd}

vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/HW2Q4/tb_Q4.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_Q4

add wave *
view structure
view signals
run -all
