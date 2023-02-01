vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_13
vlib questa_lib/msim/processing_system7_vip_v1_0_15
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/fifo_generator_v13_2_7
vlib questa_lib/msim/axi_data_fifo_v2_1_26
vlib questa_lib/msim/axi_register_slice_v2_1_27
vlib questa_lib/msim/axi_protocol_converter_v2_1_27

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 questa_lib/msim/axi_vip_v1_1_13
vmap processing_system7_vip_v1_0_15 questa_lib/msim/processing_system7_vip_v1_0_15
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_7 questa_lib/msim/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_26 questa_lib/msim/axi_data_fifo_v2_1_26
vmap axi_register_slice_v2_1_27 questa_lib/msim/axi_register_slice_v2_1_27
vmap axi_protocol_converter_v2_1_27 questa_lib/msim/axi_protocol_converter_v2_1_27

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L xilinx_vip "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"P:/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L xilinx_vip "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"P:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"P:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"P:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/proAceBD/ipshared/7bda/src/proAce.v" \
"../../../bd/proAceBD/ipshared/7bda/hdl/proAceIP_v1_0_S00_AXI.v" \
"../../../bd/proAceBD/ipshared/7bda/hdl/proAceIP_v1_0.v" \
"../../../bd/proAceBD/ip/proAceBD_proAceIP_0_0/sim/proAceBD_proAceIP_0_0.v" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13  -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L xilinx_vip "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_15  -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L xilinx_vip "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/proAceBD/ip/proAceBD_processing_system7_0_0/sim/proAceBD_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2  -93  \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93  \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/proAceBD/ip/proAceBD_rst_ps7_0_100M_0/sim/proAceBD_rst_ps7_0_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -incr -mfcu  "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu  "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7  -93  \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu  "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_26  -incr -mfcu  "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_27  -incr -mfcu  "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_27  -incr -mfcu  "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ec67/hdl" "+incdir+../../../../proAcePL.gen/sources_1/bd/proAceBD/ipshared/ee60/hdl" "+incdir+P:/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/proAceBD/ip/proAceBD_auto_pc_0/sim/proAceBD_auto_pc_0.v" \
"../../../bd/proAceBD/sim/proAceBD.v" \

vlog -work xil_defaultlib \
"glbl.v"

