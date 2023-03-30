set term eps enhanced color 22
set key right

set xra[:]
set yra[:]
set xla '{/Symbol a}'
set yla '{/Symbol x}_x / L'
set label "J' = 0.80" at 0.4,0.2
set output "test.eps"

plot "< awk '$3==32 && $7==0.80' {print} ../accum.dat" u 3:($28/$3):($29:$3) w e t 'L=32' lt 7 pt 4 ps 1

set output
set terminal qt
