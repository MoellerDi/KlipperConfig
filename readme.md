# My klipper config files
## Krakatau's klipper profile
My config is split into seperate config snippets.


Adding an evironment variable is as easy as ssh'ing into your pi, opening your bashrc file `nano ~/.bashrc`, scrolling to the bottom and adding the environment variable (for example `export PRINTER_NAME=cr10`). After you have saved the bashrc file, source it `source ~/.bashrc` and issuing `echo $PRINTER_NAME` should return the name you've entered.

## The configuration exists of the following files:

1. printer.cfg
   - The first file Klipper searches for at boot. I contains references to the other files.
   It is also used by Klipper to store config parameters from the SAVE_CONFIG command.
2. machine.cfg
   - Machine definitions
   
   
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
