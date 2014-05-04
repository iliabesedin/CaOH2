set terminal eps color size 9,6 font 'Helvetica,24'
set termoption enhanced
set output "pv.eps"
set xlabel "pressure, kbar"
set ylabel "cell volume, a.u."
plot "hp.data" using 1:8 with lines title "hp", \
    "ambient.data" using 1:8 with lines title "ambient"