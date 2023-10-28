vlib work

vlog -novopt part1.v

vsim part1

log {/*}
add wave {/*}

force {clock} 0 0ns, 1 {5ns} -r 10ns

force resetn 0
run 10ns
force resetn 1

force w 1
run 40ns
force w 0
run 10ns
force w 1
run 10ns

force w 1
run 30ns

force resetn 0
run 20ns
force resetn 1

run 40ns
