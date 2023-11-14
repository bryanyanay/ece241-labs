vlib work

vlog -novopt part2.v

vsim -G X_SCREEN_PIXELS=8 -G Y_SCREEN_PIXELS=5 datapath

log {/*}
add wave {/*}

force {iClock} 0 0ns, 1 {5ns} -r 10ns

force iResetn 0
run 10ns
force iResetn 1



