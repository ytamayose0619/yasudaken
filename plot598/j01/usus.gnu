set term post enhanced color 22
set key right
#set log x

#S=1,J'=0.1
set xra[:]
#S=1,J'=0.01
#set xra[0.55:0.65]

set yra[:]
set xtics 0.05
set mxtics 5
set xla '{/Symbol a}'
set yla '{/Symbol c}'
set label "J' = 0.1" at 0.2,0.03

plot \
"< awk '$2==48 && $4==0.1 {print}' ../accum.dat" u 3:11:12 t 'L = 48' w e lt 6 pt 6 ps 1,\
"< awk '$2==64 && $4==0.1 {print}' ../accum.dat" u 3:11:12 t '64' w e lt 8 pt 8 ps 1,\
"< awk '$2==80 && $4==0.1 {print}' ../accum.dat" u 3:11:12 t '80' w e lt 9 pt 12 ps 1,\
"< awk '$2==96 && $4==0.1 {print}' ../accum.dat" u 3:11:12 t '96' w e lt 7 pt 4 ps 1,
