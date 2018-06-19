`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2018 04:03:20 PM
// Design Name: 
// Module Name: ADC_DAC_tb
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

    //system inputs
    reg sys_clk_p, sys_clk_n, startup_in, reset_in;
    reg comp_edge, sat_flg;
    //adc inputs
    reg dco_p, dco_n, da_p, da_n, db_p, db_n;
    //dac inputs
    
    //system outputs
    wire clk, hi_muxsel, done;
    wire sw_on, FF_preset_bar, FF_clear_bar;
    wire [9:0] ctrl_2_dac;
    wire exp_flag_bar, ctrl_ready_flag;



    //adc outputs
    wire aclk_p, aclk_n, cnv, tp, tl;
    wire [15:0] data;
    //dac outputs
    wire dacclk;

    //system wires
    integer i = 0;
    
    main inst0(.sys_clk_p(sys_clk_p), .sys_clk_n(sys_clk_n), .reset_in(reset_in), 
               .startup_in(startup_in), .dacclk(dacclk), .ctrl_2_dac(ctrl_2_dac),
                .hi_muxsel(hi_muxsel), .comp_edge(comp_edge), .sat_flg(sat_flg), 
                .sw_on(sw_on), .FF_preset_bar(FF_preset_bar), .FF_clear_bar(FF_clear_bar), 
                .exp_flg_bar(exp_flag_bar), .dco_p(dco_p), .dco_n(dco_n), .da_p(da_p),
                .da_n(da_n), .db_p(db_p), .db_n(db_n), .aclk_p(aclk_p), .aclk_n(aclk_n),
                .cnv(cnv), .tp(tp), .tl(tl), .ctrl_ready_flg(ctrl_ready_flag), .clk(clk));
                
    always begin
        #2.5
        sys_clk_p = sys_clk_n;
        sys_clk_n = ~sys_clk_n;
    end
    
    always begin
        #0.7
        dco_p = aclk_p;
        dco_n = aclk_n;
    end
    
    initial begin
        sys_clk_p = 0;
        sys_clk_n = 1;
        reset_in = 1;
        
        dco_p = 1;
        dco_n = 0;
        da_p = 1;
        da_n = 0;
        db_p = 1;
        db_n = 0;
        startup_in = 0;
        reset_in = 1;
        comp_edge = 0;
        sat_flg = 0;
        
         for(i = 0; i < 2000; i = i + 1) begin
                       @(negedge clk);
                   end
        
        reset_in = 0;
        
        for(i = 0; i < 2000; i = i + 1) begin
            @(negedge clk);
        end
        
        startup_in = 1;
           
        @(negedge clk);
 
    end

endmodule
