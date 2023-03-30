set term post enhanced color 22
set key left

f(x,y)=(x-ac)*y**(1./nu)
g(x,y)=a+b*f(x,y)+c*f(x,y)**2
k(x)=a+b*x+c*x**2
ac=0.085; nu=0.71; a=1.; b=1e-03; c=1e-05

#fit [x=0.08:0.09] g(x,y) \
#"< awk '(($2==96 && $4==1) || ($2==80 && $4==1) || ($2==64 && $4==1)){print}' ../accum.dat" u 3:2:($27/$2):($28/$2) via ac,a,b,c

ac              = 0.0856079    #    +/- 0.0002114    (0.2469%)
a               = 0.298988     #    +/- 0.005212     (1.743%)
b               = 0.053207     #    +/- 0.0009994    (1.878%)
c               = 0.00251093   #    +/- 0.0004029    (16.04%)

set xra[-2:2]
set yra[:]
set xla 'L^{1/{/Symbol n}}({/Symbol a}-{/Symbol a}_c)'
set yla '{/Symbol x}_x / L'
set label "J' = 1" at 0.2, 0.22
set label '{/Symbol a}_c =0.0856(2) ' at 0.2, 0.18

plot \
"< awk '$2==96 && $4==1 {print}' ../accum.dat" u (f($3,$2)):($27/$2):($28/$2) t 'L = 96' w e lt 7 pt 4 ps 1.,\
"< awk '$2==80 && $4==1 {print}' ../accum.dat" u (f($3,$2)):($27/$2):($28/$2) t '80' w e lt 9 pt 12 ps 1.,\
"< awk '$2==64 && $4==1 {print}' ../accum.dat" u (f($3,$2)):($27/$2):($28/$2) t '64' w e lt 8 pt 8 ps 1.,\
k(x) notitle lt 3

