# ProAce
ProAce : AES Accelerator using FPGA

When designing our FPGA-based ProAce 128-bit AES architecture , we considered alternate resource utilization techniques. We looked at a number of high-level architectural and sub-round transformation designs to make an encryption cycle that uses less space, has a high throughput, and works quickly. During the design process, we used the following performance metrics to measure how our design decisions affected the architecture as a whole: During the design process, we used the following performance metrics to measure how our design decisions affected the architecture as a whole: 

- Total encryption cycles: the time required to complete the encryption rounds.  
- Throughput: the total number of encrypted bits produced each second.  
- Hardware Resources: the number of flip-flops, lookup tables (LUTs), block RAM, and DSP slices used across the FPGA.

Here we propose a novel design for AES encryption flow that utilizes a combination logic in Verilog. This approach is different from the traditional methods, such as Shiftrow, Mixcolumn, and Sub Bytes, as it utilizes substitution and permutation methods as shown in Fig 2-b.

The proposed design aims to make use of logic slices, which are better suited for high-speed operation. By using logic slices, the design allows for faster clock speeds and increased throughput. The proposed design uses a single-cycle per operation, resulting in a total of 22 clock cycles for 10 rounds of AES encryption. This is a significant improvement over traditional methods that may require more clock cycles.

The proposed design also aims to achieve faster encryption times while utilizing minimal resources on the FPGA. This is an important design goal as faster encryption times can improve the performance of a wide range of systems. Additionally, the proposed design aims to make optimal use of underutilized components such as digital signal processing slices. This is done by taking into account their physical arrangement and incorporating that information into the AES design.

Overall, the proposed design is aimed at achieving faster encryption times while utilizing minimal resources on the FPGA. By using logic slices and substitution and permutation methods, the proposed design aims to improve the performance of AES encryption for a wide range of systems. Additionally, the proposed design aims to make optimal use of underutilized components such as digital signal processing slices to further improve the performance of AES encryption.
