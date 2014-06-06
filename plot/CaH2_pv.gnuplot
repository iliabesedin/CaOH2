set terminal eps color size 9,6 font 'Helvetica,24'
set termoption enhanced
set output "CaH2_pv.eps"
set xlabel "pressure, kbar"
set ylabel "cell volume, a.u."
plot "CaH2_18GPa.data" using 1:($8)/2 with lines title "CaH2 18GPa", \
    "CaH2_ambient.data" using 1:($8)/4 with lines title "CaH2 ambient"