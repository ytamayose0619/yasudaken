set term post enhanced color 22
set key right
#set log x
#set log y

set xra[0.4:1.0]
set yra[0:0.1]
set xtics 0.2
set ytics 0.02
set mxtics 2 
set mytics 2
set xla '{/Symbol a}'
set yla "J'"
#set label "D" at 0.3,0.4
#set label "AF" at 0.8,0.7

#set arrow from 0.1,0.0 to 0.1,1.0 nohead lt 7

plot \
"./phase2_alter.dat" u 2:1 notitle w lp lt 7 pt 4 ps 1,\
"./phase2_alter.dat" u 3:1 notitle w lp lt 7 pt 4 ps 1,\

#set parametric
#set trange[0:1]
#const=0.1
#plot const,t w l lt 7 
