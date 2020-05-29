
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

