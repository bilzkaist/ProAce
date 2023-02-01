vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_13
vlib riviera/processing_system7_vip_v1_0_15
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/fifo_generator_v13_2_7
vlib riviera/axi_data_fifo_v2_1_26
vlib riviera/axi_register_slice_v2_1_27
vlib riviera/axi_protocol_converter_v2_1_27

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 riviera/axi_vip_v1_1_13
vmap processing_system7_vip_v1_0_15 riviera/processing_system7_vip_v1_0_15
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_7 riviera/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_26 riviera/axi_data_fifo_v2_1_26
vmap axi_register_slice_v2_1_27 riviera/axi_register_slice_v2_1_27
vmap axi_protocol_converter_v2_1_27 riviera/axi_protocol_converter_v2_1_27

vlog -work xilinx_vip  -sv2k12 "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"P:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"P:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"P:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/proAceBD/ipshared/7bda/src/proAce.v" \
"../../../bd/proAceBD/ipshared/7bda/hdl/proAceIP_v1_0_S00_AXI.v" \
"../../../bd/proAceBD/ipshared/7bda/hdl/proAceIP_v1_0.v" \
"../../../bd/proAceBD/ip/proAceBD_proAceIP_0_0/sim/proAceBD_proAceIP_0_0.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13  -sv2k12 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_15  -sv2k12 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/proAceBD/ip/proAceBD_processing_system7_0_0/sim/proAceBD_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93  \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93  \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/proAceBD/ip/proAceBD_rst_ps7_0_100M_0/sim/proAceBD_rst_ps7_0_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -93  \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_26  -v2k5 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_27  -v2k5 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_27  -v2k5 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/proAceBD/ip/proAceBD_auto_pc_0/sim/proAceBD_auto_pc_0.v" \
"../../../bd/proAceBD/sim/proAceBD.v" \

vlog -work xil_defaultlib \
"glbl.v"

