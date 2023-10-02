vlib work

vlog -novopt part1.v

vsim full_adder

log {/*}
add wave {/*}

force {a} 0
force {b} 0
force {c_in} 0
run 10ns

force {a} 1
force {b} 1
force {c_in} 0
run 10ns

force {a} 0
force {b} 0
force {c_in} 1
run 10ns

force {a} 0
force {b} 1
force {c_in} 1
run 10ns

force {a} 1
force {b} 1
force {c_in} 1
run 10ns




