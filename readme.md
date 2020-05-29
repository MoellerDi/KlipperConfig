# My klipper config files

## My config is split into seperate config snippets.

The configuration exists of the following files:

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
