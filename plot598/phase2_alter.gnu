set term post enhanced color 22
set key right
#set log x
#set log y

set xra[0:1.0]
set yra[0:1.0]
set xtics (0,0.1,0.2,0.4,0.6,0.8,1)
set ytics (0,0.1,0.2,0.4,0.6,0.8,1)
#set mxtic 
set xla '{/Symbol a}'
set yla "J'"
#set label "D" at 0.3,0.4
#set label "AF" at 0.8,0.7

set arrow from 0.1,0.0 to 0.1,1.0 nohead lt 7

k(x)=0.1
plot \
"./phase2_alter.dat" u 2:1 notitle w lp lt 7 pt 4 ps 1,\
"./phase2_alter.dat" u 3:1 notitle w lp lt 7 pt 4 ps 1,\
k(x) notitle lt 7

#set parametric
#set trange[0:1]
#const=0.1
#plot const,t w l lt 7 
