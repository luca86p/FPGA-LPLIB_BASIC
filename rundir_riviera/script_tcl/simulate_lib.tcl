# worklib
# ------------------------------------------------------------------------------
set worklib [lindex $argv 0]

# run Riviera
# ------------------------------------------------------------------------------
asim -ieee_nowarn -advdataflow ${worklib}.tb

# -t ns
# -advdataflow

# -0vitalwiredelay
# -ieee_nowarn
# -access_leak_report


# store all the signals in the simulation database
# ----------------------------------------
log -recursive sim:/*


# run
# ----------------------------------------
run -all



# run + VCD (to save VCD portion)
# ----------------------------------------
# run 100 us
# vcd file dump.vcd
# vcd add -r sim:/tb/i_uut/i_top_level_plato/i_grpci2/*
# vcd add -r sim:/tb/i_uut/i_top_level_plato/i_ahbctrl/*
# vcd add /tb/i_uut/i_top_level_plato/i_grpci2/pcii
# vcd add -r sim:/tb/i_uut/i_top_level_plato
# vcd on
# run 100 us
# vcd off
# run 100 us
# vcd on
# run 450 us
# vcd off
# run -all
