# My klipper config files

## My config is split into seperate config snippets.

### The configuration exists of the following files:

1. printer.cfg
   - The first file Klipper searches for at boot. I contains references to the other files.
   It is also used by Klipper to store config parameters from the SAVE_CONFIG command.
2. machine.cfg
   - Hardware definitions for my specific printer model.
3. calibration.cfg
   - Definitions for bed leveling and possibly other calibration setting. (Bed-screws, etc.)   
4. probe.cfg
   - Definitions for the inductive probe used as Z-stop and bed leveling.
5. leds.cfg
   - Definitions for the leds.   
6. macros.cfg
   - Macro definitions.   
7. other.cfg
   - All definitions that didn't fit in the previous files.

### The following macros are defined at this moment:

1. print_start
   - Gcode run before print is started. This will be included in the .gcode file produced by your slicer. In cura you can define "print_start" as start gcode. and end gcode "END_PRINT"
2. print_end
  - Gcode run after a print ended. This will be included in the .gcode file produced by your slicer. In cura you can define "print_end" as end gcode.
3. G29
  - Implements the G29 bed leveling command.
4. forcemove_z
  - Enable stepper movement without homing first. FOR TESTING PURPOSES ONLY !!!
5. T0, T1, T2
  - (re)Implements the Tool selection commands. The macros check if the selected tool is already active and calls other macros to enable multicolor printing with a 3-to-1 head.
6. loadExtruder
  - Activates selected tool and primes it with filament before resuming printing.
7. unloadExtruder
  - Retracts the fillament and deactivates the active tool.
8. wipe_nozzle
  - Moves nozzle to purge bucket location and wipes it a few times.
