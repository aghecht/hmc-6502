// datapath.sv
// datapath for hmc-6502 CPU
// 31oct07
// tbarr at cs hmc edu

`timescale 1 ns / 1 ps

module datapath(input logic data_read,
                output logic data_write,
                output logic 