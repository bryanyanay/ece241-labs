vlib work

vlog -novopt part3.v

vsim -G CLOCK_FREQUENCY=500 part3

log {/*}
add wave {/*}

force {ClockIn} 0 0ms, 1 {1ms} -r 2ms

force Letter 000

force Reset 1
run 2ms
force Reset 0
run 2ms

force Start 1
run 2ms
force Start 0

run 10000ms