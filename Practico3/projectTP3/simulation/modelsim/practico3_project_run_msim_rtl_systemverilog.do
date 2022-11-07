transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/new {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/new/comp_n.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/new {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/new/exception.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/new {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/new/mux4.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/execute.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/esync.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/decode.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/datapath.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/controller.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/aludec.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/alu.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/adder.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/writeback.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/sl2.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/signext.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/regfile.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/processor_arm.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/mux2.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/memory.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/maindec.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/imem.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/flopr.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/fetch.sv}
vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/new {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/new/flopr_e.sv}
vcom -2008 -work work {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/modulesTP3/dmem.vhd}

vlog -sv -work work +incdir+/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/projectTP3/../modulesTP3 {/home/basbenja/Documents/3.2/ARQUITECTURA/Arquitectura-de-Computadoras-2022/Practico3/projectTP3/../modulesTP3/processor_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all
