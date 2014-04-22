set terminal eps color size 9,6 font 'Helvetica,24'
set output "iceX.eps"
set xlabel "pressure, kbar"
set ylabel "atom position, a. u."
plot [x=1:2000] "iceX.data" using 1:3 with lines title "a calculation"