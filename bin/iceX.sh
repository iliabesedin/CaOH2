#!/bin/sh
####################################################
# This is a sample script to run scf total-energy
# calculations on a unit cell of Si using three 
# different values for the input parameter 
# 'ecutwfc' (the plane-wave cutoff).
#
# Brandon Wood, 21-07-08
#
# You should copy this file and modify it as 
# appropriate for the tutorial.
####################################################
# Notes:
#
# 1. You can loop over a variable by using the 
#    'for...do...done' construction. As an example, 
#    this code loops over three different values
#    of ecut (5, 10, 15), designated by a
#    variable called CUTOFF.
# 2. Variables can be referred to within the script 
#    by typing the variable name preceded by the '$' 
#    sign. So whenever $CUTOFF appears in the 
#    script, it will be replaced by its current 
#    value.
#
####################################################
# Important initial variables for the code
# (change these as necessary)
####################################################

NAME='ecut'

####################################################

CWD=`pwd`
CUTOFF=80

cd ../tmp

for PRESS in 0620 0800 1000
do
cat > ../results/iceX/iceX.$PRESS.in << EOF
 &control
    calculation = 'vc-relax',
    prefix = 'iceX_ambient'
    tprnfor = .TRUE
    tstress = .TRUE
 /
 &system
    ibrav =  1, 
    celldm(1) = 5.26,
    nat =  6, 
    ntyp = 2,
    ecutwfc = $CUTOFF
    ecutrho = 320,
 /
 &electrons
    mixing_mode = 'local-TF'
    mixing_beta = 0.3
    mixing_ndim = 16
 /
 &ions
    ion_dynamics = 'bfgs'
 /
 &cell
    press = $PRESS,
    cell_dynamics = 'bfgs'
 /
ATOMIC_SPECIES
 H  1.007   H.pbe-sp-mt.ncpp
 O  16.000  O.pbe-sp-mt.ncpp
ATOMIC_POSITIONS (crystal)
 O 0.0000  0.0000  0.0000
 O 0.5000  0.5000  0.5000
 H 0.2500  0.2500  0.2500
 H 0.7500  0.7500  0.2500
 H 0.2500  0.7500  0.7500
 H 0.7500  0.2500  0.7500
K_POINTS (automatic)
  6 6 6 1 1 1
EOF

~/espresso/bin/pw.x < ../results/iceX/iceX.$PRESS.in > ../results/iceX/iceX.$PRESS.out

done

cd $CWD