vlib work

vlog -novopt part3.v

vsim test_module

log {/*}
add wave {/*}

force {Function[1:0]} 00
force {A[4:0]} 00000
force {B[4:0]} 00000
run 10ns

force {Function[1:0]} 00
force {A[4:0]} 11111
force {B[4:0]} 11111
run 10ns

force {Function[1:0]} 01
force {A[4:0]} 00010
force {B[4:0]} 00000
run 10ns

force {Function[1:0]} 01
force {A[4:0]} 00000
force {B[4:0]} 00000
run 10ns

force {Function[1:0]} 10
force {A[4:0]} 11111
force {B[4:0]} 11111
run 10ns

force {Function[1:0]} 10
force {A[4:0]} 00011
force {B[4:0]} 01001
run 10ns

force {Function[1:0]} 11
force {A[4:0]} 00000
force {B[4:0]} 11111
run 10ns


