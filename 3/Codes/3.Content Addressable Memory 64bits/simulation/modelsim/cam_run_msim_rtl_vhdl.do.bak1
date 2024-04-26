transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/Content Addressable Memory 64bits/reg_file.vhd}
vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/Content Addressable Memory 64bits/controller.vhd}
vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/Content Addressable Memory 64bits/cam.vhd}

vcom -93 -work work {F:/installed program/Quartus II/quartus/bin/Altera_SRC/Content Addressable Memory 64bits/tb_cam.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_cam

add wave *
view structure
view signals
run -all
