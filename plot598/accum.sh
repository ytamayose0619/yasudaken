#!/bin/sh

cat ./output2_alter/output2_j* | ./accum_598.pl | sort -n -k1 -k2 -k3 -k4 -k5 > accum.dat
