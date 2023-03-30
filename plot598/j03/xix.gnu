set term post enhanced color 22
set key left
#set log x
#set log y

#S=1, J'=0.3
set xra[0.195:0.205]
#S=1, J'=0.03
#set xra[0.528:0.538]
#set xra[0.655:0.665]

set yra[:]
set xtic 0.005
set mxtic 5
set xla '{/Symbol a}'
set yla '{/Symbol x}_x / L'
set label "J' = 0.3" at 0.2,0.3

plot \
"< awk '$2==48 && $4==0.3 {print}' ../accum.dat" u 3:($27/$2):($28/$2) t 'L = 48' w e lt 6 pt 6 ps 1,\
"< awk '$2==64 && $4==0.3 {print}' ../accum.dat" u 3:($27/$2):($28/$2) t '64' w e lt 8 pt 8 ps 1,\
"< awk '$2==80 && $4==0.3 {print}' ../accum.dat" u 3:($27/$2):($28/$2) t '80' w e lt 9 pt 12 ps 1,\
"< awk '$2==96 && $4==0.3 {print}' ../accum.dat" u 3:($27/$2):($28/$2) t '96' w e lt 7 pt 4 ps 1,\

