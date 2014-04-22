Quantum espresso environment to calulate structure of CaOH2

1. If you plan to perform the actual calculations on your computer, make sure you have the espresso directory in your home directory.
2. Calculations are performed using ./bin/ambient_phase.sys
3. The results of the calculation are in ./results/ambient
4. To extract the structure info from ./results/ambient run ./bin/extract_structure_all.sh
5. To get the plots, cd to plot and run `make`.
6. The plots are in ./plot