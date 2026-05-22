-- MiG-29-Fulcrum export for DCS-ExportScript
-- Structure and style follow A-10C_2.lua
-- Version 1.0.0

ExportScript = ExportScript or {}
ExportScript.Version = ExportScript.Version or {}
ExportScript.FoundDCSModule = true
ExportScript.Version.MiG29 = "1.0.0"
ExportScript.ModuleName = "MiG-29 Fulcrum"

-- Formats:
--  - Lamps/flags: "%.f" or "%1.0f"
--  - Discrete switches: "%.1f"
--  - Continuous axes: "%.2f" / "%.3f"
--  - Gauges/needles/drums: "%.4f" (or per need)

-------------------------------------------------------
-- Every-frame exported arguments (from mainpanel_init)
-------------------------------------------------------
ExportScript.ConfigEveryFrameArguments = {

        -- Internal lights (panel illumination)
    [600] = "%.f", -- FloodLight lamp
    [601] = "%.f", -- MapLight lamp
    [801] = "%.f", -- InstrumentLight lamp
    [800] = "%.f", -- ConsoleLight lamp
    [802] = "%.f", -- Compass Light
    
    -- Warning lights (annunciators)
    [445] = "%.f", -- MASTER_CAUTION
    [383] = "%.f", -- LOCK_CANOPY
    [341] = "%.f", -- LH_ENG_FIRE
    [342] = "%.f", -- RH_ENG_FIRE
    [340] = "%.f", -- GBX_FIRE
    [345] = "%.f", -- OIL_PRESS_LEFT
    [343] = "%.f", -- REDUCED_RPM_LH_ENG
    [346] = "%.f", -- OIL_PRESS_RIGHT
    [344] = "%.f", -- REDUCED_RPM_RH_ENG
    [350] = "%.f", -- COC_FAIL
    [352] = "%.f", -- DAMPER_OFF
    [348] = "%.f", -- KG_550_REMAIN
    [399] = "%.f", -- NO_COC_RESERVE
    [389] = "%.f", -- TRANSFM_FAIL
    [347] = "%.f", -- OIL_GBX
    [349] = "%.f", -- DOUBLE_HYD_SYS
    [378] = "%.f", -- EXPLOSION
    [386] = "%.f", -- ENABLE_RESERVE
    [384] = "%.f", -- FAIL_CPO
    [362] = "%.f", -- EMERG_HYD_PUMP_ON
    [381] = "%.f", -- FEEL_UNIT_OK
    [355] = "%.f", -- LH_ENG_AB
    [356] = "%.f", -- RH_ENG_AB
    [379] = "%.f", -- LH_ENG_START
    [380] = "%.f", -- RH_ENG_START
    [397] = "%.f", -- LH_INLET_CHECK
    [398] = "%.f", -- RH_INLET_CHECK
    [357] = "%.f", -- RUD_TRIM_NEUTRAL
    [359] = "%.f", -- FEEL_UNIT_TO_LD
    [367] = "%.f", -- MARKER_BEACON
    [364] = "%.f", -- BEACON_INNER
    [360] = "%.f", -- AIL_TRIM_NEUTRAL
    [358] = "%.f", -- STAB_TRIM_NEUTRAL
    [387] = "%.f", -- NAV_READY
    [388] = "%.f", -- FAST_PREP
    [363] = "%.f", -- REQUEST
    [365] = "%.f", -- RADAR_EMISSION
    [366] = "%.f", -- FLARE_DISPENSING
    [385] = "%.f", -- FLARE_READY
    [390] = "%.f", -- INT_KD
    [391] = "%.f", -- INT_KP
    [49]  = "%.f", -- LEVELING_LIGHT
    
    -- Landing panel lights
    [44]  = "%.f", -- SPEEDBRAKERS_U
    [45]  = "%.f", -- SPEEDBRAKERS_D
    [320] = "%.f", -- LEF_L
    [321] = "%.f", -- LEF_R
    [42]  = "%.f", -- FLAPS_L_TO
    [56]  = "%.f", -- FLAPS_L_LD
    [43]  = "%.f", -- FLAPS_R_TO
    [57]  = "%.f", -- FLAPS_R_LD
    [39]  = "%.f", -- MAIN_LANDING_GEAR_L
    [41]  = "%.f", -- MAIN_LANDING_GEAR_R
    [40]  = "%.f", -- NOSE_LANDING_GEAR
    [46]  = "%.f", -- RED_LIGHT
    
    -- AFCS panel lights (modes state)
    [83]  = "%.f", -- AFCS_PNL_DAMPER
    [85]  = "%.f", -- AFCS_PNL_AUTO_RECOVER
    [87]  = "%.f", -- AFCS_PNL_ALT_HOLD
    [89]  = "%.f", -- AFCS_PNL_ATT_HOLD
    [91]  = "%.f", -- AFCS_PNL_APPROACH
    [93]  = "%.f", -- AFCS_PNL_MISSED_APPROACH
    
    -- HSI covers (missed earlier)
    [404] = "%.f", -- HSI BearingCover
    
    -- Clock
    [19]  = "%.4f",  -- ClockCurrentHours
    [18]  = "%.4f",  -- ClockCurrentMinutes
    [37]  = "%.4f",  -- ClockCurrentSeconds
    [395] = "%.4f",  -- ClockFlightHours
    [396] = "%.4f",  -- ClockFlightMinutes
    [394] = "%.4f",  -- ClockStopWatchMinutes
    [406] = "%.4f",  -- ClockStopWatchSeconds
    [58]  = "%.1f",  -- ClockStatusWindow

    -- Barometric Altimeter (metric)
    [10]  = "%.4f",  -- BaroAltimeterPointerM
    [11]  = "%.4f",  -- BaroAltimeterPointerKm
    [461] = "%.4f",  -- BaroAltimeterAltitude10000
    [460] = "%.4f",  -- BaroAltimeterAltitude01000
    [464] = "%.4f",  -- BaroAltimeterPressure001
    [463] = "%.4f",  -- BaroAltimeterPressure010
    [462] = "%.4f",  -- BaroAltimeterPressure100

    -- Barometric Altimeter (imperial)
    [822] = "%.4f",  -- ImperialBaroAltimeterPointer
    [830] = "%.4f",  -- ImperialAlt_1000
    [831] = "%.4f",  -- ImperialAlt_0100
    [832] = "%.4f",  -- ImperialAlt_0010
    [833] = "%.4f",  -- ImperialAlt_0001
    [834] = "%.4f",  -- ImperialPress_1000
    [835] = "%.4f",  -- ImperialPress_0100
    [836] = "%.4f",  -- ImperialPress_0010
    [837] = "%.4f",  -- ImperialPress_0001

    -- EGT
    [12]  = "%.4f",  -- EgtPointerLeft
    [14]  = "%.4f",  -- EgtPointerRight

    -- RPM
    [16]  = "%.4f",  -- RpmPointerLeft
    [17]  = "%.4f",  -- RpmPointerRight

    -- Fuel Indicator (lamps + quantity + drums)
    [221] = "%.f",   -- FuelLedCL
    [217] = "%.f",   -- FuelLedWing
    [218] = "%.f",   -- FuelLedTank3
    [220] = "%.f",   -- FuelLedTank1
    [63]  = "%.f",   -- FuelLedT
    [64]  = "%.f",   -- FuelLedP
    [62]  = "%.f",   -- FuelLedTEK
    [66]  = "%.f",   -- FuelLedOPT
    [22]  = "%.4f",  -- FuelIndQuantity
    [227] = "%.4f",  -- FuelDrum001
    [226] = "%.4f",  -- FuelDrum010
    [225] = "%.4f",  -- FuelDrum100

    -- Combined Pressure
    [304] = "%.4f",  -- CombPresCommon
    [305] = "%.4f",  -- CombPresBoost
    [306] = "%.4f",  -- CombPresMain
    [307] = "%.4f",  -- CombPresEmerg

    -- Brake Pressure
    [124] = "%.4f",  -- BrakePresLeft
    [125] = "%.4f",  -- BrakePresRight

    -- IAS (metric)
    [8]   = "%.4f",  -- IASpointer
    [5]   = "%.4f",  -- IASwindow

    -- IAS (imperial)
    [821] = "%.4f",  -- ImperialIASpointer
    [820] = "%.4f",  -- ImperialIASwindow

    -- TAS / Mach (metric)
    [182] = "%.4f",  -- TASpointer
    [79]  = "%.4f",  -- Mpointer

    -- TAS / Mach (imperial)
    [823] = "%.4f",  -- ImperialTASpointer
    [825] = "%.4f",  -- ImperialMpointer
    [824] = "%.4f",  -- ImperialMwindow

    -- AOA / G meter
    [7]   = "%.4f",  -- AOApointer
    [6]   = "%.4f",  -- Gpointer
    [3]   = "%.4f",  -- GpointerMAX

    -- ADI
    [262] = "%.f",   -- AdiLedCage
    [81]  = "%.4f",  -- AdiPitch
    [30]  = "%.4f",  -- AdiBank
    [31]  = "%.4f",  -- AdiSlipBall
    [392] = "%.4f",  -- AdiGlideSlopeDeviation
    [393] = "%.4f",  -- AdiCourseDeviation
    [27]  = "%.4f",  -- AdiCourseSteering
    [94]  = "%.f",   -- AdiPitchOffFlag
    [96]  = "%.f",   -- AdiAzimuthOffFlag

    -- HSI
    [32]  = "%.4f",  -- HSI CompassCard
    [35]  = "%.4f",  -- HSI CoursePointer
    [36]  = "%.4f",  -- HSI BearingPointer
    [33]  = "%.4f",  -- HSI GlideSlope
    [34]  = "%.4f",  -- HSI CourseDeviation
    [111] = "%.4f",  -- HSI Range 100
    [112] = "%.4f",  -- HSI Range 010
    [113] = "%.4f",  -- HSI Range 001
    [400] = "%.4f",  -- HSI BearingCounter110
    [401] = "%.4f",  -- HSI BearingCounter001
    [121] = "%.f",   -- HSI CourseOffFlag
    [122] = "%.f",   -- HSI GlideSlopeOffFlag
    [402] = "%.f",   -- HSI OffFlag
    [403] = "%.f",   -- HSI RangeCover
    -- HSI (imperial drums)
    [826] = "%.4f",
    [827] = "%.4f",
    [828] = "%.4f",

    -- VVI / Turn / Slip (metric)
    [24]  = "%.4f",  -- VVI
    [25]  = "%.4f",  -- Turn
    [26]  = "%.4f",  -- SlipBall

    -- VVI / Turn (imperial)
    [838] = "%.4f",  -- Imperial VVI
    [839] = "%.4f",  -- Imperial Turn

    -- Ramps Position
    [443] = "%.4f",  -- RampPositionLeft
    [444] = "%.4f",  -- RampPositionRight

    -- Voltmeter
    [308] = "%.4f",  -- Voltmeter

    -- Radar Altimeter (metric + lamps)
    [9]   = "%.4f",  -- RadarAltimeterAltitude
    [13]  = "%.f",   -- RadarAltimeterValid
    [405] = "%.4f",  -- RadarAltimeterDangerousAlt
    [170] = "%.f",   -- RadarAltimeterDangerousLight
    -- Radar Altimeter (imperial)
    [849] = "%.4f",  -- Imperial Altitude
    [850] = "%.4f",  -- Imperial DangerousAlt

    -- Combined Oxygen Indicator
    [300] = "%.4f",  -- OxygenAltitude
    [301] = "%.4f",  -- OxygenReserve
    [302] = "%.4f",  -- OxygenConsumption
    [303] = "%.4f",  -- OxygenDeltaPressure

    -- Flares Indicator
    [38]  = "%.4f",  -- FlaresCount

    -- Navigation Control Panel (lamps + windows)
    [607] = "%.f",  -- Light_WP_AD_1 (WP-A/D 1 lamp)
    [311] = "%.f",  -- Light_WP_AD_2 (WP-A/D 2 lamp)
    [312] = "%.f",  -- Light_WP_AD_3 (WP-A/D 3 lamp)
    [313] = "%.f",  -- Light_Beacon_1 (BEACON 1 lamp)
    [314] = "%.f",  -- Light_Beacon_2 (BEACON 2 lamp)
    [315] = "%.f",  -- Light_Beacon_3 (BEACON 3 lamp)
    [316] = "%.f",  -- Light_Reset (RESET lamp)
    [317] = "%.f",  -- Light_CourseCmptrZero (COURSE CMPTR ZERO lamp)
    [318] = "%.f",  -- Light_Return (RETURN lamp)
    [433] = "%.f",  -- Light_D40_Window (D40 window lamp)
    [434] = "%.f",  -- Light_Corr_Window (CORR window lamp)
    [418] = "%.4f", -- RSBN_1000_Window (RSBN 1000s drum)
    [419] = "%.4f", -- RSBN_0100_Window (RSBN 100s drum)
    [420] = "%.4f", -- RSBN_0010_Window (RSBN 10s drum)
    [421] = "%.4f", -- RSBN_0001_Window (RSBN 1s drum)
    [422] = "%.4f", -- ILS_10_Window (ILS tens drum)
    [423] = "%.4f", -- ILS_01_Window (ILS ones drum)

    -- Ekran lamps
    [231] = "%.f",   -- Ekran_Fail
    [232] = "%.f",   -- Ekran_Queue
    [233] = "%.f",   -- Ekran_Memory

    -- Canopy and misc
    [811] = "%.f",   -- CanopyHandleLock
    [181] = "%.4f",  -- Canopy (value)
    [180] = "%.f",   -- CanopyLock

    [284] = "%.4f",  -- RadioChannelR862 (window)
    [4]   = "%.4f",  -- Vibration_1
    [20]  = "%.4f",  -- SKAB
    [531] = "%.4f",  -- HDD_light
    [1]   = "%.4f",  -- Units
    [103] = "%.4f",  -- AvionicsLanguage
}

