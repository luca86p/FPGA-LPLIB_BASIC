#!/usr/bin/env bash

# CLEAN
./run_riviera.sh clean

# COMPILE
./run_riviera.sh compile liblist lplib_basic

# COMPILE FOR VERIFICATION
./run_riviera.sh compile liblist lplib_basic_verif -2008
