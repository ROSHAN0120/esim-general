EESchema Schematic File Version 2
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:power
LIBS:eSim_Plot
LIBS:transistors
LIBS:conn
LIBS:eSim_User
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:eSim_Analog
LIBS:eSim_Devices
LIBS:eSim_Digital
LIBS:eSim_Hybrid
LIBS:eSim_Miscellaneous
LIBS:eSim_Power
LIBS:eSim_Sources
LIBS:eSim_Subckt
LIBS:eSim_Nghdl
LIBS:eSim_Ngveri
LIBS:clkdivider-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L pulse v1
U 1 1 646A3763
P 2600 4050
F 0 "v1" H 2400 4150 60  0000 C CNN
F 1 "pulse" H 2400 4000 60  0000 C CNN
F 2 "R1" H 2300 4050 60  0000 C CNN
F 3 "" H 2600 4050 60  0000 C CNN
	1    2600 4050
	1    0    0    -1  
$EndComp
$Comp
L pulse v2
U 1 1 646A37AA
P 3100 4150
F 0 "v2" H 2900 4250 60  0000 C CNN
F 1 "pulse" H 2900 4100 60  0000 C CNN
F 2 "R1" H 2800 4150 60  0000 C CNN
F 3 "" H 3100 4150 60  0000 C CNN
	1    3100 4150
	1    0    0    -1  
$EndComp
$Comp
L adc_bridge_2 U5
U 1 1 646A3801
P 4300 3650
F 0 "U5" H 4300 3650 60  0000 C CNN
F 1 "adc_bridge_2" H 4300 3800 60  0000 C CNN
F 2 "" H 4300 3650 60  0000 C CNN
F 3 "" H 4300 3650 60  0000 C CNN
	1    4300 3650
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U1
U 1 1 646A3840
P 2800 3450
F 0 "U1" H 2800 3950 60  0000 C CNN
F 1 "plot_v1" H 3000 3800 60  0000 C CNN
F 2 "" H 2800 3450 60  0000 C CNN
F 3 "" H 2800 3450 60  0000 C CNN
	1    2800 3450
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U2
U 1 1 646A388A
P 3400 3450
F 0 "U2" H 3400 3950 60  0000 C CNN
F 1 "plot_v1" H 3600 3800 60  0000 C CNN
F 2 "" H 3400 3450 60  0000 C CNN
F 3 "" H 3400 3450 60  0000 C CNN
	1    3400 3450
	1    0    0    -1  
$EndComp
$Comp
L dac_bridge_1 U6
U 1 1 646A3908
P 7350 3650
F 0 "U6" H 7350 3650 60  0000 C CNN
F 1 "dac_bridge_1" H 7350 3800 60  0000 C CNN
F 2 "" H 7350 3650 60  0000 C CNN
F 3 "" H 7350 3650 60  0000 C CNN
	1    7350 3650
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U3
U 1 1 646A3949
P 8150 3650
F 0 "U3" H 8150 4150 60  0000 C CNN
F 1 "plot_v1" H 8350 4000 60  0000 C CNN
F 2 "" H 8150 3650 60  0000 C CNN
F 3 "" H 8150 3650 60  0000 C CNN
	1    8150 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3600 3700 3600
Wire Wire Line
	3100 3700 3700 3700
Wire Wire Line
	4850 3600 5100 3600
Wire Wire Line
	5100 3700 4850 3700
Wire Wire Line
	7900 3600 8150 3600
Wire Wire Line
	8150 3600 8150 3450
Wire Wire Line
	2800 3250 2800 3600
Connection ~ 2800 3600
Wire Wire Line
	3400 3250 3400 3700
Connection ~ 3400 3700
$Comp
L GND #PWR01
U 1 1 646A3BAD
P 3100 4750
F 0 "#PWR01" H 3100 4500 50  0001 C CNN
F 1 "GND" H 3100 4600 50  0000 C CNN
F 2 "" H 3100 4750 50  0001 C CNN
F 3 "" H 3100 4750 50  0001 C CNN
	1    3100 4750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 646A3BD7
P 2600 4600
F 0 "#PWR02" H 2600 4350 50  0001 C CNN
F 1 "GND" H 2600 4450 50  0000 C CNN
F 2 "" H 2600 4600 50  0001 C CNN
F 3 "" H 2600 4600 50  0001 C CNN
	1    2600 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4600 3100 4750
Wire Wire Line
	2600 4500 2600 4600
$Comp
L PWR_FLAG #FLG03
U 1 1 646A3E1A
P 3150 4700
F 0 "#FLG03" H 3150 4775 50  0001 C CNN
F 1 "PWR_FLAG" H 3150 4850 50  0000 C CNN
F 2 "" H 3150 4700 50  0001 C CNN
F 3 "" H 3150 4700 50  0001 C CNN
	1    3150 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 4700 3100 4700
Connection ~ 3100 4700
Text GLabel 2650 3600 0    60   Input ~ 0
rst
Text GLabel 3250 3700 0    60   Input ~ 0
clk
Text GLabel 8150 3600 2    60   Input ~ 0
clko
$Comp
L clkdivider U4
U 1 1 646AF35A
P 2950 5500
F 0 "U4" H 5800 7300 60  0000 C CNN
F 1 "clkdivider" H 5800 7500 60  0000 C CNN
F 2 "" H 5800 7450 60  0000 C CNN
F 3 "" H 5800 7450 60  0000 C CNN
	1    2950 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3600 6500 3600
$EndSCHEMATC
