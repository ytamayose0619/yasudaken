set term post enhanced color 22
set key right
#set log x
#set log y

set xra[:]
set yra[:]
set xla '{/Symbol a}'
set yla '{/Symbol x}_x / L'
set label "J' = 0.15" at 0.4,0.2

plot \
"< awk '$2==32 && $4==0.15 {print}' ../accum.dat" u 3:($27/$2):($28/$2) t 'L = 32' w e lt 7 pt 4 ps 1,\
"< awk '$2==48 && $4==0.15 {print}' ../accum.dat" u 3:($27/$2):($28/$2) t '48' w e lt 6 pt 6 ps 1,\
"< awk '$2==64 && $4==0.15 {print}' ../accum.dat" u 3:($27/$2):($28/$2) t '64' w e lt 8 pt 8 ps 1 
