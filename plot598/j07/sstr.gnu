set term post enhanced color 22
set key right
#set log x

set xra[0.4:1]
set yra[:]
set xtics 0.05
set mxtics 5
set xla '{/Symbol a}'
set yla 'S_s({/Symbol p},{/Symbol p})'
set label "J' = 0.7" at 0.2,8

plot \
"< awk '$2==48 && $4==0.07 {print}' ../accum.dat" u 3:17:18 t 'L = 48' w e lt 6 pt 6 ps 1,\
"< awk '$2==64 && $4==0.07 {print}' ../accum.dat" u 3:17:18 t '64' w e lt 8 pt 8 ps 1,\
"< awk '$2==80 && $4==0.07 {print}' ../accum.dat" u 3:17:18 t '80' w e lt 9 pt 12 ps 1,\
"< awk '$2==96 && $4==0.07 {print}' ../accum.dat" u 3:17:18 t '96' w e lt 7 pt 4 ps 1,
