// Code your design here
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2022 10:13:17 PM
// Design Name: 
// Module Name: proAce
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


module proAce(clk, wordIn0,wordIn1,wordIn2,wordIn3, wordKey0,wordKey1,wordKey2,wordKey3, wordOut0, wordOut1, wordOut2, wordOut3);
    // Input-Output Parameters
    input clk;
    input [31:0] wordIn0,wordIn1,wordIn2,wordIn3;
    input [31:0] wordKey0,wordKey1,wordKey2,wordKey3;
    output reg[31:0] wordOut0, wordOut1, wordOut2, wordOut3; 
    //input [127:0] dataIn, key;
    //output reg [127:0] dataOut;
    
    // Other Reg Parameters
  reg [127:0] initialRoundState, initialKey;
    
  wire [127:0] addRoundKey1, addRoundKey2, addRoundKey3,addRoundKey4,
  addRoundKey5, addRoundKey6, addRoundKey7, addRoundKey8, addRoundKey9, addRoundKey10;
   /*addRoundKey1 = 128'hd6aa74fdd2af72fadaa678f1d6ab76fe,
                addRoundKey2 = 128'hb692cf0b643dbdf1be9bc5006830b3fe,
                addRoundKey3 = 128'hb6ff744ed2c2c9bf6c590cbf0469bf41,
                addRoundKey4 = 128'h47f7f7bc95353e03f96c32bcfd058dfd,
                addRoundKey5 = 128'h3caaa3e8a99f9deb50f3af57adf622aa,
                addRoundKey6 = 128'h5e390f7df7a69296a7553dc10aa31f6b,
                addRoundKey7 = 128'h14f9701ae35fe28c440adf4d4ea9c026,
                addRoundKey8 = 128'h47438735a41c65b9e016baf4aebf7ad2,
                addRoundKey9 = 128'h549932d1f08557681093ed9cbe2c974e,
                addRoundKey10 = 128'h13111d7fe3944a17f307a78b4d2b30c5;*/
  wire [127:0] singleRoundState1, singleRoundState2,
  singleRoundState3,
  singleRoundState4,
  singleRoundState5,
  singleRoundState6,
  singleRoundState7,
  singleRoundState8,
  singleRoundState9,
  finalRoundState
  ;
  wire  [127:0] roundstate= 128'h89d8_10e8_855a_ce68_bdf8_33a8_cb12_8fe4;
  
    
    // Other Wire Parameters
    //wire [127:0] singleRound1, singleRound2, singleRound3, singleRound4, singleRound5, singleRound6, singleRound7, singleRound8, singleRound9, finalRound;
    
    
    // Initial Round
    always @(posedge clk)
    begin
        initialRoundState = {wordIn0,wordIn1,wordIn2,wordIn3} ^ {wordKey0,wordKey1,wordKey2,wordKey3};//dataIn ^ key;
      initialKey = {wordKey0,wordKey1,wordKey2,wordKey3};
      {wordOut0, wordOut1, wordOut2, wordOut3} = finalRoundState;   
    end
    
    // Key Expansion Module 
    keyExp128
  extendedKey1 (clk, 8'h1, initialKey, addRoundKey1),
  extendedKey2 (clk, 8'h2, addRoundKey1, addRoundKey2),  
  extendedKey3 (clk, 8'h4, addRoundKey2, addRoundKey3), 
  extendedKey4 (clk, 8'h8, addRoundKey3, addRoundKey4), 
  extendedKey5 (clk, 8'h10, addRoundKey4, addRoundKey5), 
  extendedKey6 (clk, 8'h20, addRoundKey5, addRoundKey6), 
  extendedKey7 (clk, 8'h40, addRoundKey6, addRoundKey7), 
  extendedKey8 (clk, 8'h80, addRoundKey7, addRoundKey8),
  extendedKey9 (clk, 8'h1b, addRoundKey8, addRoundKey9), 
  extendedKey10 (clk, 8'h36, addRoundKey9, addRoundKey10); 
    
    // Single Rounds (1-9)
  singleRoundSPN 
  round1 (clk, initialRoundState, addRoundKey1, singleRoundState1),
  round2 (clk, singleRoundState1, addRoundKey2, singleRoundState2),
  round3 (clk, singleRoundState2, addRoundKey3, singleRoundState3),
  round4 (clk, singleRoundState3, addRoundKey4, singleRoundState4),
  round5 (clk, singleRoundState4, addRoundKey5, singleRoundState5),
  round6 (clk, singleRoundState5, addRoundKey6, singleRoundState6),
  round7 (clk, singleRoundState6, addRoundKey7, singleRoundState7),  
  round8 (clk, singleRoundState7, addRoundKey8, singleRoundState8),  
  round9 (clk, singleRoundState8, addRoundKey9, singleRoundState9);
 
  
    // Final Round (10) 
    finalRoundSPN
  round10 (clk, singleRoundState9, addRoundKey10, finalRoundState);
    
    
endmodule

module finalRoundSPN(clk, stateIn, addRoundKey, stateOut);
	// Input-Output Parameters
    input clk;
  input [127:0] stateIn, addRoundKey;
  output reg [127:0] stateOut;
  wire [31:0] wi0,wi1,wi2,wi3,
                wo0,wo1,wo2,wo3,
                wk0,wk1,wk2,wk3;
  // wire parameters
  wire [7:0]    d0,d1,d2,d3,
                d4,d5,d6,d7,
                d8,d9,d10,d11,
                d12,d13,d14,d15;
  
  assign {wk0,wk1,wk2,wk3} = addRoundKey;
  
  assign {wi0,wi1,wi2,wi3} = stateIn;
  
  SubWord 
  sw1 (clk, wi0, {d0,d1,d2,d3}),
  sw2 (clk, wi1, {d4,d5,d6,d7}),
  sw3 (clk, wi2, {d8,d9,d10,d11}),
  sw4 (clk, wi3, {d12,d13,d14,d15});
  
  assign wo0 = {d0, d5, d10, d15} ^ wk0;
  assign wo1 = {d4, d9, d14, d3}  ^ wk1;
  assign wo2 = {d8, d13, d2, d7}  ^ wk2;
  assign wo3 = {d12, d1, d6, d11} ^ wk3;
  
  always @(posedge clk)
    stateOut <= {wo0, wo1, wo2, wo3};
  
endmodule



module singleRoundSPN(clk, stateIn, addRoundKey, stateOut);
    //Input-Output Parameters
    input clk;
    input [127:0] stateIn, addRoundKey;
    output reg [127:0] stateOut;
    // (st)states[128], (w)word[32], (d)data[8]
    // wire parameters
    wire [31:0] wi0,wi1,wi2,wi3,
                wo0,wo1,wo2,wo3,
                wk0,wk1,wk2,wk3,
                dw0,dw1,dw2,dw3,
                dw4,dw5,dw6,dw7,
                dw8,dw9,dw10,dw11,
                dw12,dw13,dw14,dw15;
    // 128 Bit to 32 Bit
    assign {wi0, wi1, wi2, wi3} = stateIn;            
    assign {wk0, wk1, wk2, wk3} = addRoundKey;
    
    subSingleRoundSPN
    subSingleRoundSPN0(clk, wi0, dw0, dw1, dw2, dw3),
    subSingleRoundSPN1(clk, wi1, dw4, dw5, dw6, dw7),
    subSingleRoundSPN2(clk, wi2, dw8, dw9, dw10, dw11),
    subSingleRoundSPN3(clk, wi3, dw12, dw13, dw14, dw15);
    
    assign wo0 = dw0 ^ dw5 ^ dw10 ^ dw15 ^ wk0; 
    assign wo1 = dw3 ^ dw4 ^ dw9 ^ dw14 ^ wk1; 
    assign wo2 = dw2 ^ dw7 ^ dw8 ^ dw13 ^ wk2; 
    assign wo3 = dw1 ^ dw6 ^ dw11 ^ dw12 ^ wk3; 
                
    always @ (posedge clk)
    begin
        stateOut <= {wo0, wo1, wo2, wo3};
    end
    
    
endmodule

module subSingleRoundSPN(clk, wordIn, wordOut0, wordOut1, wordOut2, wordOut3);
    //Input-Output Parameter
    input clk;
    input [31:0] wordIn;
    output [31:0]  wordOut0, wordOut1, wordOut2, wordOut3;
    //wire parameters
    wire [7:0] d0, d1, d2, d3;
    // 32 Bit to 8 
    assign {d0, d1, d2, d3} = wordIn;
    
    unitSingleRoundSPN
    unitSingleRoundSPN0 (clk, d0, {wordOut0[23:0], wordOut0[31:24]} ),
    unitSingleRoundSPN1 (clk, d1, {wordOut1[15:0], wordOut1[31:16]} ),
    unitSingleRoundSPN2 (clk, d2, {wordOut2[7:0], wordOut2[31:8]} ),
    unitSingleRoundSPN3 (clk, d3, wordOut3 );
    
    
endmodule 

module unitSingleRoundSPN(clk, dataIn, wordOut);
    // Input-Output Parameters
    input clk;
    input [7:0] dataIn;
    output [31:0] wordOut;
    //wire parameters
    wire [7:0] t0,t1,t2,t3;
    
    
  SubByte sf(clk, dataIn, t0);
  //SBox_Forward sf(clk, dataIn, t0);
    assign t1=t0;
    invSubByte sb(clk, dataIn, t3);
  //SBox_Backward sb(clk, dataIn, t3);
    assign t2 = t1^t3;
    
    assign wordOut = {t0, t1, t2, t3};
    
endmodule

module keyExp128(clk, rcon, keyIn, keyOut);
    // Input-Output Parameters
    input clk;
    input [7:0] rcon;
    input [127:0] keyIn;
    output reg [127:0] keyOut;
  
    // wire parameters
  wire [31:0] wki0, wki1, wki2, wki3,
  		      w0, w1, w2, w3;
  wire [31:0] wko0, wko1, wko2, wko3;
  
  wire [31:0] wks;
  
  reg [31:0] wkr0, wkr1, wkr2, wkr3;
  
  assign {wki0, wki1, wki2, wki3} = keyIn;
  
  assign w0 = {rcon ^ wki0[31:24], wki0[23:0]};
  assign w1 = w0 ^ wki1;
  assign w2 = w1 ^ wki2;
  assign w3 = w2 ^ wki3;
  
  // for clock cycle to acquire value
  always @ (posedge clk)
  {wkr0, wkr1, wkr2, wkr3} <= {w0, w1, w2, w3};
  
  SubWord 
  sw0 (clk, {wki3[23:0], wki3[31:24]}, wks);
  
  assign wko0 = wkr0 ^ wks;
  assign wko1 = wkr1 ^ wks;
  assign wko2 = wkr2 ^ wks;
  assign wko3 = wkr3 ^ wks;
  
  always @ (posedge clk)
    keyOut <= {wko0, wko1, wko2, wko3}; 
 
endmodule

/* substitue four bytes in a word */
module SubWord (clk, wordIn, wordOut);
    input clk;
    input [31:0] wordIn;
    output [31:0] wordOut;
    
  wire [7:0] d0, d1, d2, d3, t0, t1, t2, t3;
  assign {d0, d1, d2, d3} = wordIn;
  assign wordOut = {t0, t1, t2, t3};
    
    //SBox_Forward
    SubByte
  		sb0 (clk, d0, t0),
        sb1 (clk, d1, t1),
        sb2 (clk, d2, t2),
        sb3 (clk, d3, t3);
endmodule
/*
module SBox_Forward(clk, byteIn, byteOut);
  input          	  clk;
  input      [7:0] byteIn;
  output reg [7:0] byteOut;
  wire       [7:0] byteFull;  
  wire        x0,x1,x2,x3,x4,x5,x6,x7;
  wire        y0,y1,y2,y3,y4,y5,y6,y7;  
  assign {x7,x6,x5,x4,x3,x2,x1,x0} = byteIn;
  assign y0 = ~x0;
  assign y1 = x1^~x0;
  assign y2 = x2^~x0;
  assign y3 = ((~x3^x2)^(x1^~x0));
  assign y4 = x4^~x0;
  assign y5 = ((x5^x4)^(x1^~x0));
  assign y6 = (~x6^x4)^(x2^~x0);
  assign y7 = (((~x7^~x6)^((x5^x4)))^((~x3^x2)^(x1^~x0)));
  assign byteFull = {y7,y6,y5,y4,y3,y2,y1,y0};  
  always @ (posedge clk)
  begin
	 byteOut <=  byteFull; 
  end
endmodule

module SBox_Backward(clk, byteIn, byteOut);
  input          	  clk;
  input      [7:0] byteIn;
  output reg [7:0] byteOut;
  wire       [7:0] byteFull;  
  wire        x0,x1,x2,x3,x4,x5,x6,x7;
  wire        y0,y1,y2,y3,y4,y5,y6,y7; 
  assign {y7,y6,y5,y4,y3,y2,y1,y0} = byteIn;
  assign x0 = ~y0;
  assign x1 = (y1^y0);
  assign x2 = y2^y0;
  assign x3 = ~((y3^y1)^(y2^y0));
  assign x4 = y4^y0;
  assign x5 = (y5^y1)^(y4^y0);
  assign x6 = ~((y6^y2)^(y4^y0));
  assign x7 = ~(((y7^y3)^(y5^y1))^((y6^y2)^(y4^y0)));
  assign byteFull = {x7,x6,x5,x4,x3,x2,x1,x0};  
  always @ (posedge clk)
  begin
	 byteOut <=  byteFull; 
  end
endmodule
*/

/* S box */
module SubByte (clk, in, out);
    input clk;
    input [7:0] in;
    output reg [7:0] out;

    always @ (posedge clk)
    case (in)
    8'h00: out <= 8'h63;
    8'h01: out <= 8'h7c;
    8'h02: out <= 8'h77;
    8'h03: out <= 8'h7b;
    8'h04: out <= 8'hf2;
    8'h05: out <= 8'h6b;
    8'h06: out <= 8'h6f;
    8'h07: out <= 8'hc5;
    8'h08: out <= 8'h30;
    8'h09: out <= 8'h01;
    8'h0a: out <= 8'h67;
    8'h0b: out <= 8'h2b;
    8'h0c: out <= 8'hfe;
    8'h0d: out <= 8'hd7;
    8'h0e: out <= 8'hab;
    8'h0f: out <= 8'h76;
    8'h10: out <= 8'hca;
    8'h11: out <= 8'h82;
    8'h12: out <= 8'hc9;
    8'h13: out <= 8'h7d;
    8'h14: out <= 8'hfa;
    8'h15: out <= 8'h59;
    8'h16: out <= 8'h47;
    8'h17: out <= 8'hf0;
    8'h18: out <= 8'had;
    8'h19: out <= 8'hd4;
    8'h1a: out <= 8'ha2;
    8'h1b: out <= 8'haf;
    8'h1c: out <= 8'h9c;
    8'h1d: out <= 8'ha4;
    8'h1e: out <= 8'h72;
    8'h1f: out <= 8'hc0;
    8'h20: out <= 8'hb7;
    8'h21: out <= 8'hfd;
    8'h22: out <= 8'h93;
    8'h23: out <= 8'h26;
    8'h24: out <= 8'h36;
    8'h25: out <= 8'h3f;
    8'h26: out <= 8'hf7;
    8'h27: out <= 8'hcc;
    8'h28: out <= 8'h34;
    8'h29: out <= 8'ha5;
    8'h2a: out <= 8'he5;
    8'h2b: out <= 8'hf1;
    8'h2c: out <= 8'h71;
    8'h2d: out <= 8'hd8;
    8'h2e: out <= 8'h31;
    8'h2f: out <= 8'h15;
    8'h30: out <= 8'h04;
    8'h31: out <= 8'hc7;
    8'h32: out <= 8'h23;
    8'h33: out <= 8'hc3;
    8'h34: out <= 8'h18;
    8'h35: out <= 8'h96;
    8'h36: out <= 8'h05;
    8'h37: out <= 8'h9a;
    8'h38: out <= 8'h07;
    8'h39: out <= 8'h12;
    8'h3a: out <= 8'h80;
    8'h3b: out <= 8'he2;
    8'h3c: out <= 8'heb;
    8'h3d: out <= 8'h27;
    8'h3e: out <= 8'hb2;
    8'h3f: out <= 8'h75;
    8'h40: out <= 8'h09;
    8'h41: out <= 8'h83;
    8'h42: out <= 8'h2c;
    8'h43: out <= 8'h1a;
    8'h44: out <= 8'h1b;
    8'h45: out <= 8'h6e;
    8'h46: out <= 8'h5a;
    8'h47: out <= 8'ha0;
    8'h48: out <= 8'h52;
    8'h49: out <= 8'h3b;
    8'h4a: out <= 8'hd6;
    8'h4b: out <= 8'hb3;
    8'h4c: out <= 8'h29;
    8'h4d: out <= 8'he3;
    8'h4e: out <= 8'h2f;
    8'h4f: out <= 8'h84;
    8'h50: out <= 8'h53;
    8'h51: out <= 8'hd1;
    8'h52: out <= 8'h00;
    8'h53: out <= 8'hed;
    8'h54: out <= 8'h20;
    8'h55: out <= 8'hfc;
    8'h56: out <= 8'hb1;
    8'h57: out <= 8'h5b;
    8'h58: out <= 8'h6a;
    8'h59: out <= 8'hcb;
    8'h5a: out <= 8'hbe;
    8'h5b: out <= 8'h39;
    8'h5c: out <= 8'h4a;
    8'h5d: out <= 8'h4c;
    8'h5e: out <= 8'h58;
    8'h5f: out <= 8'hcf;
    8'h60: out <= 8'hd0;
    8'h61: out <= 8'hef;
    8'h62: out <= 8'haa;
    8'h63: out <= 8'hfb;
    8'h64: out <= 8'h43;
    8'h65: out <= 8'h4d;
    8'h66: out <= 8'h33;
    8'h67: out <= 8'h85;
    8'h68: out <= 8'h45;
    8'h69: out <= 8'hf9;
    8'h6a: out <= 8'h02;
    8'h6b: out <= 8'h7f;
    8'h6c: out <= 8'h50;
    8'h6d: out <= 8'h3c;
    8'h6e: out <= 8'h9f;
    8'h6f: out <= 8'ha8;
    8'h70: out <= 8'h51;
    8'h71: out <= 8'ha3;
    8'h72: out <= 8'h40;
    8'h73: out <= 8'h8f;
    8'h74: out <= 8'h92;
    8'h75: out <= 8'h9d;
    8'h76: out <= 8'h38;
    8'h77: out <= 8'hf5;
    8'h78: out <= 8'hbc;
    8'h79: out <= 8'hb6;
    8'h7a: out <= 8'hda;
    8'h7b: out <= 8'h21;
    8'h7c: out <= 8'h10;
    8'h7d: out <= 8'hff;
    8'h7e: out <= 8'hf3;
    8'h7f: out <= 8'hd2;
    8'h80: out <= 8'hcd;
    8'h81: out <= 8'h0c;
    8'h82: out <= 8'h13;
    8'h83: out <= 8'hec;
    8'h84: out <= 8'h5f;
    8'h85: out <= 8'h97;
    8'h86: out <= 8'h44;
    8'h87: out <= 8'h17;
    8'h88: out <= 8'hc4;
    8'h89: out <= 8'ha7;
    8'h8a: out <= 8'h7e;
    8'h8b: out <= 8'h3d;
    8'h8c: out <= 8'h64;
    8'h8d: out <= 8'h5d;
    8'h8e: out <= 8'h19;
    8'h8f: out <= 8'h73;
    8'h90: out <= 8'h60;
    8'h91: out <= 8'h81;
    8'h92: out <= 8'h4f;
    8'h93: out <= 8'hdc;
    8'h94: out <= 8'h22;
    8'h95: out <= 8'h2a;
    8'h96: out <= 8'h90;
    8'h97: out <= 8'h88;
    8'h98: out <= 8'h46;
    8'h99: out <= 8'hee;
    8'h9a: out <= 8'hb8;
    8'h9b: out <= 8'h14;
    8'h9c: out <= 8'hde;
    8'h9d: out <= 8'h5e;
    8'h9e: out <= 8'h0b;
    8'h9f: out <= 8'hdb;
    8'ha0: out <= 8'he0;
    8'ha1: out <= 8'h32;
    8'ha2: out <= 8'h3a;
    8'ha3: out <= 8'h0a;
    8'ha4: out <= 8'h49;
    8'ha5: out <= 8'h06;
    8'ha6: out <= 8'h24;
    8'ha7: out <= 8'h5c;
    8'ha8: out <= 8'hc2;
    8'ha9: out <= 8'hd3;
    8'haa: out <= 8'hac;
    8'hab: out <= 8'h62;
    8'hac: out <= 8'h91;
    8'had: out <= 8'h95;
    8'hae: out <= 8'he4;
    8'haf: out <= 8'h79;
    8'hb0: out <= 8'he7;
    8'hb1: out <= 8'hc8;
    8'hb2: out <= 8'h37;
    8'hb3: out <= 8'h6d;
    8'hb4: out <= 8'h8d;
    8'hb5: out <= 8'hd5;
    8'hb6: out <= 8'h4e;
    8'hb7: out <= 8'ha9;
    8'hb8: out <= 8'h6c;
    8'hb9: out <= 8'h56;
    8'hba: out <= 8'hf4;
    8'hbb: out <= 8'hea;
    8'hbc: out <= 8'h65;
    8'hbd: out <= 8'h7a;
    8'hbe: out <= 8'hae;
    8'hbf: out <= 8'h08;
    8'hc0: out <= 8'hba;
    8'hc1: out <= 8'h78;
    8'hc2: out <= 8'h25;
    8'hc3: out <= 8'h2e;
    8'hc4: out <= 8'h1c;
    8'hc5: out <= 8'ha6;
    8'hc6: out <= 8'hb4;
    8'hc7: out <= 8'hc6;
    8'hc8: out <= 8'he8;
    8'hc9: out <= 8'hdd;
    8'hca: out <= 8'h74;
    8'hcb: out <= 8'h1f;
    8'hcc: out <= 8'h4b;
    8'hcd: out <= 8'hbd;
    8'hce: out <= 8'h8b;
    8'hcf: out <= 8'h8a;
    8'hd0: out <= 8'h70;
    8'hd1: out <= 8'h3e;
    8'hd2: out <= 8'hb5;
    8'hd3: out <= 8'h66;
    8'hd4: out <= 8'h48;
    8'hd5: out <= 8'h03;
    8'hd6: out <= 8'hf6;
    8'hd7: out <= 8'h0e;
    8'hd8: out <= 8'h61;
    8'hd9: out <= 8'h35;
    8'hda: out <= 8'h57;
    8'hdb: out <= 8'hb9;
    8'hdc: out <= 8'h86;
    8'hdd: out <= 8'hc1;
    8'hde: out <= 8'h1d;
    8'hdf: out <= 8'h9e;
    8'he0: out <= 8'he1;
    8'he1: out <= 8'hf8;
    8'he2: out <= 8'h98;
    8'he3: out <= 8'h11;
    8'he4: out <= 8'h69;
    8'he5: out <= 8'hd9;
    8'he6: out <= 8'h8e;
    8'he7: out <= 8'h94;
    8'he8: out <= 8'h9b;
    8'he9: out <= 8'h1e;
    8'hea: out <= 8'h87;
    8'heb: out <= 8'he9;
    8'hec: out <= 8'hce;
    8'hed: out <= 8'h55;
    8'hee: out <= 8'h28;
    8'hef: out <= 8'hdf;
    8'hf0: out <= 8'h8c;
    8'hf1: out <= 8'ha1;
    8'hf2: out <= 8'h89;
    8'hf3: out <= 8'h0d;
    8'hf4: out <= 8'hbf;
    8'hf5: out <= 8'he6;
    8'hf6: out <= 8'h42;
    8'hf7: out <= 8'h68;
    8'hf8: out <= 8'h41;
    8'hf9: out <= 8'h99;
    8'hfa: out <= 8'h2d;
    8'hfb: out <= 8'h0f;
    8'hfc: out <= 8'hb0;
    8'hfd: out <= 8'h54;
    8'hfe: out <= 8'hbb;
    8'hff: out <= 8'h16;
    endcase
endmodule

/* Inverse S box * x */
module invSubByte (clk, in, out);
    input clk;
    input [7:0] in;
    output reg [7:0] out;

    always @ (posedge clk)
    case (in)
    8'h00: out <= 8'hc6;
    8'h01: out <= 8'hf8;
    8'h02: out <= 8'hee;
    8'h03: out <= 8'hf6;
    8'h04: out <= 8'hff;
    8'h05: out <= 8'hd6;
    8'h06: out <= 8'hde;
    8'h07: out <= 8'h91;
    8'h08: out <= 8'h60;
    8'h09: out <= 8'h02;
    8'h0a: out <= 8'hce;
    8'h0b: out <= 8'h56;
    8'h0c: out <= 8'he7;
    8'h0d: out <= 8'hb5;
    8'h0e: out <= 8'h4d;
    8'h0f: out <= 8'hec;
    8'h10: out <= 8'h8f;
    8'h11: out <= 8'h1f;
    8'h12: out <= 8'h89;
    8'h13: out <= 8'hfa;
    8'h14: out <= 8'hef;
    8'h15: out <= 8'hb2;
    8'h16: out <= 8'h8e;
    8'h17: out <= 8'hfb;
    8'h18: out <= 8'h41;
    8'h19: out <= 8'hb3;
    8'h1a: out <= 8'h5f;
    8'h1b: out <= 8'h45;
    8'h1c: out <= 8'h23;
    8'h1d: out <= 8'h53;
    8'h1e: out <= 8'he4;
    8'h1f: out <= 8'h9b;
    8'h20: out <= 8'h75;
    8'h21: out <= 8'he1;
    8'h22: out <= 8'h3d;
    8'h23: out <= 8'h4c;
    8'h24: out <= 8'h6c;
    8'h25: out <= 8'h7e;
    8'h26: out <= 8'hf5;
    8'h27: out <= 8'h83;
    8'h28: out <= 8'h68;
    8'h29: out <= 8'h51;
    8'h2a: out <= 8'hd1;
    8'h2b: out <= 8'hf9;
    8'h2c: out <= 8'he2;
    8'h2d: out <= 8'hab;
    8'h2e: out <= 8'h62;
    8'h2f: out <= 8'h2a;
    8'h30: out <= 8'h08;
    8'h31: out <= 8'h95;
    8'h32: out <= 8'h46;
    8'h33: out <= 8'h9d;
    8'h34: out <= 8'h30;
    8'h35: out <= 8'h37;
    8'h36: out <= 8'h0a;
    8'h37: out <= 8'h2f;
    8'h38: out <= 8'h0e;
    8'h39: out <= 8'h24;
    8'h3a: out <= 8'h1b;
    8'h3b: out <= 8'hdf;
    8'h3c: out <= 8'hcd;
    8'h3d: out <= 8'h4e;
    8'h3e: out <= 8'h7f;
    8'h3f: out <= 8'hea;
    8'h40: out <= 8'h12;
    8'h41: out <= 8'h1d;
    8'h42: out <= 8'h58;
    8'h43: out <= 8'h34;
    8'h44: out <= 8'h36;
    8'h45: out <= 8'hdc;
    8'h46: out <= 8'hb4;
    8'h47: out <= 8'h5b;
    8'h48: out <= 8'ha4;
    8'h49: out <= 8'h76;
    8'h4a: out <= 8'hb7;
    8'h4b: out <= 8'h7d;
    8'h4c: out <= 8'h52;
    8'h4d: out <= 8'hdd;
    8'h4e: out <= 8'h5e;
    8'h4f: out <= 8'h13;
    8'h50: out <= 8'ha6;
    8'h51: out <= 8'hb9;
    8'h52: out <= 8'h00;
    8'h53: out <= 8'hc1;
    8'h54: out <= 8'h40;
    8'h55: out <= 8'he3;
    8'h56: out <= 8'h79;
    8'h57: out <= 8'hb6;
    8'h58: out <= 8'hd4;
    8'h59: out <= 8'h8d;
    8'h5a: out <= 8'h67;
    8'h5b: out <= 8'h72;
    8'h5c: out <= 8'h94;
    8'h5d: out <= 8'h98;
    8'h5e: out <= 8'hb0;
    8'h5f: out <= 8'h85;
    8'h60: out <= 8'hbb;
    8'h61: out <= 8'hc5;
    8'h62: out <= 8'h4f;
    8'h63: out <= 8'hed;
    8'h64: out <= 8'h86;
    8'h65: out <= 8'h9a;
    8'h66: out <= 8'h66;
    8'h67: out <= 8'h11;
    8'h68: out <= 8'h8a;
    8'h69: out <= 8'he9;
    8'h6a: out <= 8'h04;
    8'h6b: out <= 8'hfe;
    8'h6c: out <= 8'ha0;
    8'h6d: out <= 8'h78;
    8'h6e: out <= 8'h25;
    8'h6f: out <= 8'h4b;
    8'h70: out <= 8'ha2;
    8'h71: out <= 8'h5d;
    8'h72: out <= 8'h80;
    8'h73: out <= 8'h05;
    8'h74: out <= 8'h3f;
    8'h75: out <= 8'h21;
    8'h76: out <= 8'h70;
    8'h77: out <= 8'hf1;
    8'h78: out <= 8'h63;
    8'h79: out <= 8'h77;
    8'h7a: out <= 8'haf;
    8'h7b: out <= 8'h42;
    8'h7c: out <= 8'h20;
    8'h7d: out <= 8'he5;
    8'h7e: out <= 8'hfd;
    8'h7f: out <= 8'hbf;
    8'h80: out <= 8'h81;
    8'h81: out <= 8'h18;
    8'h82: out <= 8'h26;
    8'h83: out <= 8'hc3;
    8'h84: out <= 8'hbe;
    8'h85: out <= 8'h35;
    8'h86: out <= 8'h88;
    8'h87: out <= 8'h2e;
    8'h88: out <= 8'h93;
    8'h89: out <= 8'h55;
    8'h8a: out <= 8'hfc;
    8'h8b: out <= 8'h7a;
    8'h8c: out <= 8'hc8;
    8'h8d: out <= 8'hba;
    8'h8e: out <= 8'h32;
    8'h8f: out <= 8'he6;
    8'h90: out <= 8'hc0;
    8'h91: out <= 8'h19;
    8'h92: out <= 8'h9e;
    8'h93: out <= 8'ha3;
    8'h94: out <= 8'h44;
    8'h95: out <= 8'h54;
    8'h96: out <= 8'h3b;
    8'h97: out <= 8'h0b;
    8'h98: out <= 8'h8c;
    8'h99: out <= 8'hc7;
    8'h9a: out <= 8'h6b;
    8'h9b: out <= 8'h28;
    8'h9c: out <= 8'ha7;
    8'h9d: out <= 8'hbc;
    8'h9e: out <= 8'h16;
    8'h9f: out <= 8'had;
    8'ha0: out <= 8'hdb;
    8'ha1: out <= 8'h64;
    8'ha2: out <= 8'h74;
    8'ha3: out <= 8'h14;
    8'ha4: out <= 8'h92;
    8'ha5: out <= 8'h0c;
    8'ha6: out <= 8'h48;
    8'ha7: out <= 8'hb8;
    8'ha8: out <= 8'h9f;
    8'ha9: out <= 8'hbd;
    8'haa: out <= 8'h43;
    8'hab: out <= 8'hc4;
    8'hac: out <= 8'h39;
    8'had: out <= 8'h31;
    8'hae: out <= 8'hd3;
    8'haf: out <= 8'hf2;
    8'hb0: out <= 8'hd5;
    8'hb1: out <= 8'h8b;
    8'hb2: out <= 8'h6e;
    8'hb3: out <= 8'hda;
    8'hb4: out <= 8'h01;
    8'hb5: out <= 8'hb1;
    8'hb6: out <= 8'h9c;
    8'hb7: out <= 8'h49;
    8'hb8: out <= 8'hd8;
    8'hb9: out <= 8'hac;
    8'hba: out <= 8'hf3;
    8'hbb: out <= 8'hcf;
    8'hbc: out <= 8'hca;
    8'hbd: out <= 8'hf4;
    8'hbe: out <= 8'h47;
    8'hbf: out <= 8'h10;
    8'hc0: out <= 8'h6f;
    8'hc1: out <= 8'hf0;
    8'hc2: out <= 8'h4a;
    8'hc3: out <= 8'h5c;
    8'hc4: out <= 8'h38;
    8'hc5: out <= 8'h57;
    8'hc6: out <= 8'h73;
    8'hc7: out <= 8'h97;
    8'hc8: out <= 8'hcb;
    8'hc9: out <= 8'ha1;
    8'hca: out <= 8'he8;
    8'hcb: out <= 8'h3e;
    8'hcc: out <= 8'h96;
    8'hcd: out <= 8'h61;
    8'hce: out <= 8'h0d;
    8'hcf: out <= 8'h0f;
    8'hd0: out <= 8'he0;
    8'hd1: out <= 8'h7c;
    8'hd2: out <= 8'h71;
    8'hd3: out <= 8'hcc;
    8'hd4: out <= 8'h90;
    8'hd5: out <= 8'h06;
    8'hd6: out <= 8'hf7;
    8'hd7: out <= 8'h1c;
    8'hd8: out <= 8'hc2;
    8'hd9: out <= 8'h6a;
    8'hda: out <= 8'hae;
    8'hdb: out <= 8'h69;
    8'hdc: out <= 8'h17;
    8'hdd: out <= 8'h99;
    8'hde: out <= 8'h3a;
    8'hdf: out <= 8'h27;
    8'he0: out <= 8'hd9;
    8'he1: out <= 8'heb;
    8'he2: out <= 8'h2b;
    8'he3: out <= 8'h22;
    8'he4: out <= 8'hd2;
    8'he5: out <= 8'ha9;
    8'he6: out <= 8'h07;
    8'he7: out <= 8'h33;
    8'he8: out <= 8'h2d;
    8'he9: out <= 8'h3c;
    8'hea: out <= 8'h15;
    8'heb: out <= 8'hc9;
    8'hec: out <= 8'h87;
    8'hed: out <= 8'haa;
    8'hee: out <= 8'h50;
    8'hef: out <= 8'ha5;
    8'hf0: out <= 8'h03;
    8'hf1: out <= 8'h59;
    8'hf2: out <= 8'h09;
    8'hf3: out <= 8'h1a;
    8'hf4: out <= 8'h65;
    8'hf5: out <= 8'hd7;
    8'hf6: out <= 8'h84;
    8'hf7: out <= 8'hd0;
    8'hf8: out <= 8'h82;
    8'hf9: out <= 8'h29;
    8'hfa: out <= 8'h5a;
    8'hfb: out <= 8'h1e;
    8'hfc: out <= 8'h7b;
    8'hfd: out <= 8'ha8;
    8'hfe: out <= 8'h6d;
    8'hff: out <= 8'h2c;
    endcase
endmodule