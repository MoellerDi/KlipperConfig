## Tool change and selection macros for Klipper 3D printer firmware ##
```
[gcode_macro T0]
gcode:
   SAVE_GCODE_STATE NAME=toolchange
   {% if not printer.toolhead.extruder == "extruder" %}
       unload{printer.toolhead.extruder}
       ACTIVATE_EXTRUDER EXTRUDER=extruder
       loadextruder
   {% endif %}
   RESTORE_GCODE_STATE NAME=toolchange MOVE=1 MOVE_SPEED=100
   SET_GCODE_OFFSET Z=0

[gcode_macro T1]
gcode:
   SAVE_GCODE_STATE NAME=toolchange
   {% if not printer.toolhead.extruder == "extruder1" %}
       unload{printer.toolhead.extruder}
       ACTIVATE_EXTRUDER EXTRUDER=extruder1
       loadextruder1
   {% endif %}
   RESTORE_GCODE_STATE NAME=toolchange MOVE=1 MOVE_SPEED=100
   SET_GCODE_OFFSET Z=0

[gcode_macro T2]
gcode:
   SAVE_GCODE_STATE NAME=toolchange
   {% if not printer.toolhead.extruder == "extruder2" %}
       unload{printer.toolhead.extruder}
       ACTIVATE_EXTRUDER EXTRUDER=extruder2
       loadextruder2
   {% endif %}
   RESTORE_GCODE_STATE NAME=toolchange MOVE=1 MOVE_SPEED=100
   SET_GCODE_OFFSET Z=0
 ```         
 ## Tool load and unload macros ##         
```
[gcode_macro unloadEXTRUDER]
gcode:
   #put all moves in this macro
   M83                                 # relative moves for extruder
   G92 E0                              # set the current filament position to E=0
   G1 F1300 E-5                        # Quickly retract 5 mm to prevent oozing
   G1 X0.000000 Y0.000000 F21000       # Home X and Y axis leave Z at current height (purge bucket is at home position)
   G92 E0                              # set the current filament position to E=0
   G1 F25 E5.000000                    # Reinsert 5mm to prevent stringing
   G92 E0                              # set the current filament position to E=0
   G1 F1300 E-75                       # Quickly retract 75 mm to free the splitter
   M84 E                               # release extruder from 'holding' position
        
[gcode_macro unloadExtruder1]
gcode:
   #put all moves in this macro
   M83                                 # relative moves for extruder
   G92 E0                              # set the current filament position to E=0
   G1 F1300 E-5                        # Quickly retract 5 mm to prevent oozing
   G1 X0.000000 Y0.000000 F21000       # Home X and Y axis leave Z at current height (purge bucket is at home position)
   G92 E0                              # set the current filament position to E=0
   G1 F25 E5.000000                    # Reinsert 5mm to prevent stringing
   G92 E0                              # set the current filament position to E=0
   G1 F1300 E-75                       # Quickly retract 75 mm to free the splitter
   M84 E                               # release extruder from 'holding' position        

[gcode_macro unloadExtruder2]
gcode:
   #put all moves in this macro
   M83                                 # relative moves for extruder
   G92 E0                              # set the current filament position to E=0
   G1 F1300 E-5                        # Quickly retract 5 mm to prevent oozing
   G1 X0.000000 Y0.000000 F21000       # Home X and Y axis leave Z at current height (purge bucket is at home position)
   G92 E0                              # set the current filament position to E=0
   G1 F25 E5.000000                    # Reinsert 5mm to prevent stringing
   G92 E0                              # set the current filament position to E=0
   G1 F1300 E-75                       # Quickly retract 75 mm to free the splitter
   M84 E                               # release extruder from 'holding' position     

[gcode_macro loadextruder]
gcode:
   #put all moves in this macro
   M83                                 # relative moves for extruder
   G92 E0                              # set the current filament position to E=0
   G1 F700 E60                         # Extrude 60 mm to fill the splitter
   G1 F5000 X20.000000 Y0.000000       # Move the Nozzle before purging
   G92 E0                              # set the current filament position to E=0
   G1 F200 E55                         # Extrude 55 mm to purge the nozzle
  # G1 F5000 X25.000000 Y10.000000      # Wipe move 1
  # G1 F5000 X0.000000 Y0.000000        # Wipe move 2
   clean_nozzle                         # Macro to clean the nozzle
   G92 E0                              # set the current filament position to E=0
   G1 F1300 E-16                       # Compensate fot the annoying Cura G1 F1200 E16
   G92 E0                              # set the current filament position to E=0

[gcode_macro loadextruder1]
gcode:
   #put all moves in this macro
   M83                                 # relative moves for extruder
   G92 E0                              # set the current filament position to E=0
   G1 F700 E60                         # Extrude 60 mm to fill the splitter
   G1 F5000 X20.000000 Y0.000000       # Move the Nozzle before purging
   G92 E0                              # set the current filament position to E=0
   G1 F200 E55                         # Extrude 55 mm to purge the nozzle
  # G1 F5000 X25.000000 Y10.000000      # Wipe move 1
  # G1 F5000 X0.000000 Y0.000000        # Wipe move 2
   clean_nozzle                         # Macro to clean the nozzle
   G92 E0                              # set the current filament position to E=0
   G1 F1300 E-16                       # Compensate fot the annoying Cura G1 F1200 E16
   G92 E0                              # set the current filament position to E=0

[gcode_macro loadextruder2]
gcode:
  # put all moves in this macro
   M83                                 # relative moves for extruder
   G92 E0                              # set the current filament position to E=0
   G1 F700 E60                         # Extrude 60 mm to fill the splitter
   G1 F5000 X20.000000 Y0.000000       # Move the Nozzle before purging
   G92 E0                              # set the current filament position to E=0
   G1 F200 E55                         # Extrude 55 mm to purge the nozzle
  # G1 F5000 X25.000000 Y10.000000      # Wipe move 1
  # G1 F5000 X0.000000 Y0.000000        # Wipe move 2
   clean_nozzle                         # Macro to clean the nozzle
   G92 E0                              # set the current filament position to E=0
   G1 F1300 E-16                       # Compensate fot the annoying Cura G1 F1200 E16
   G92 E0                              # set the current filament position to E=0
```
 ## Macro to clean Nozzle ##    
 ```
[gcode_macro clean_nozzle]
gcode:
  G90
#  G0 Z15 F300
  {% for wipe in range(8) %}
    {% for coordinate in [(0,0),(25,10)] %}
      G0 X{coordinate[0]} Y{coordinate[1] + 0.25 * wipe} F12000
    {% endfor %}
  {% endfor %}
#  RESTORE_GCODE_STATE NAME=clean_nozzle_state
```
