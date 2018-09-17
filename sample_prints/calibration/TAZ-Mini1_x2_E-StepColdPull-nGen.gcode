; This gcode is formulated to work with dual tool head test stands running TAZ 6 Dual v2 firmware version 1.1.9.9
; Use of this gcode outside of an identical setup is likely to provide unexpected results
T0
M104 S230
T1
M104 S230
M117 FANS 100 PERCENT
M106 P0 S255		     ; set cooling fan 0 to 100%
M106 P1 S255		     ; set cooling fan 1 to 100%

G4 S10			     ; dwell 10 seconds

M117 FANS OFF
M107
M106 P1 S0


G4 S5			     ; dwell 5 seconds


M117 FANS 40 PERCENT
M106 P0 S102		     ; set cooling fan 0 to 40%
M106 P1 S102		     ; set cooling fan 1 to 40%

G4 S10			     ; dwell 10 seconds

M117 FANS OFF
M106 P1 S0
M106 P1 S0


G4 S5			     ; dwell 5 seconds


M999                 ; clear errors
M400                 ; clear buffer
G21                  ; set units to millimeters
M82                  ; use absolute distances for extrusion
T0                   ; tool 0
G92 E0               ; Set cords to zero
T1                   ; tool 1
G92 E0               ; Set cords to zero
M92 T0 E800          ; set T0 esteps to base 800
M92 T1 E800          ; set T1 esteps to base 800
M500                 ; save into memory

T1
M104 S230

T0                   ; select tool 0
M109 S230            ; set extruder nozzle to 230C and wait
M117 MARK FILAMENT
M300 S2
G4 S15               ; wait 15 sec to mark extrude and mark filament
G1 E100 F90          ; move extruder 1 100mm
G4 S1
M104 S160            ; start cooling

T1                   ; select tool 1
M109 S230            ; set extruder nozzle to 230C and wait
M117 MARK FILAMENT
M300 S2
G4 S15               ; wait 15 sec to mark extrude and mark filament
G1 E200 F90          ; move extruder 1 100mm
G4 S1
M104 S160            ; start cooling

G4 S1                ; wait

M106 P0 S255         ; turn E0 Fan on 100 percent
M106 P1 S255         ; turn E1 Fan on 100 percent

T0                   ; select tool 0
M109 S160            ; turn temp to 160
G1 E201 F1           ; squish some filament into the hotend
G4 S1                ; wait
M109 S120            ; turn temp to 120

T1                   ; select tool 1
M109 S160            ; turn temp to 160
G1 E202 F1           ; squish some filament into the hotend
G4 S1
M109 R120            ; turn temp to 120
G4 S1                ; wait
G1 E100 F90            ; autocoldpull
M117 inspect filament ; ask to inspect filament
G4 S5

T0
G1 E0 F90            ; autocoldpull
M117 inspect filament ; ask to inspect filament
G4 S5
M104 S0
T1
M104 S0
M106 P0 S0           ; fan off
M106 P1 S0           ; fan off
M84                  ; idle motors
M18                  ; turn off motors
M117 Test Complete

