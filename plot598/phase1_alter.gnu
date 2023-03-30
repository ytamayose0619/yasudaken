set term post enhanced color 22
set key right
#set log x
#set log y

set xra[0:1.0]
set yra[0:1.0]
set xtics 0.2
set ytics 0.2
#set mxtic 
#set xla '{/Symbol a}'
#set yla "J'"
set label "D" at 0.3,0.4
set label "AF" at 0.8,0.7



plot \
"./phase1_alter.dat" u 2:1 t "" w lp lt 7 pt 4 ps 1,\
#"./phase1_alter.dat" u 1:2 t "J'-{/Symbol a}" w lp lt 6 pt 8 ps 1

