; This gcode is formulated to work with dual tool head test stands running TAZ 6 Dual v2 firmware version 1.1.9.9
; Use of this gcode outside of an identical setup is likely to provide unexpected results
T0
M104 S230
M107            ; turn fan off
M117 FAN 100 PERCENT
M106 P1 S255    ; turn fan on full speed
G4 S15          ; wait 15 seconds
M117 FAN OFF
M106 P1 S0      ; turn fan off
M400            ; flush buffer
G4 S5           ; wait 5 seconds
M117 FAN 50 PERCENT
M106 P1 S127    ; turn fan on at 50
G4 S10          ; wait 10 seconds
M117 FAN OFF
M106 P1 S0      ; turn fan off

M999                 ; clear errors
M400                 ; clear buffer
G21                  ; set units to millimeters
M82                  ; use absolute distances for extrusion
G92 X0 Y0 Z0 E0      ; Set cords to zero
M92 E800             ; set esteps to base 800
M500                 ; save into memory

M109 S230            ; set extruder nozzle to 230C and wait
M117 MARK FILAMENT
M300 S2
G4 S15               ; wait 15 sec to mark extrude and mark filament
G1 E100 F90          ; move extruder 1 100mm
G4 S1
M104 S160            ; start cooling
M106 P1 S255 

G1 E101 F1           ; squish some filament into the hotend
G4 S1                ; wait
M109 R120            ; turn temp to 120
G1 E0 F90            ; autocoldpull
M117 inspect filament ; ask to inspect filament
G4 S5
M104 S0
M106 P0 S0           ; fan off
M106 P1 S0           ; fan off
M84                  ; idle motors
M18                  ; turn off motors
M117 Test Complete








