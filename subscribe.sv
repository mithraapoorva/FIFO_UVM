class fifo_subscriber extends uvm_subscriber#(fifo_seq_item);

  `uvm_component_utils (fifo_subscriber)



  uvm_analysis_imp#(fifo_seq_item, fifo_subscriber) item_got_export1;

  fifo_seq_item tr;


covergroup cg;

  read:coverpoint tr.i_rden;

  write:coverpoint tr.i_wren;

  data: coverpoint tr.i_wrdata;

endgroup




covergroup eg;

  full: coverpoint tr.o_full;

  alm_full: coverpoint tr.o_alm_full;

  alm_empty: coverpoint tr.o_alm_empty;

  empty: coverpoint tr.o_empty;

  dataout : coverpoint tr.o_rddata;

endgroup
  function new(string name="f_subscriber",uvm_component parent);

  super.new(name,parent);

  item_got_export1= new("item_got_export1", this);

  tr=fifo_seq_item::type_id::create("tr");

  cg=new();
  eg= new();
endfunction




  function void write(fifo_seq_item t);

   tr=t;

   cg.sample();

   $display("inputcoverage =%0d ",cg.get_coverage());

   eg.sample();
   $display("output coverage =%0d ",eg.get_coverage());

endfunction

n new(string name="f_subscriber",uvm_component parent);

  super.new(name,parent);

  item_got_export2= new("item_got_export2", this);

  tr=fifo_seq_item::type_id::create("tr");
 cg=new();

endfunction




endclass
          
