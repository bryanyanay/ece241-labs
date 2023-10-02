vlib work

vlog -novopt part2.v

vsim part2

log {/*}
add wave {/*}

force {Function[1:0]} 00
force {A[3:0]} 0000
force {B[3:0]} 0000
run 10ns


force {Function[1:0]} 00
force {A[3:0]} 0001
force {B[3:0]} 0001
run 10ns


force {Function[1:0]} 00
force {A[3:0]} 1111
force {B[3:0]} 1111
run 10ns


force {Function[1:0]} 01
force {A[3:0]} 0001
force {B[3:0]} 0000
run 10ns

force {Function[1:0]} 01
force {A[3:0]} 0001
force {B[3:0]} 0001
run 10ns

force {Function[1:0]} 01
force {A[3:0]} 1111
force {B[3:0]} 1110
run 10ns

force {Function[1:0]} 01
force {A[3:0]} 0000
force {B[3:0]} 0000
run 10ns

force {Function[1:0]} 10
force {A[3:0]} 1111
force {B[3:0]} 1111
run 10ns

force {Function[1:0]} 10
force {A[3:0]} 0001
force {B[3:0]} 0100
run 10ns

force {Function[1:0]} 11
force {A[3:0]} 0001
force {B[3:0]} 0000
run 10ns

force {Function[1:0]} 11
force {A[3:0]} 1010
force {B[3:0]} 0011
run 10ns


