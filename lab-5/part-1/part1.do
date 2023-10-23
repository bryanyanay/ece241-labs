vlib work

vlog -novopt part1.v

vsim part1

log {/*}
add wave {/*}

force {Clock} 0 0ns, 1 {5ns} -r 10ns

force Reset 1
run 10ns
force Reset 0

force Enable 1
run 40ns

force Enable 0
run 20ns

force Reset 1
run 10ns
force Enable 1
run 10ns

force Reset 0
run 200ns