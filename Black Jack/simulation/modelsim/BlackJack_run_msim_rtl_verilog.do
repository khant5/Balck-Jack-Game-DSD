transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/Files\ for\ school/Digital\ Systems/Black\ Jack {F:/Files for school/Digital Systems/Black Jack/lfsr.v}

