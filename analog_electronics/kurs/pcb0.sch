EESchema Schematic File Version 4
EELAYER 30 0
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
L Device:R R1
U 1 1 5ED2455F
P 5750 2100
F 0 "R1" V 5543 2100 50  0000 C CNN
F 1 "1k" V 5634 2100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5680 2100 50  0001 C CNN
F 3 "~" H 5750 2100 50  0001 C CNN
	1    5750 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5ED247B7
P 8050 2900
F 0 "R3" V 7843 2900 50  0000 C CNN
F 1 "160k" V 7934 2900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7980 2900 50  0001 C CNN
F 3 "~" H 8050 2900 50  0001 C CNN
	1    8050 2900
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5ED2497D
P 6600 2650
F 0 "R2" V 6393 2650 50  0000 C CNN
F 1 "4.7k" V 6484 2650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6530 2650 50  0001 C CNN
F 3 "~" H 6600 2650 50  0001 C CNN
	1    6600 2650
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 5ED24BB5
P 5200 3550
F 0 "C4" H 5315 3596 50  0000 L CNN
F 1 "10n" H 5315 3505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 5238 3400 50  0001 C CNN
F 3 "~" H 5200 3550 50  0001 C CNN
	1    5200 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5ED25019
P 8500 2350
F 0 "C3" H 8615 2396 50  0000 L CNN
F 1 "10u" H 8615 2305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 8538 2200 50  0001 C CNN
F 3 "~" H 8500 2350 50  0001 C CNN
	1    8500 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5ED250DE
P 7750 3050
F 0 "C2" H 7865 3096 50  0000 L CNN
F 1 "10n" H 7865 3005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 7788 2900 50  0001 C CNN
F 3 "~" H 7750 3050 50  0001 C CNN
	1    7750 3050
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC547 Q2
U 1 1 5ED254DC
P 8400 2900
F 0 "Q2" H 8591 2946 50  0000 L CNN
F 1 "BC547" H 8591 2855 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8600 2825 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 8400 2900 50  0001 L CNN
	1    8400 2900
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC547 Q1
U 1 1 5ED25D9A
P 6950 2650
F 0 "Q1" H 7141 2696 50  0000 L CNN
F 1 "BC547" H 7141 2605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7150 2575 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 6950 2650 50  0001 L CNN
	1    6950 2650
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D1
U 1 1 5ED26176
P 8850 2350
F 0 "D1" V 8896 2270 50  0000 R CNN
F 1 "1N4148" V 8805 2270 50  0000 R CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8850 2175 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 8850 2350 50  0001 C CNN
	1    8850 2350
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5ED26D53
P 7950 2300
F 0 "J2" H 8058 2481 50  0000 C CNN
F 1 "Amp" H 8058 2390 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7950 2300 50  0001 C CNN
F 3 "~" H 7950 2300 50  0001 C CNN
	1    7950 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5ED283D5
P 5750 3700
F 0 "#PWR0101" H 5750 3450 50  0001 C CNN
F 1 "GND" H 5755 3527 50  0000 C CNN
F 2 "" H 5750 3700 50  0001 C CNN
F 3 "" H 5750 3700 50  0001 C CNN
	1    5750 3700
	1    0    0    -1  
$EndComp
$Comp
L Timer:LM555xN U1
U 1 1 5ED22E63
P 5750 2850
F 0 "U1" H 5950 3300 50  0000 C CNN
F 1 "LM555xN" H 5950 3200 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 6400 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm555.pdf" H 6600 2450 50  0001 C CNN
	1    5750 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2650 5050 2650
Wire Wire Line
	5050 2650 5050 3300
Wire Wire Line
	5050 3300 6350 3300
Wire Wire Line
	6350 3300 6350 3050
Wire Wire Line
	6350 3050 6250 3050
Wire Wire Line
	5250 2850 5200 2850
Wire Wire Line
	5750 3250 5750 3700
Connection ~ 5750 3700
Wire Wire Line
	5200 3700 5750 3700
