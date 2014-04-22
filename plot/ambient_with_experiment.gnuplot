set terminal eps color size 9,6 font 'Helvetica,24'
set output "ambient_with_experiment.eps"
set xlabel "pressure, kbar"
set ylabel "atom position, a. u."
plot [x=1:2000] [0:12] "ambient.data" using 1:3 with lines title "Ca", "ambient.data" using 1:4 with lines title "O", "ambient.data" using 1:5 with lines title "H", \
    "experimental.data" using 1:($3/0.529) title "Ca experiment", "experimental.data" using 1:($4/0.529) title "O experiment"