vlib work

vlog -novopt part3.v

vsim -G CLOCK_FREQUENCY=4 part3

log {/*}
add wave {/*}

force {ClockIn} 0 0ms, 1 {125ms} -r 250ms

force Reset 1
run 250ms
force Reset 0

force Start 1
force Letter 000
run 250ms
force Start 0

run 20000ms