-----------------------------------------------------------
-- Low-frequency exported clickable arguments (clickables)
-----------------------------------------------------------
ExportScript.ConfigArguments = {
    -- HUD
    [536] = "%.2f", -- HUD Brightness | HUD | LEV
    [535] = "%.1f", -- HUD Mode DAY/NIGHT/RETICLE | HUD | TUMB
    [534] = "%.1f", -- HUD Test Button | HUD | BTN
    [50]  = "%.1f", -- HUD Filter Erect/Remove | HUD | TUMB

    -- HDD
    [530] = "%.2f", -- CRT Brightness | HDD | LEV
    [869] = "%.1f", -- HDD SOURCE TACTICAL/DUPLICATION | HDD | TUMB

    -- PSR-31 / Input Panel
    [520] = "%.2f", -- SPAN Knob | INPUT_PANEL | LEV
    [523] = "%.1f", -- WCS Modes Selector | INPUT_PANEL | TUMB
    [525] = "%.1f", -- Zone LEFT/CENTER/RIGHT | INPUT_PANEL | TUMB
    [524] = "%.2f", -- IR GAIN/HELM BRIGHT | INPUT_PANEL | LEV
    [526] = "%.1f", -- MASTER ARM ARM/SAVE | INPUT_PANEL | TUMB
    [521] = "%.1f", -- Burst Mode | WP | TUMB
    [527] = "%.1f", -- Preparation MANUAL/AUTO | INPUT_PANEL | TUMB

    -- PU-S31
    [286] = "%.1f", -- AIR/GROUND | INPUT_PANEL | TUMB
    [289] = "%.1f", -- GUID Switch | INPUT_PANEL | TUMB
    [287] = "%.1f", -- COOP DRAG/N DRAG | INPUT_PANEL | TUMB

    -- RH Cabin
    [555] = "%.2f", -- CABIN TEMP group selector (composite) | AIR_INTERFACE | TUMB
    [254] = "%.1f", -- Air Lever OPEN/PILOT | AIR_INTERFACE | TUMB
    [246] = "%.1f", -- Cabin Air Lever OPEN/CLOSED | AIR_INTERFACE | TUMB
    [76]  = "%.1f", -- Canopy Emergency Jettison Handle | CPT_MECH | BTN

    -- LH
    [810] = "%.2f", -- Canopy Handle OPEN/TAXI/CLOSE | AIR_INTERFACE | TUMB
    [247] = "%.1f", -- Emergency Decompression PRESSURE/DECOMP | AIR_INTERFACE | TUMB
    [108] = "%.1f", -- Suit Vent ON/OFF | AIR_INTERFACE | TUMB
    [109] = "%.2f", -- Suit Vent COLD/HOT | AIR_INTERFACE | LEV
    [95]  = "%.1f", -- Emergency Missile Jettison | WP | BTN
    [290] = "%.1f", -- Bombs Jettison ARM | WP | TUMB
    [292] = "%.1f", -- Bombs/NURS Emergency Jettison | WP | BTN
    [291] = "%.1f", -- Bombs/NURS Jettison Button Cover | WP | TUMB
    [29]  = "%.1f", -- External Stores INBD/OUTBD | WP | TUMB

    -- Oxygen Control
    [106] = "%.1f", -- Oxygen Flow Valve | AIR_INTERFACE | TUMB
    [115] = "%.1f", -- O2 MIX/100% | AIR_INTERFACE | TUMB
    [117] = "%.1f", -- O2 Emergency ON/OFF | AIR_INTERFACE | TUMB
    [119] = "%.1f", -- HELM VENT ON/OFF | AIR_INTERFACE | TUMB

    -- Center
    [114] = "%.2f", -- Cabin Temperature Control Knob | AIR_INTERFACE | LEV
    [131] = "%.1f", -- Pitot Selector MAIN/STBY | SNSR_SYS_INTERFACE | TUMB
    [558] = "%.1f", -- Pitot Heat ON/OFF | SNSR_SYS_INTERFACE | TUMB

    -- Flares
    [143] = "%.1f", -- FLAREs Emergency Jettison | WP | BTN
    [140] = "%.1f", -- FLAREs Program GROUND/FHS/RHS | WP | TUMB

    -- Ejection
    [68]  = "%.1f", -- Ejection Handle (press) | CPT_MECH | BTN
    [67]  = "%.1f", -- Ejection Handle ARM/SAFE | CPT_MECH | TUMB

    -- External Lights
    [178] = "%.1f", -- LAND/TAXI/OFF | EXTLIGHTS_SYSTEM | TUMB
    [574] = "%.2f", -- NAV LTS Vert (FLASH/OFF) | EXTLIGHTS_SYSTEM | TUMB
    [548] = "%.2f", -- NAV LTS Hor (100%/10%) | EXTLIGHTS_SYSTEM | TUMB

    -- Internal Lights
    [546] = "%.1f", -- Lamp Test | INTLIGHTS_SYSTEM | BTN
    [97]  = "%.1f", -- Master Caution (press) | INTLIGHTS_SYSTEM | BTN
    [453] = "%.2f", -- Master Caution Brightness | INTLIGHTS_SYSTEM | LEV
    [549] = "%.2f", -- Floodlight | INTLIGHTS_SYSTEM | LEV
    [545] = "%.2f", -- LTS ILLUM BRIGHT | INTLIGHTS_SYSTEM | LEV
    [541] = "%.2f", -- MAP ILLUM | INTLIGHTS_SYSTEM | LEV
    [543] = "%.1f", -- INSTRUMENT Control Knob | INTLIGHTS_SYSTEM | TUMB
    [542] = "%.1f", -- CONSOLE Control Knob | INTLIGHTS_SYSTEM | TUMB
    [110] = "%.1f", -- PANEL Pull Auto/Manual (press) | INTLIGHTS_SYSTEM | BTN
    [540] = "%.2f", -- PANEL Manual Brightness | INTLIGHTS_SYSTEM | LEV

    -- Ekran
    [184] = "%.1f", -- EKRAN CALL | EKRAN | BTN

    -- Radar Altimeter
    [137] = "%.2f", -- RAD ALT Min Height | RADALT | LEV
    [138] = "%.1f", -- RAD ALT Test | RADALT | BTN

    -- Clock
    [278] = "%.1f", -- Clock Left Lever Down/Up (press) | CLOCK | BTN
    [277] = "%.2f", -- Clock Left Lever Rotate | CLOCK | LEV
    [280] = "%.1f", -- Clock Right Lever Down (press) | CLOCK | BTN
    [279] = "%.2f", -- Clock Right Lever Rotate | CLOCK | LEV

    -- Barometric Altimeter
    [272] = "%.2f", -- Pressure Set Knob | BAROMETRIC_ALTIMETER | LEV

    -- AOA/G Meter
    [528] = "%.1f", -- Reset G Index | AOA_G_METER | BTN

    -- ADI
    [264] = "%.2f", -- ADI Aircraft Symbol Setting | ADI | LEV
    [265] = "%.1f", -- ADI Gyro Cage (press) | ADI | BTN

    -- HSI
    [270] = "%.2f", -- HSI Course Set | HSI | LEV
    [269] = "%.1f", -- HSI Test Button | HSI | BTN

    -- VVI
    [268] = "%.2f", -- VVI Adjustment Knob | VVI_TURN_SLIP | LEV

    -- Fuel Indicator
    [440] = "%.1f", -- T/P Switch | FUEL_INDICATOR | TUMB
    [446] = "%.1f", -- Distance Computer TEK/OPT | FUEL_INDICATOR | TUMB

    -- Electrical Power Panel
    [510] = "%.1f", -- BAT/GROUND | ELEC_INTERFACE | TUMB
    [511] = "%.1f", -- DC Generator | ELEC_INTERFACE | TUMB
    [512] = "%.1f", -- AC Generator | ELEC_INTERFACE | TUMB
    [513] = "%.1f", -- DC/AC Converter | ELEC_INTERFACE | TUMB
    [514] = "%.1f", -- Engine System | ELEC_INTERFACE | TUMB
    [515] = "%.1f", -- Fuel Pump | ELEC_INTERFACE | TUMB
    [516] = "%.1f", -- Anti Surge | ELEC_INTERFACE | TUMB
    [517] = "%.1f", -- All Electric Switches ON | ELEC_INTERFACE | BTN

    -- System Power Panel
    [504] = "%.1f", -- Radio Supply | ELEC_INTERFACE | TUMB
    [503] = "%.1f", -- Aircraft Systems | ELEC_INTERFACE | TUMB
    [502] = "%.1f", -- Gyro Main | ELEC_INTERFACE | TUMB
    [501] = "%.1f", -- Gyro Stby | ELEC_INTERFACE | TUMB
    [500] = "%.1f", -- Navigation | ELEC_INTERFACE | TUMB
    [509] = "%.1f", -- AFCS Supply | ELEC_INTERFACE | TUMB
    [508] = "%.1f", -- Transponder Supply | ELEC_INTERFACE | TUMB
    [507] = "%.1f", -- Recorder Supply | ELEC_INTERFACE | TUMB
    [506] = "%.1f", -- Weapon Supply | ELEC_INTERFACE | TUMB
    [505] = "%.1f", -- ACS Supply | ELEC_INTERFACE | TUMB
    [518] = "%.1f", -- All System Power Switches ON | ELEC_INTERFACE | BTN

    -- SPO-15 L006LM
    [185] = "%.1f", -- BIT Manual/Auto (spring) | L006LM | TUMB
    [186] = "%.2f", -- Lamp Brightness | L006LM | LEV
    [189] = "%.1f", -- Power | L006LM | TUMB
    [188] = "%.1f", -- Allow Search | L006LM | TUMB
    [187] = "%.2f", -- Warning Tone Volume | L006LM | LEV

    -- Radio R-862
    [132] = "%.1f", -- AM/FM | VHF_UHF_R862 | TUMB
    [248] = "%.1f", -- Guard Receiver | VHF_UHF_R862 | TUMB
    [249] = "%.1f", -- ADF | VHF_UHF_R862 | TUMB
    [250] = "%.1f", -- Squelch | VHF_UHF_R862 | TUMB
    [251] = "%.2f", -- Volume | VHF_UHF_R862 | LEV
    [252] = "%.2f", -- Channel Selector | VHF_UHF_R862 | TUMB

    -- VIWAS
    [141] = "%.1f", -- Repeat Voice Warning | VIWAS | BTN
    [142] = "%.1f", -- Check Voice Warning | VIWAS | BTN

    -- SPU (Intercom)
    [98]  = "%.2f", -- IR Volume | INTERCOM | LEV

    -- ARK
    [144] = "%.1f", -- ADF Channel Select | ARK | TUMB
    [145] = "%.1f", -- Voice/CW | ARK | TUMB
    [146] = "%.1f", -- Compass/Antenna | ARK | TUMB
    [147] = "%.2f", -- ADF Volume | ARK | LEV
    [179] = "%.1f", -- ADF Loop Pushbutton | ARK | BTN
    [139] = "%.1f", -- ADF Inner/Outer | ARK | TUMB

    -- Navigation
    [498] = "%.1f", -- PREPARE/OPERATE (Gyro Mode) | ELEC_INTERFACE | TUMB
    [410] = "%.1f", -- GYRO MAIN/STBY | NAV | TUMB
    [411] = "%.1f", -- CHANNELS AUTO/MAN | NAV | TUMB
    [412] = "%.1f", -- WP-A/D | NAV | TUMB
    [413] = "%.1f", -- REL BEARING RSBN/ADF | NAV | TUMB
    [414] = "%.1f", -- COURSE 180-359/0-179 | NAV | TUMB
    [415] = "%.1f", -- CIRCLE LEFT/RIGHT | NAV | TUMB
    [416] = "%.1f", -- LANDING ON/AUTO | NAV | TUMB
    [417] = "%.1f", -- IDENT Button | NAV | BTN

    [424] = "%.1f", -- WP-A/D Button 1 | NAV | BTN
    [425] = "%.1f", -- WP-A/D Button 2 | NAV | BTN
    [426] = "%.1f", -- WP-A/D Button 3 | NAV | BTN
    [427] = "%.1f", -- BEACON Button 1 | NAV | BTN
    [428] = "%.1f", -- BEACON Button 2 | NAV | BTN
    [429] = "%.1f", -- BEACON Button 3 | NAV | BTN
    [430] = "%.1f", -- RESET | NAV | BTN
    [431] = "%.1f", -- COURSE CMPTR ZERO | NAV | BTN
    [432] = "%.1f", -- RETURN | NAV | BTN

    [133] = "%.3f", -- RSBN Channel Selector | NAV | TUMB
    [134] = "%.2f", -- ILS Selector Knob | NAV | TUMB
    [274] = "%.1f", -- MAG HDG SLAVE Button | NAV | BTN
    [273] = "%.1f", -- SET COURSE AUTO/MAN | NAV | TUMB

    -- AFCS
    [82]  = "%.1f", -- DAMPER | AFCS_INTERFACE | BTN
    [84]  = "%.1f", -- AUTO RECOVER | AFCS_INTERFACE | BTN
    [86]  = "%.1f", -- ALT HOLD | AFCS_INTERFACE | BTN
    [88]  = "%.1f", -- ATT HOLD | AFCS_INTERFACE | BTN
    [90]  = "%.1f", -- APPROACH | AFCS_INTERFACE | BTN
    [92]  = "%.1f", -- MISSED APPROACH | AFCS_INTERFACE | BTN

    -- FCR Panel (Input)
    [294] = "%.1f", -- Target Elevation Select | INPUT_PANEL | TUMB
    [295] = "%.1f", -- Radar Mode Select | INPUT_PANEL | TUMB
    [296] = "%.1f", -- Radar Illumination | INPUT_PANEL | TUMB
    [297] = "%.1f", -- Radar Compensation | INPUT_PANEL | TUMB
    [298] = "%.1f", -- Radar TWF | INPUT_PANEL | TUMB
    [299] = "%.1f", -- Radar ECCM | INPUT_PANEL | TUMB

    -- Hydraulics
    [80]  = "%.1f", -- Landing Gear Handle | HYDRO_INTERFACE | TUMB
    [219] = "%.1f", -- Flaps Up | HYDRO_INTERFACE | BTN
    [223] = "%.1f", -- Flaps Takeoff | HYDRO_INTERFACE | BTN
    [224] = "%.1f", -- Flaps Landing | HYDRO_INTERFACE | BTN
    [222] = "%.1f", -- Flaps Off | HYDRO_INTERFACE | BTN

    -- Control System
    [99]  = "%.1f", -- Rudder Trim Switch (spring) | CONTROL_INTERFACE | TUMB

    -- Engines Start / Power Plant
    [282] = "%.2f", -- APU Switch (multiple positions) | POWER_PLANT_INTERFACE | TUMB
    [75]  = "%.1f", -- APU Switch Cover | POWER_PLANT_INTERFACE | TUMB
    [281] = "%.1f", -- Start-Up Mode LH/START BOTH/RH | POWER_PLANT_INTERFACE | TUMB
    [65]  = "%.1f", -- Ground Startup Button | POWER_PLANT_INTERFACE | BTN

    -- Mirrors & stick
    [690] = "%.2f", [691] = "%.2f", [692] = "%.2f", [693] = "%.2f", [694] = "%.2f", [695] = "%.2f", -- Mirror axes (L,C,R)
    [697] = "%.1f", [698] = "%.1f", [699] = "%.1f", -- Mirror on/off (L,C,R)
    [2]   = "%.1f", -- Stick Visibility | CPT_MECH | TUMB

    -- IFF / Transponder / Interrogator
    [126] = "%.1f", -- Transponder DISTR ON/OFF | TRANSPONDER | TUMB
    [127] = "%.1f", -- Transponder 1/2 | TRANSPONDER | TUMB
    [129] = "%.1f", -- ZEROIZE Cover | TRANSPONDER | TUMB
    [130] = "%.1f", -- ZEROIZE Button | TRANSPONDER | BTN
    [149] = "%.1f", -- SIGN Button | SO69 | BTN
    [494] = "%.1f", -- Transponder BIT | SO69 | BTN
    [148] = "%.1f", -- Transponder Mode Select | SO69 | TUMB
    [128] = "%.1f", -- Interrogator Mode Select | INTERROGATOR | TUMB
    [382] = "%.1f", -- Encryption Key Select | INTERROGATOR | TUMB
    [407] = "%.1f", -- Code Select MAIN/RESERVED | INTERROGATOR | TUMB
    [288] = "%.1f", -- LOCK Switch FOE/FRIEND | INPUT_PANEL | TUMB

    -- Nose Wheel Brake, Drag Chute
    [23]  = "%.1f", -- Nose Wheel Brake Handle | INPUT_PANEL | TUMB
    [28]  = "%.1f", -- DragChute Launch | INPUT_PANEL | BTN
    [243] = "%.1f", -- DragChute Drop | INPUT_PANEL | BTN
}

