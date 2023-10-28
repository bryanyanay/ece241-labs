vlib work

vlog -novopt part2.v

vsim part2

log {/*}
add wave {/*}

force {Clock} 0 0ns, 1 {5ns} -r 10ns

force Resetn 0
run 10ns
force Resetn 1

force DataIn 10
force Go 1
run 20ns
force Go 0
run 20ns

force DataIn 11
force Go 1
run 10ns
force Go 0
run 10ns

force DataIn 1
force Go 1
run 30ns
force Go 0
run 10ns

force DataIn 1
force Go 1
run 10ns
force Go 0
run 10ns

run 80ns

force DataIn 11
force Go 1
run 20ns
force Go 0
run 20ns

force DataIn 1
force Go 1
run 10ns
force Go 0
run 10ns

force DataIn 10
force Go 1
run 30ns
force Go 0
run 10ns

force DataIn 10
force Go 1
run 10ns
force Go 0
run 10ns

run 80ns

force DataIn 1
force Go 1
run 20ns
force Go 0
run 20ns

force Resetn 0
run 30ns
force Resetn 1
run 20ns

force DataIn 100
force Go 1
run 10ns


