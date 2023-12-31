vlib work

vlog -novopt part2.v

vsim part2

log {/*}
add wave {/*}

force {Clock} 0 0ns, 1 {5ns} -r 10ns

force Reset_b 1
run 10ns

force Reset_b 0

force Function 00
force {Data[3:0]} 0011
run 30ns

force Function 01
force {Data[3:0]} 0010
run 20ns

force Function 10
force {Data[3:0]} 0001
run 20ns

force Function 11
run 20ns
