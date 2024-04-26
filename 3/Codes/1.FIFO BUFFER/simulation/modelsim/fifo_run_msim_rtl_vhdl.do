transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/FIFO BUFFER/fifo.vhd}
vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/FIFO BUFFER/reg_file.vhd}
vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/FIFO BUFFER/controller.vhd}
vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/FIFO BUFFER/andgate.vhd}

vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/FIFO BUFFER/tb_fifo.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_fifo

add wave *
view structure
view signals
run -all
