vlib work

vlog -novopt part1.v

vsim part1

log {/*}
add wave {/*}

force {a[3:0]} 0010
force {b[3:0]} 0100
force {c_in} 1
run 10ns

force {a[3:0]} 0000
force {b[3:0]} 0000
force {c_in} 1
run 10ns

force {a[3:0]} 0001
force {b[3:0]} 0001
force {c_in} 0
run 10ns

force {a[3:0]} 1111
force {b[3:0]} 1111
force {c_in} 1
run 10ns

force {a[3:0]} 1111
force {b[3:0]} 1111
force {c_in} 0
run 10ns