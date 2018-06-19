# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a50tfgg484-3

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.cache/wt [current_project]
set_property parent.project_path C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/new/ACD.v
  C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/imports/new/ADC.v
  C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/imports/new/DAC.v
  C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/new/controller.v
  C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/imports/Desktop/cpu.v
  C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/imports/new/debounce.v
  C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/new/stage0.v
  C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/new/stage1.v
  C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/new/stage2.v
  C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/new/stage3.v
  C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/imports/new/sync_reg.v
  C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/new/main.v
}
read_ip -quiet C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/ip/c_addsub_0/c_addsub_0.xci
set_property used_in_implementation false [get_files -all c:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/ip/c_addsub_0/c_addsub_0_ooc.xdc]

read_ip -quiet C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/ip/c_addsub_2/c_addsub_2.xci
set_property used_in_implementation false [get_files -all c:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/ip/c_addsub_2/c_addsub_2_ooc.xdc]

read_ip -quiet C:/Users/Chris/Desktop/test3_0_DAC_cpu_180617_ok/DAC/DAC.srcs/sources_1/ip/on_time_counter/on_time_counter.xci
set_property used_in_implementation false [get_files -all c:/Users/Chris/Desktop/test3_0_DAC_cpu_180617_ok/DAC/DAC.srcs/sources_1/ip/on_time_counter/on_time_counter_ooc.xdc]

read_ip -quiet C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all c:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

read_ip -quiet C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/ip/c_addsub_1/c_addsub_1.xci
set_property used_in_implementation false [get_files -all c:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/ip/c_addsub_1/c_addsub_1_ooc.xdc]

read_ip -quiet C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/ip/mult_gen_0/mult_gen_0.xci
set_property used_in_implementation false [get_files -all c:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/sources_1/ip/mult_gen_0/mult_gen_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/constrs_1/imports/ADC_Controller_DAC/xem7010.xdc
set_property used_in_implementation false [get_files C:/Users/Chris/Desktop/Research/ADC_Controller_DAC/ADC_Controller_DAC.srcs/constrs_1/imports/ADC_Controller_DAC/xem7010.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top main -part xc7a50tfgg484-3


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef main.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file main_utilization_synth.rpt -pb main_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
