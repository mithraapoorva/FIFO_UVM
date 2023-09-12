interface f_interface(input clk, reset);
  bit i_wren;
  bit i_rden;
  bit [127:0] data_in;
  bit  o_full;
  bit o_empty;
  bit o_alm_full;
  bit o_alm_empty;
bit [127:0]o_rddata;
  
  clocking d_cb @(posedge clk);
    default input #1 output #1;
    output i_wren;
    output i_rden;
    output data_in;
    input o_full;
    input o_empty;
    input  o_alm_full;
    input o_alm_empty;
    input o_rddata;
  endclocking
  
  clocking active_monitor_cb @(posedge clk);
    default input #0 output #0;
    input i_wren;
    input i_rden;
    input i_wrdata;
  endclocking
  
clocking passive_monitor_cb @(posedge clk);
    input o_full;
    input o_empty;
    input o_alm_full;
    input o_alm_empty;
    input o_rddata;
  endclocking
  
modport driver_mp (input clk, reset, clocking driver_cb);
  modport act_monitor_mp (input clk, reset, clocking active_monitor_cb);
  modport act_monitor_mp (input clk, reset, clocking passive_monitor_cb);
    
endinterface
