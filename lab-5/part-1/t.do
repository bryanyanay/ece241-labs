vlib work

vlog -novopt part1.v

vsim t

log {/*}
add wave {/*}

force {Clock} 0 0ns, 1 {5ns} -r 10ns

force Reset 1
run 10ns

force T 1
run 10ns

force Reset 0
run 10ns

force T 0
run 20ns

