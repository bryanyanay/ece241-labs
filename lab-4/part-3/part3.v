



module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);

endmodule


module sub(left, right, LoadLeft, D, loadn, clock, reset, Q);
  input left, right, LoadLeft, D, loadn, clock, reset;
  output Q;

  always @(posedge clock) 
  begin
    if (loadn) 
    begin
      
    end
    else 
      Q
  end
endmodule