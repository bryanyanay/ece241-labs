vlib work

vlog -novopt part2.v

vsim -G CLOCK_FREQUENCY=4 part2 

log {/*}
add wave {/*}

force {ClockIn} 0 0ms, 1 {125ms} -r 250ms

force Speed 01

force Reset 1
run 500ms
force Reset 0
run 3000ms
 
force Reset 1
run 1000ms
force Reset 0

run 2000ms
