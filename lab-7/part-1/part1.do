vlib work

vlog -novopt part1.v

vsim -L altera_mf_ver part1

log {/*}
add wave {/*}

force {clock} 0 0ns, 1 {5ns} -r 10ns

force address 00000
force data 01010
force wren 0
run 10ns

force data 11111
force wren 1
run 10ns

force wren 0
run 10ns

force address 11111
force data 11100
force wren 1
run 10ns

force data 00011
force wren 0
run 10ns



