//Protocols says the slave can assert AWREADY or WVALID, or both, are asserted
//When asserted, AWVALID must remain asserted until at the rising clock edge the slave asserts AWREADY

property AXI4_ERRM_AWVALID_STABLE;
    @(posedge aclk) disable iff (!areset_n) 
    $rose(awvalid) |-> 
         strong(awvalid[*1:$] intersect awready[->1); // need the goto
endproperty 

property AXI4_ERRM_AWVALID_STABLE2;
    @(posedge aclk) disable iff (!areset_n) 
          $rose(awvalid) |-> awvalid s_until_with awready;
endproperty 
