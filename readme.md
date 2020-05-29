# My klipper config files
## cr10 / cr10s klipper profile
My config is split into seperate config snippets.


Adding an evironment variable is as easy as ssh'ing into your pi, opening your bashrc file `nano ~/.bashrc`, scrolling to the bottom and adding the environment variable (for example `export PRINTER_NAME=cr10`). After you have saved the bashrc file, source it `source ~/.bashrc` and issuing `echo $PRINTER_NAME` should return the name you've entered.

## The configuration exists of the following files:

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
