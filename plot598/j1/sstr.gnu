set term post enhanced color 22
set key right
#set log x

set xra[:]
set yra[0:]
set xla '{/Symbol a}'
set yla 'S_s({/Symbol p},{/Symbol p})'
set label "J' = 1" at 0.2,50

plot \
"< awk '$2==32 && $4==1.0 {print}' ../accum.dat" u 3:17:18 t 'L = 32' w e lt 7 pt 4 ps 1,\
"< awk '$2==48 && $4==1.0 {print}' ../accum.dat" u 3:17:18 t '48' w e lt 6 pt 6 ps 1,\
"< awk '$2==64 && $4==1.0 {print}' ../accum.dat" u 3:17:18 t '64' w e lt 8 pt 8 ps 1,\