NoConn ~ 6250 2850
Connection ~ 5050 2650
Wire Wire Line
	5050 2100 5600 2100
Wire Wire Line
	5050 2100 5050 2650
Wire Wire Line
	5900 2100 6350 2100
Wire Wire Line
	6350 2100 6350 2650
Wire Wire Line
	6250 2650 6350 2650
Wire Wire Line
	6450 2650 6350 2650
Connection ~ 6350 2650
$Comp
L Device:C C1
U 1 1 5ED2F843
P 6350 3550
F 0 "C1" H 6465 3596 50  0000 L CNN
F 1 "100n" H 6465 3505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 6388 3400 50  0001 C CNN
F 3 "~" H 6350 3550 50  0001 C CNN
	1    6350 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3700 6350 3700
Wire Wire Line
	6350 3400 6350 3300
Connection ~ 6350 3300
Wire Wire Line
	7050 2450 7050 2400
Wire Wire Line
	7050 2900 7050 2850
Wire Wire Line
	7050 2900 7750 2900
Wire Wire Line
	7750 3200 7750 3700
Wire Wire Line
	7750 3700 7050 3700
Connection ~ 6350 3700
Wire Wire Line
	8500 2700 8500 2500
Wire Wire Line
	7750 2900 7900 2900
Connection ~ 7750 2900
Wire Wire Line
	8150 2400 8150 2500
Wire Wire Line
	8150 2500 8500 2500
Connection ~ 8500 2500
Wire Wire Line
	8850 2500 8500 2500
Wire Wire Line
	8850 2200 8500 2200
Wire Wire Line
	8150 2200 8150 2300
Connection ~ 8500 2200
Wire Wire Line
	8500 2200 8150 2200
Wire Wire Line
	8500 3100 8500 3700
Wire Wire Line
	8500 3700 7750 3700
Connection ~ 7750 3700
$Comp
L Device:L Lx1
U 1 1 5ED438B8
P 7050 3050
F 0 "Lx1" H 7103 3096 50  0000 L CNN
F 1 "L" H 7103 3005 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7050 3050 50  0001 C CNN
F 3 "~" H 7050 3050 50  0001 C CNN
	1    7050 3050
	1    0    0    -1  
$EndComp
Connection ~ 7050 2900
Wire Wire Line
	7050 3200 7050 3700
Connection ~ 7050 3700
Wire Wire Line
	7050 3700 6350 3700
Wire Wire Line
	5750 2300 4850 2300
Wire Wire Line
	5200 3700 4750 3700
Connection ~ 5200 3700
$Comp
L Connector:Conn_01x02_Male JV1
U 1 1 5ED26F19
P 4550 2300
F 0 "JV1" H 4658 2481 50  0000 C CNN
F 1 "Vcc" H 4658 2390 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4550 2300 50  0001 C CNN
F 3 "~" H 4550 2300 50  0001 C CNN
	1    4550 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2300 5750 2450
Wire Wire Line
	4750 2300 4750 1800
Wire Wire Line
	4750 1800 6900 1800
Wire Wire Line
	7050 1800 7050 2100
Connection ~ 4750 2300
Wire Wire Line
	7050 1800 8500 1800
Wire Wire Line
	8500 1800 8500 2200
Connection ~ 7050 1800
$Comp
L Device:R_POT Rk1
U 1 1 5ED276F4
P 7050 2250
F 0 "Rk1" H 6980 2296 50  0000 R CNN
F 1 "R_POT" H 6980 2205 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3296X_Horizontal" H 7050 2250 50  0001 C CNN
F 3 "~" H 7050 2250 50  0001 C CNN
	1    7050 2250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6900 1800 6900 2250
Connection ~ 6900 1800
Wire Wire Line
	6900 1800 7050 1800
Wire Wire Line
	5200 2850 5200 3400
Wire Wire Line
	4750 2400 4750 3700
Wire Wire Line
	5250 3050 4850 3050
Wire Wire Line
	4850 3050 4850 2300
Connection ~ 4850 2300
Wire Wire Line
	4850 2300 4750 2300
$EndSCHEMATC
