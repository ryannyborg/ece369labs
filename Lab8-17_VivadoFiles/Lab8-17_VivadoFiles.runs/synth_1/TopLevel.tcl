# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7k70tfbv676-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-17_VivadoFiles/Lab8-17_VivadoFiles.cache/wt} [current_project]
set_property parent.project_path {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-17_VivadoFiles/Lab8-17_VivadoFiles.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {c:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-17_VivadoFiles/Lab8-17_VivadoFiles.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/ALU32Bit.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/Controllers/Control.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/DataMemory.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/EXMEMRegister.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/TopModules/Execution.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/HiLoRegister.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/IDEXRegister.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/IFIDRegister.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/TopModules/InstructionDecode.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/TopModules/InstructionFetch.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/InstructionMemory.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/MEMWBRegister.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/TopModules/Memory.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/Mux32Bit2To1.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/Mux5Bit2To1.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/PCAdder.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/ProgramCounter.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/RegisterFile.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/SignExtension.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/TopModules/WriteBack.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/TopModules/TopLevel.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/EXAdder.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-17_VivadoFiles/Lab8-17_VivadoFiles.srcs/sources_1/new/ShiftLeft2.v}
  {C:/Users/Jesus/Documents/ECE 369/Modifications/LABS8-17 UPDATED 11-8-17/Lab8-14_Files/DatapathComponents/Mux32Bit3To1.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}

synth_design -top TopLevel -part xc7k70tfbv676-1


write_checkpoint -force -noxdef TopLevel.dcp

catch { report_utilization -file TopLevel_utilization_synth.rpt -pb TopLevel_utilization_synth.pb }
