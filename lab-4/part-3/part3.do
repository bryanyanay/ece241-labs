vlib work

vlog -novopt part3.v

vsim part3

log {/*}
add wave {/*}

force {clock} 0 0ns, 1 {5ns} -r 10ns

force reset 1
run 10ns

force reset 0

force RotateRight 0
force ParallelLoadn 0
force Data_IN 0010
run 10ns
force Data_IN 0011
run 10ns

force ParallelLoadn 1
run 20ns 

force RotateRight 1
force ASRight 1
run 10ns

force ASRight 0
run 20ns