------------------------------------------------
-- HIGH IMPORTANCE EXPORTS (keep minimal here)
------------------------------------------------
function ExportScript.ProcessIkarusDCSConfigHighImportance(mainPanelDevice)
    -- Intentionally minimal for performance (similar to A-10C_2.lua usage)
end

function ExportScript.ProcessDACConfigHighImportance(mainPanelDevice)
    -- Keep for compatibility with DAC structure used in A-10C_2.lua
end

-----------------------------------------------------
-- LOW IMPORTANCE EXPORTS (text indicators, etc.)
-----------------------------------------------------
-- Toggle to assist discovery of indicator IDs (DO NOT ENABLE in normal use)
local MIG29_LIST_INDICATION_SCAN = false

-- Optional helper: split long strings into lines of N chars
local function splitLines(stringIn, charPerLine)
    if not stringIn or not charPerLine or charPerLine <= 0 then return stringIn end
    local function DIV(a,b) return (a - a % b) / b end
    local rows = DIV(#stringIn, charPerLine)
    for i = 1, rows, 1 do
        stringIn = string.sub(stringIn, 1, (charPerLine * i) + (i-1)) .. '\n' .. string.sub(stringIn, (charPerLine * i) + (i-1) + 1)
    end
    return stringIn
end

-- Mapping for MiG-29 textual indicators (to be extended after discovery)
-- Example structure: { id = <indicator_id>, fields = {"field1","field2"}, exportIDs = {id1, id2}, split = false }
local MiG29_TextIndicators = {
    -- TODO: fill when indicator IDs are known.
    -- Example placeholder (disabled):
    -- { id = 7, fields = {"txt_UP","txt_DOWN1","txt_DOWN2","txt_DOWN3","txt_DOWN4"}, exportIDs = {2114,2118,2119,2120,2121}, split = false },
}

local function exportTextIndicators()
    for _, ind in ipairs(MiG29_TextIndicators) do
        local t = ExportScript.Tools.getListIndicatorValue(ind.id)
        if t ~= nil then
            for i, fname in ipairs(ind.fields) do
                local val = t[fname]
                if val ~= nil then
                    if ind.split then
                        val = splitLines(val, ind.split)
                    end
                    ExportScript.Tools.SendData(ind.exportIDs[i], tostring(val))
                else
                    ExportScript.Tools.SendData(ind.exportIDs[i], " ")
                end
            end
        else
            -- no data; blank out
            for _, eid in ipairs(ind.exportIDs) do
                ExportScript.Tools.SendData(eid, " ")
            end
        end
    end
end

function ExportScript.ProcessIkarusDCSConfigLowImportance(mainPanelDevice)
    -- Optional one-time scanning aid to find indicator IDs (only if enabled)
    if MIG29_LIST_INDICATION_SCAN then
        local ltmp1 = 0
        for ltmp2 = 0, 25, 1 do
            ltmp1 = list_indication(ltmp2)
            if ltmp1 ~= nil then
                ExportScript.Tools.WriteToLog(tostring(ltmp2) .. ": " .. ExportScript.Tools.dump(ltmp1))
            end
        end
    end

    -- Export known textual indicators (if any have been configured)
    exportTextIndicators()
end

function ExportScript.ProcessDACConfigLowImportance(mainPanelDevice)
    -- Mirror textual exports to DAC format if desired (not used by default)
    -- Example:
    -- ExportScript.Tools.SendDataDAC("2114", "<text>")
end

-- RSBN/ILS channel aggregation and export for MiG-29
-- Exports integers to free IDs:
--   RSBN channel -> ID 2250
--   ILS  channel -> ID 2251
--   Combined text -> ID 2252  (format: "НАВ <RSBN>\nПОС <ILS>")

function ExportScript.MiG29_RSBN_ILS_Export(mainPanelDevice)
    local function gv(idx)
        local ok, v = pcall(mainPanelDevice.get_argument_value, mainPanelDevice, idx)
        if not ok or v == nil then return nil end
        return v
    end

    local function digit(val)
        if val == nil then return nil end
        local n = math.floor(val * 10 + 0.5)
        if n < 0 then n = 0 elseif n > 9 then n = 9 end
        return n
    end

    -- RSBN digits (418,419,420,421 -> 1000s,100s,10s,1s)
    local rsbn1000 = digit(gv(418))
    local rsbn0100 = digit(gv(419))
    local rsbn0010 = digit(gv(420))
    local rsbn0001 = digit(gv(421))

    local rsbn_out = ""
    if rsbn1000 and rsbn0100 and rsbn0010 and rsbn0001 then
        local rsbn_num = rsbn1000 * 1000 + rsbn0100 * 100 + rsbn0010 * 10 + rsbn0001
        rsbn_out = tostring(rsbn_num)
    end
    ExportScript.Tools.SendData(2250, rsbn_out)

    -- ILS digits (422,423 -> tens, ones)
    local ils10 = digit(gv(422))
    local ils01 = digit(gv(423))

    local ils_out = ""
    if ils10 and ils01 then
        local ils_num = ils10 * 10 + ils01
        ils_out = tostring(ils_num)
    end
    ExportScript.Tools.SendData(2251, ils_out)

    -- Combined output
    local combined_out = ""
    if (rsbn_out ~= "" or ils_out ~= "") then
        combined_out = "НАВ " .. rsbn_out .. "\nПОС " .. ils_out
    end
    ExportScript.Tools.SendData(2252, combined_out)
end

-- Auto-inject into low-importance export loop (place this block after the original function definition)
do
    local prev_low = ExportScript.ProcessIkarusDCSConfigLowImportance
    if type(prev_low) == "function" then
        ExportScript.ProcessIkarusDCSConfigLowImportance = function(mainPanelDevice)
            prev_low(mainPanelDevice)
            ExportScript.MiG29_RSBN_ILS_Export(mainPanelDevice)
        end
    end
end-- RSBN/ILS channel aggregation and export for MiG-29
-- Exports integers to free IDs:
--   RSBN channel -> ID 2250
--   ILS  channel -> ID 2251
--   Combined text -> ID 2252  (format: "НАВ <RSBN>\nПОС <ILS>")

function ExportScript.MiG29_RSBN_ILS_Export(mainPanelDevice)
    local function gv(idx)
        local ok, v = pcall(mainPanelDevice.get_argument_value, mainPanelDevice, idx)
        if not ok or v == nil then return nil end
        return v
    end

    local function digit(val)
        if val == nil then return nil end
        local n = math.floor(val * 10 + 0.5)
        if n < 0 then n = 0 elseif n > 9 then n = 9 end
        return n
    end

    -- RSBN digits (418,419,420,421 -> 1000s,100s,10s,1s)
    local rsbn1000 = digit(gv(418))
    local rsbn0100 = digit(gv(419))
    local rsbn0010 = digit(gv(420))
    local rsbn0001 = digit(gv(421))

    local rsbn_out = ""
    if rsbn1000 and rsbn0100 and rsbn0010 and rsbn0001 then
        local rsbn_num = rsbn1000 * 1000 + rsbn0100 * 100 + rsbn0010 * 10 + rsbn0001
        rsbn_out = tostring(rsbn_num)
    end
    ExportScript.Tools.SendData(2250, rsbn_out)

    -- ILS digits (422,423 -> tens, ones)
    local ils10 = digit(gv(422))
    local ils01 = digit(gv(423))

    local ils_out = ""
    if ils10 and ils01 then
        local ils_num = ils10 * 10 + ils01
        ils_out = tostring(ils_num)
    end
    ExportScript.Tools.SendData(2251, ils_out)

    -- Combined output
    local combined_out = ""
    if (rsbn_out ~= "" or ils_out ~= "") then
        combined_out = "НАВ " .. rsbn_out .. "\nПОС " .. ils_out
    end
    ExportScript.Tools.SendData(2252, combined_out)
end

-- Auto-inject into low-importance export loop (place this block after the original function definition)
do
    local prev_low = ExportScript.ProcessIkarusDCSConfigLowImportance
    if type(prev_low) == "function" then
        ExportScript.ProcessIkarusDCSConfigLowImportance = function(mainPanelDevice)
            prev_low(mainPanelDevice)
            ExportScript.MiG29_RSBN_ILS_Export(mainPanelDevice)
        end
    end
end

-- HSI Range / Bearing aggregation (to IDs 2253, 2254, 2255)
function ExportScript.MiG29_HSI_Aggregate_Export(mainPanelDevice)
    local function gv(idx)
        local ok, v = pcall(mainPanelDevice.get_argument_value, mainPanelDevice, idx)
        if not ok or v == nil then return nil end
        return v
    end
    local function digit10(val)
        if val == nil then return nil end
        local n = math.floor(val * 10 + 0.5)
        if n < 0 then n = 0 elseif n > 9 then n = 9 end
        return n
    end

    -- HSI Range digits (111=100s, 112=10s, 113=1s)
    local r100 = digit10(gv(111))
    local r010 = digit10(gv(112))
    local r001 = digit10(gv(113))

    local range_out_compact = ""
    if r100 and r010 and r001 then
        local range_val = r100 * 100 + r010 * 10 + r001
        range_out_compact = string.format("%dкм", range_val)  -- no leading zeros, e.g. 12км
    end
    ExportScript.Tools.SendData(2253, range_out_compact)

    -- HSI Bearing: 400 -> -1..1 for 0..36 tens-of-deg, 401 -> 0..1 for 0..9 ones
    local v400 = gv(400)
    local ones = digit10(gv(401))

    local bearing_out = ""
    if v400 ~= nil and ones ~= nil then
        local tens = math.floor((v400 + 1.0) * 18.0 + 0.5) -- map back to 0..36
        if tens < 0 then tens = 0 elseif tens > 36 then tens = 36 end
        local bearing = (tens * 10 + ones) % 360
        bearing_out = string.format("%03d°", bearing) -- keep leading zeros, e.g. "034°"
    end
    ExportScript.Tools.SendData(2254, bearing_out)

    -- Combined output (two lines): "NNNкм" and "000°"
    local combined = ""
    if range_out_compact ~= "" or bearing_out ~= "" then
        combined = (range_out_compact ~= "" and range_out_compact or "") .. "\n" ..
                   (bearing_out ~= "" and bearing_out or "")
    end
    ExportScript.Tools.SendData(2255, combined)
end
-- R-862 channel (arg 284 -> 0.00..0.95 step 0.05) to ID 2256 as "Р-862\nNN"
function ExportScript.MiG29_R862_Channel_Export(mainPanelDevice)
    local function gv(idx)
        local ok, v = pcall(mainPanelDevice.get_argument_value, mainPanelDevice, idx)
        if not ok or v == nil then return nil end
        return v
    end

    local v = gv(284)
    local out = ""
    if v ~= nil then
        local ch = math.floor(v * 20 + 0.5)  -- round to nearest int (0..19)
        if ch < 0 then ch = 0 elseif ch > 19 then ch = 19 end
        out = "Р-862\n" .. tostring(ch)
    end
    ExportScript.Tools.SendData(2256, out)
end

-- Hook into low-importance loop
do
    local prev_low = ExportScript.ProcessIkarusDCSConfigLowImportance
    if type(prev_low) == "function" then
        ExportScript.ProcessIkarusDCSConfigLowImportance = function(mainPanelDevice)
            prev_low(mainPanelDevice)
            ExportScript.MiG29_R862_Channel_Export(mainPanelDevice)
        end
    end
end
-- Hook into low-importance loop
do
    local prev_low = ExportScript.ProcessIkarusDCSConfigLowImportance
    if type(prev_low) == "function" then
        ExportScript.ProcessIkarusDCSConfigLowImportance = function(mainPanelDevice)
            prev_low(mainPanelDevice)
            ExportScript.MiG29_HSI_Aggregate_Export(mainPanelDevice)
        end
    end
end
