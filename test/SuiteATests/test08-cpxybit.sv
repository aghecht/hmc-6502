// test08-cpxybit.sv
// basic regression test
// tbarr at cs dot hmc dot edu

`timescale 1 ns / 1 ps

module optest;
  reg ph1, ph2, reset;
  
  wire [7:0] data;
  
  top top(ph1, ph2, reset);
  
  always begin
    ph1 <= 1; #8; ph1 <= 0; #12;
  end
  always begin
    ph2 <= 0; #10; ph2 <= 1; #8; ph2 <= 0; #2;
  end
  
  initial begin
    // for VCD file
    $dumpfile("test/VCD/outSuiteA-test08.vcd");
    $dumpvars;

    // init ROM
    top.mem.ROM[4093] = 8'hf0;
    top.mem.ROM[4092] = 8'h00;
    
    // path relative to this file.
    $readmemh("test/roms/SuiteA/test08-cpxybit.rom", top.mem.ROM);
    
    // start test
    reset = 1;
    #100;
    reset = 0;
    #2000;
    assert (top.mem.RAM[66] == 8'hA5) $display ("PASSED Test 08 - cpx & cpy & bit");
      else $error("FAILED Test 08 - cpx & cpy & bit");
    $dumpflush;
    $stop;
  end
endmodule
