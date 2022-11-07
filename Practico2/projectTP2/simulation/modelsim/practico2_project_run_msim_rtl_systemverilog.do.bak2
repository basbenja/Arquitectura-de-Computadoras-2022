transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/writeback.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/sl2.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/signext.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/regfile.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/processor_arm.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/mux2.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/memory.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/maindec.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/imem.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/flopr.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/fetch.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/execute.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/decode.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/datapath.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/controller.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/aludec.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/alu.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/adder.sv}
vcom -2008 -work work {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/modulesTP2/dmem.vhd}

vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/projectTP2/../modulesTP2 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico2/projectTP2/../modulesTP2/processor_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all
