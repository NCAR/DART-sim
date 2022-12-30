#!/usr/bin/env bash

# DART software - Copyright UCAR. This open source software is provided
# by UCAR, "as is", without charge, subject to all terms of use at
# http://www.image.ucar.edu/DAReS/DART/DART_download

main() {


export DART=/Users/hkershaw/DART/Projects/Sim/DART
source "$DART"/build_templates/buildfunctions.sh

MODEL=lorenz_96
LOCATION=oned

programs=(
seq-obs-do
)

# quickbuild arguments
arguments "$@"

# clean the directory
\rm -f -- *.o *.mod Makefile .cppdefs

# build any NetCDF files from .cdl files
cdl_to_netcdf

# build and run preprocess before making any other DART executables
buildpreprocess

# build 
buildit

# clean up
\rm -f -- *.o *.mod

echo " "
echo "Built with DART " $DART
echo " "

}

main "$@"
