`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2018 06:02:42 PM
// Design Name: 
// Module Name: main_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main_tb();
    
    // input 
    reg sys_clk_p, sys_clk_n, reset_in, startup_in;
    reg hi_muxsel;

    
    // output 
    wire ctrl_ready_flg;
    wire dacclk;
    wire clk;
    wire [9:0] ctrl_2_dac;
    reg  comp_edge;
    reg sat_flg;
    wire sw_on;
    wire FF_preset_bar;
    wire FF_clear_bar;
    wire exp_flg_bar;
    
    wire aclk_p,aclk_n,cnv,tp,tl;
    reg dco_p,dco_n,da_p,da_n,db_p,db_n;
    
    reg fclk;
//    wire[9:0] counter;
//    wire[9:0] state;
//    wire cntr_load;
    
    main main_inst0(.sys_clk_p(sys_clk_p),
               .sys_clk_n(sys_clk_n),
               .reset_in(reset_in),
               .startup_in(startup_in),
               .dacclk(dacclk),
               .ctrl_2_dac(ctrl_2_dac),
               .hi_muxsel(hi_muxsel),
               .comp_edge(comp_edge),
               .sat_flg(sat_flg),
               .sw_on( sw_on),
               .FF_preset_bar(FF_preset_bar),
               .FF_clear_bar(FF_clear_bar),
               .exp_flg_bar(exp_flg_bar),
               .dco_p(dco_p),
               .dco_n(dco_n),
               .da_p(da_p),
               .da_n(da_n),
               .db_p(db_p),
               .db_n(db_n),
               .aclk_p(aclk_p),
               .aclk_n(aclk_n),
               .cnv(cnv),
               .tp(tp),
               .tl(tl),
               .ctrl_ready_flg(ctrl_ready_flg),
               .clk(clk)
//                .counter(counter),
//                .state(state),
//                .cntr_load(cntr_load)
                );    
                 
                
                         
         
     always begin
        #2.5
        sys_clk_p = sys_clk_n;
        sys_clk_n = ~sys_clk_n;
     end
     
     always begin
        #0.5
        fclk = ~fclk;
    end
     
     always@(posedge fclk) begin
        dco_p = aclk_p;
        dco_n = aclk_n;
       end
     
     integer i = 0;
     initial begin
        sys_clk_p = 1;
        sys_clk_n = 0;
        reset_in = 1;
        hi_muxsel = 0;
        startup_in = 0;
        sat_flg = 1;
        comp_edge = 1;
        fclk = 0;
        da_p = 1;
        da_n = 0;
        db_p = 0;
        db_n = 1;
        
        for(i = 0; i <100; i=i+1) begin
                       @(negedge clk);
                   end
        reset_in = 0;
        
         for(i = 0; i <1200; i=i+1) begin
               @(negedge clk);
           end
        
        @(negedge clk);
        
        reset_in =  0;
        
        
        @(negedge clk)
        
        
        for(i = 0; i < 1500; i=i+1) begin
            @(negedge clk);
        end
        
        reset_in = 0;
        
        @(negedge clk);
        
        startup_in = 1;
     end
                
                
endmodule
