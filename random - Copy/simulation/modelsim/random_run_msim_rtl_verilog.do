transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Files\ for\ school/Digital\ Systems/random {E:/Files for school/Digital Systems/random/random.v}
vlog -vlog01compat -work work +incdir+E:/Files\ for\ school/Digital\ Systems/random/output_files {E:/Files for school/Digital Systems/random/output_files/system.v}
vlog -vlog01compat -work work +incdir+E:/Files\ for\ school/Digital\ Systems/random/output_files {E:/Files for school/Digital Systems/random/output_files/Binary2BCD.v}
vlog -vlog01compat -work work +incdir+E:/Files\ for\ school/Digital\ Systems/random/output_files {E:/Files for school/Digital Systems/random/output_files/bcd_to_seven_seg.v}

