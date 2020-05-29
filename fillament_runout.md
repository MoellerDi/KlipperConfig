
    Save the actual axis positions (x,y,z, extruder)
    Retract some filament (default "park retract" value, or specified with M600)
    Go to a "park nozzle position"
    Wait for the user to change the filament. On MARLIN, this implies that the user have a LCD display, to be able to see what's going on, and confirm that the new filament has been set-up. Once the user has changed the filament, he has to push the button... (in our case, we could wait for a MXXX code to resume the print)
    Reload the filament (either a specified value or default...)
    Go back to the saved position and resume the print !


```
[gcode_macro END_PRINT]
gcode:
    M117 Done printing :)
    # move z up
    G91
    G1 E-3 Z+10 F3000
    # absolute xy 
    G90
    G1 X10 Y220 F2000
    #disable hotend and heated bed
    M104 S0
    M140 S0
    # disable steppers
```
```
 prime the nozzle 
[gcode_macro PRIME_LINE]
gcode: 
    M117 Prime Line
    G92 E0 ;Reset Extruder
    # move z axis 
    G1 Z2.0 F3000 ;Move Z Axis up
    # move to prime position 
    G1 X20 Y30 Z0.28 F5000.0 ;Move to start position
    G1 X20 Y200.0 Z0.28 F1500.0 E15 ;Draw the first line
    G1 X22 Y200.0 Z0.28 F5000.0 ;Move to side a little
    G1 X22 Y50 Z0.28 F1500.0 E30 ;Draw the second line
    G92 E0 ;Reset Extruder
    G1 Z2.0 F3000 ;Move Z Axis up
```
```
# G29 that does (1) home all (2) get bed mesh (3) move nozzle to corner so it doesnt ooze on the bed while heating up.
[gcode_macro G29]
gcode:
    G28
    BED_MESH_CALIBRATE
    G0 X0 Y0 Z10 F6000
    BED_MESH_PROFILE save=cr10
```

```
# Park toolhead
[gcode_macro M125]
gcode:
    SAVE_GCODE_STATE NAME=parking
    M117 Parking toolhead
    G91
    G1 Z20 F600 # move up 5 mm
    G90
    G1 X125 Y0 F4000 # move to park position
    RESTORE_GCODE_STATE NAME=parking
```
```
# load filament
[gcode_macro M701]
gcode:
    SAVE_GCODE_STATE NAME=loading_filament
    M117 Loading Filament
    M83
    G92 E0.0
    LOW_TEMP_CHECK
    G1 E420 F6000  # length of bowden tube till cold-end (~420mm) 
    G1 E100 F200  # some extra to prime the nozzle --> slower 
    G92 E0.0
    RESTORE_GCODE_STATE NAME=loading_filament
```
```
# unload filament
[gcode_macro M702]
gcode:
    SAVE_GCODE_STATE NAME=unloading_filament
    M125 # park
    M117 Unloading Filament 
    LOW_TEMP_CHECK
    G91 # set relative
    G1 E10 F100 
    G92 E0.0
    G1 E-530 F6000 # the E is the length of the bowden tube (420mm) + 100 mm. 
    G92 E0.0
    RESTORE_GCODE_STATE NAME=unloading_filament
```
```
# filament change 
[gcode_macro M600]
gcode:
    M117 Filament Change
    M118 Filament Change
    SAVE_GCODE_STATE NAME=filament_change
    PAUSE
    LOW_TEMP_CHECK
    G91 # relative
    G1 E-1 F300 # retract 1
    M125 # park
    M702 # unload

    M117 New filament
    M118 New filament
    COUNTDOWN TIME=25 MSG="Switch"
    M701
    COUNTDOWN TIME=10 MSG="Clean"
    RESUME
    M117 Resuming
    M118 Resuming
    RESTORE_GCODE_STATE NAME=filament_change
    M117 Printing..
    M118 Printing..
```
