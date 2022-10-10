# Staircase-Wave-Generation
Staircase wave generation using Mixed Signals
# Design of Staircase wave generation using Mixed Signals

#### This repository presents the Design of Staircase wave generation using Mixed Signals .Generation of Staircase waveform is done by using an Opensource EDA Tool called eSim, an Opensource Spice Simulator called ngspice. Verilog code is designed in opensource Verilog Environment called Makerchip.


## Table of Contents
#### 1.[ABSTRACT]
#### 2.[SOFTWARE USED]
#### 3.[CIRCUIT DESIGN]
#### 4.[IMPLEMENTATION]
#### 7.[REFERENCES]
#### 8.[AKNOWLEDGEMENT]

### 1. ABSTRACT
       The staircase wave is generated using mixed signals.lA digital circuit is constructed which can provide logic level output for a staircase generation An analog signal is applied for a summing amplifier, that adds all the digital outputs and produce staircase output.The staircase waveform is used to test a television display to ensure proper operation of the display throughout the gray scale range from white to black.
### 2. SOFTWARE USED

### eSIM EDA TOOL

eSim is an open source EDA tool for circuit design, simulation and analysis , developed by FOSSEE Team at IIT Bombay. It is an integrated tool build using open source softwares such as KiCad, Ngspice and GHDL.
More details on eSIM tool can be found [here](https://esim.fossee.in/)

### Makerchip

Makerchip is an opensource tool for developing verilog code for the digital circuits and simulate it. By using using eSim and makerchip we can develop model for our selected digital circuit.
More details on Makerchip can be found [here](https://www.makerchip.com/)

### Verilator
It is a tool which converts Verilog code to C++ objects. 
More details on verilator can be found [here](https://www.veripool.org/verilator/)

 ### 3. CIRCUIT DESIGN
 
#### Staircase Logic:
     The staircase logic block provides the logic and  converts the digital data into equivalent pulses. This output is sent to the succeeding analog circuit. The analog circuit considered is the summing amplifier. The staircase pulse increases every time the digital block is triggered using the pulse source and reset once the MSB is set to one.

#### Staircase Wave Generation using Mixed Signals:

        Staircase Waveform circuit is built using a digital logic block with output 0001, 0011, 0111, 1111, for a 4 level stairs circuit. The digital output is mapped to an analog voltage pulses to make it work with the analog circuit. Using positive logic, 1 is mapped to 1Volt and 0 is mapped to 0Volts. The pulse signal which is given as clock to the digital block is analog in nature which is converted to logic bits before the digital realization is made.
       The next circuit is a summing amplifier (Inverting Negative Feedback) realized using Operational Amplifier. There are four output pins from the digital block, we the summing amplifier adds four different voltages. The four output from the digital logic block is applied to the inverting terminal of the opamp  using equal resistances.


#### Reference Circuit


![image](https://user-images.githubusercontent.com/115364443/194894929-7afd1cd8-fd46-43f0-a09f-fa16e453a496.png)


#### Reference Waveforms

![image](https://user-images.githubusercontent.com/115364443/194895023-19943bbc-a240-4a89-baf4-1647be913a8e.png)


### 4. IMPLEMENTATION

#### Verilog Code for Generation of Staircase Waveform
```
\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/ /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/ /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/   

//Your Verilog/System Verilog Code Starts Here:
//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:18:19 10/08/2022 
// Design Name: 
// Module Name:    Staircase_logic 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
	 
	 // Shreya_Umarani Staircase Logic

module Shreya_Staircase_logic(input clk,
			output reg[3:0] num);

	always @ (posedge clk) begin
		if(num[3] == 1)
			num <= 0;
		else
			num <= num + num + 1;
   	end

endmodule


//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic [3:0] ;//output
//The $random() can be replaced if user wants to assign values
		Shreya_Staircase_logic Shreya_Staircase_logic(.clk(clk), .num(num));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule






```
#### Makerchip Plots

![Makerchip_op](https://user-images.githubusercontent.com/115364443/194897544-32354f9b-40a9-43e6-800a-192d6f0dc4d0.png)

#### Schematic Diagram
![Staircase_Schematic](https://user-images.githubusercontent.com/115364443/194898013-4e0cb5e3-f08b-43a3-8e50-c738c04641dc.jpg)


#### Netlists
```
* c:\users\lenovo\esim-workspace\staircase\staircase.cir

.include avsd_opamp.sub
.include "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__diode_pw2nd_11v0.model.spice"
.include "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__pnp.model.spice"
.include "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__r+c.model.spice"
.include "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__diode_pd2nw_11v0.model.spice"
.lib "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130.lib.spice" tt
.include "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__inductors.model.spice"
.include "C:\FOSSEE\eSim\library\sky130_fd_pr\models\sky130_fd_pr__model__linear.model.spice"
* u1 net-_u1-pad1_ net-_u1-pad2_ net-_u1-pad3_ net-_u1-pad4_ net-_u1-pad5_ shreya_staircase_logic
v1 net-_u2-pad1_ gnd pulse(0 5 0.1m 0.1m 0.1m 1 2)
* u2 net-_u2-pad1_ net-_u1-pad1_ adc_bridge_1
* u3 net-_u1-pad2_ net-_u1-pad3_ net-_u1-pad4_ net-_u1-pad5_ net-_sc3-pad1_ net-_sc6-pad1_ net-_sc4-pad1_ net-_sc5-pad1_ dac_bridge_4
xsc3 net-_sc3-pad1_ net-_sc3-pad2_ net-_sc1-pad3_ sky130_fd_pr__res_generic_pd W=1 L=52
xsc6 net-_sc6-pad1_ net-_sc3-pad2_ net-_sc1-pad3_ sky130_fd_pr__res_generic_pd W=1 L=52
xsc4 net-_sc4-pad1_ net-_sc3-pad2_ net-_sc1-pad3_ sky130_fd_pr__res_generic_pd W=1 L=52
xsc5 net-_sc5-pad1_ net-_sc3-pad2_ net-_sc1-pad3_ sky130_fd_pr__res_generic_pd W=1 L=52
v2 net-_sc1-pad3_ gnd dc 5
x2 net-_x2-pad1_ net-_x2-pad2_ gnd net-_sc3-pad2_ op gnd avsd_opamp
xsc7 net-_sc3-pad2_ op net-_sc1-pad3_ sky130_fd_pr__res_generic_pd W=1 L=5.2
x1 net-_x1-pad1_ net-_x1-pad2_ gnd net-_sc1-pad2_ out gnd avsd_opamp
xsc1 op net-_sc1-pad2_ net-_sc1-pad3_ sky130_fd_pr__res_generic_pd W=1 L=5.2
xsc2 net-_sc1-pad2_ out net-_sc1-pad3_ sky130_fd_pr__res_generic_pd W=1 L=5.2
* u5 op plot_v1
* u4 out plot_v1
* s c m o d e
v4 net-_x2-pad1_ net-_x2-pad2_ dc 5
v3 net-_x1-pad1_ net-_x1-pad2_ dc 5
a1 [net-_u1-pad1_ ] [net-_u1-pad2_ net-_u1-pad3_ net-_u1-pad4_ net-_u1-pad5_ ] u1
a2 [net-_u2-pad1_ ] [net-_u1-pad1_ ] u2
a3 [net-_u1-pad2_ net-_u1-pad3_ net-_u1-pad4_ net-_u1-pad5_ ] [net-_sc3-pad1_ net-_sc6-pad1_ net-_sc4-pad1_ net-_sc5-pad1_ ] u3
* Schematic Name: shreya_staircase_logic, NgSpice Name: shreya_staircase_logic
.model u1 shreya_staircase_logic(rise_delay=1.0e-9 fall_delay=1.0e-9 input_load=1.0e-12 instance_id=1 ) 
* Schematic Name: adc_bridge_1, NgSpice Name: adc_bridge
.model u2 adc_bridge(in_low=1.0 in_high=2.0 rise_delay=1.0e-9 fall_delay=1.0e-9 ) 
* Schematic Name: dac_bridge_4, NgSpice Name: dac_bridge
.model u3 dac_bridge(out_low=0.0 out_high=5.0 out_undef=0.5 input_load=1.0e-12 t_rise=1.0e-9 t_fall=1.0e-9 ) 
.tran 0.1e-00 20e-00 0e-00

* Control Statements 
.control
run
print allv > plot_data_v.txt
print alli > plot_data_i.txt
plot v(op)
plot v(out)
.endc
.end

```
#### Ngspice waveform

![shreya_staircase_1 (1)](https://user-images.githubusercontent.com/115364443/194898941-706a104c-695c-4a18-a33d-8809274ba62c.jpg)


### 5. Steps to generate NgVeri Model
1. Open eSim
2. Run NgVeri-Makerchip
3. Add top level verilog file in Makerchip Tab
4. click on Edit in makerchip to simulate the verilog code
5. Click on NgVeri tab
6. Add dependency files(If any)
7. Click on Run Verilog to NgSpice Converter
8. Debug if any errors
9. Model created successfully

### 6. Steps to run the project
1. Open new terminal
2. Clone this project using the following command:
```
git clone https://github.com/Shreya Umarani/Staircase-Wave-Generation.git
```
3. Change Directory: 
```
cd esim-workspace/Staircase-Wave-Generation
```
4. Run Ngspice:
```
ngspice Staircase-Wave-Generation.cir.out
```
5. To run the project in eSim:
* Run eSim
* Load the project
* Open eeSchema

### 7. REFERENCES
[1]	https://en.wikipedia.org/wiki/Mixed-signal_integrated_circuit
[2]	https://www.encyclopedia.com/computing/dictionaries-thesauruses-pictures-and-press-releases/staircase-waveform
[3]	Multilevel converters-a new breed of power converters, JS Lai, FZ Peng 


### 8. AKNOWLEDGEMENT
1. FOSSEE, IIT Bombay
2. Steve Hoover, Founder, Redwood EDA
3. [Kunal Ghosh](https://github.com/kunalg123), Co-founder of VLSI System Design (VSD) Corp. Pvt. Ltd.
4. [Sumanto kar](https://github.com/Eyantra698Sumanto), Sr. Project Technical Assistant, IIT BOMBAY

### 9. AUTHOR

Shreya Umarani, 7th SEM B.E(ECE), SDM COLLEGE OF ENGINEERING AND TECHNOLOGY,DHARWAD-580002 
* Contact: umaranishreya@gmail.com
