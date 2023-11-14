vlib work

vlog -novopt part2.v

vsim control

log {/*}
add wave {/*}

force {iClock} 0 0ns, 1 {5ns} -r 10ns

force iResetn 0
run 10ns
force iResetn 1

force iBlack 1
run 20ns
force iBlack 0
force fs_x 'd10
force fs_y 'd11
run 30ns

force fs_x 'd159
force fs_y 'd119
run 30ns



