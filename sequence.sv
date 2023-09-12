class f_sequence extends uvm_sequence#(f_sequence_item);
  `uvm_object_utils(f_sequence)
  
  function new(string name = "f_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_info(get_type_name(), $sformatf("******** Generate 1024 Write REQs ********"), UVM_LOW)
    repeat(1024) begin
      req = f_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {{i_wren == 1;});
      finish_item(req);
    end
    `uvm_info(get_type_name(), $sformatf("******** Generate 1024 Read REQs ********"), UVM_LOW)
     repeat(1024) begin
      req = f_sequence_item::type_id::create("req");
      start_item(req);
       assert(req.randomize() with { i_rden == 1;});
      finish_item(req);
    end
    `uvm_info(get_type_name(), $sformatf("******** Generate 20 Random REQs ********"), UVM_LOW)
                                   repeat(20) begin
      req = f_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
      finish_item(req);
    end
      `uvm_info(get_type_name(), $sformatf("******** Generate simaltaneous 20   write and read ********"), UVM_LOW)
      repeat(20) begin
      req = f_sequence_item::type_id::create("req");
      start_item(req);
        assert(req.randomize()with {i_rden=1;i_wren=1;});
      finish_item(req);
    end
      `uvm_info(get_type_name(), $sformatf("******** Generate Alternative 20   write and read ********"), UVM_LOW)
      repeat(20) begin
      req = f_sequence_item::type_id::create("req");
      start_item(req);
        assert(req.randomize()with {i_rden=0;i_wren=1;});
      finish_item(req);
         req = f_sequence_item::type_id::create("req");
      start_item(req);
        assert(req.randomize()with {i_rden=1;i_wren=0;});
      finish_item(req);
    end
     `uvm_info(get_type_name(), $sformatf("******** Generate 20 no read and write at same time ******"), UVM_LOW)
    repeat(20) begin
      req = f_sequence_item::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {(i_rden=0;,iwren=0;)});
      finish_item(req);
    end                                 
  endtask
  endclass
  
  
