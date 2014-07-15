set terminal eps color size 9,6 font 'Helvetica,24'
set termoption enhanced
set output "CaH2_pv.eps"
set xlabel "pressure, kbar"
set ylabel "cell volume, a.u."
plot "CaH2_18GPa-blyp.data" using 1:($8)/2 with lines title "CaH2 18GPa blyp 120 Ry cutoff", \
    "CaH2_18GPa.data" using 1:($8)/2 with lines title "CaH2 18GPa lda 80 Ry cutoff", \
    "CaH2_ambient.data" using 1:($8)/4 with lines title "CaH2 ambient", \
    "CaH2_pv_experiment.data" using ($1*10.125):($2/0.529**3) title "experiment"