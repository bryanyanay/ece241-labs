vlib work

vlog -novopt part1.v

vsim part1

log {/*}
add wave {/*}

force {Clock} 0 0ns, 1 {5ns} -r 10ns

force Reset 1
run 10ns
force Reset 0

force w 1
run 40ns
force w 0
run 10ns
force w 1
run 10ns

force w 1
run 30ns

force Reset 1
run 20ns
force Reset 0

run 40ns
