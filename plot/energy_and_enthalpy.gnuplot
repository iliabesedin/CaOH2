set terminal eps color size 9,6 font 'Helvetica,24'
set output "energy_and_enthalpy.eps"
set xlabel "pressure, kbar"
set ylabel "thermodynamic potential, Ry"
plot "hp.data" using 1:9 with lines title "hp enthalpy", "hp.data" using 1:7 with lines title "hp energy", \
    "ambient.data" using 1:9 with lines title "ambient enthalpy", "ambient.data" using 1:7 with lines title "ambient energy"