set terminal eps color size 9,6 font 'Helvetica,24'
set output "CaH2_energy_and_enthalpy.eps"
set title "CaH2 thermodynamic potentials per CaH2 unit"
set xlabel "pressure, kbar"
set ylabel "thermodynamic potential, Ry"
plot "CaH2_18GPa.data" using 1:($9)/2 with lines title "CaH2 18GPa phase enthalpy", "CaH2_18GPa.data" using 1:($7)/2 with lines title "CaH2 18GPa energy", \
    "CaH2_18GPa-blyp.data" using 1:($9)/2 with lines title "CaH2 18GPa phase enthalpy blyp 120 Ry cutoff", "CaH2_18GPa-blyp.data" using 1:($7)/2 with lines title "CaH2 18GPa energy blyp 120 Ry cutoff", \
    "CaH2_ambient.data" using 1:($9)/4 with lines title "CaH2 ambient enthalpy", "CaH2_ambient.data" using 1:($7)/4 with lines title "CaH2 ambient energy"