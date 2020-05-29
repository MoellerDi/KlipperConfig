# My klipper config files
<<<<<<< HEAD
    _  __ ____      _     _  __    _   _____   _    _   _
   | |/ /|  _ \    / \   | |/ /   / \ |_   _| / \  | | | |
   | ' / | |_) |  / _ \  | ' /   / _ \  | |  / _ \ | | | |
   | . \ |  _ <  / ___ \ | . \  / ___ \ | | / ___ \| |_| |
   |_|\_\|_| \_\/_/   \_\|_|\_\/_/   \_\|_|/_/   \_\\___/

     /777          ((_           ___           /777          ___
    (o o)         (o o)         (o o)         (o o)         (o o)
ooO--(_)--Ooo-ooO--(_)--Ooo-ooO--(_)--Ooo-ooO--(_)--Ooo-ooO--(_)--Ooo-


##y config is split into seperate config snippets.

The configuration exists of the following files:
=======
## Krakatau's klipper profile
My config is split into seperate config snippets.


Adding an evironment variable is as easy as ssh'ing into your pi, opening your bashrc file `nano ~/.bashrc`, scrolling to the bottom and adding the environment variable (for example `export PRINTER_NAME=cr10`). After you have saved the bashrc file, source it `source ~/.bashrc` and issuing `echo $PRINTER_NAME` should return the name you've entered.

## The configuration exists of the following files:
>>>>>>> 45160c94c633149d9e758dcd2481e9a6f773aa76

1. printer.cfg
   - The first file Klipper searches for at boot. I contains references to the other files.
   It is also used by Klipper to store config parameters from the SAVE_CONFIG command.
2. machine.cfg
   - Hardware definitions for my specific printer model.
3. calibration.cfg
   - Definitions for bed leveling and possibly other calibration setting. (Bed-screws, etc.)   
<<<<<<< HEAD
4. probe.cfg
  - Definitions for the inductive probe used as Z-stop and bed leveling.
5. leds.cfg
   - Definitions for the leds.   
6. macros.cfg
  - Macro definitions.   
7. other.cfg
  - All definitions that didn't fit in the previous files.
=======
   
# Machine definitions
[include machine.cfg]

# Calibration f.i. Bed-Level
[include calibration.cfg]

# Probe definitions
[include probe.cfg]

# LED definitions
[include leds.cfg]

# Other
[include other.cfg]
>>>>>>> 45160c94c633149d9e758dcd2481e9a6f773aa76
