transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/BCD Counter/BCD.vhd}

vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/BCD Counter/tb_BCD.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_BCD

add wave *
view structure
view signals
run -all
