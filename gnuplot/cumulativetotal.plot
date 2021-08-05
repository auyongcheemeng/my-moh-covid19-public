#!/usr/bin/gnuplot

set terminal png enhanced font "Helvetica,20" size 1920,1080
set output 'cumulative_total.png'
set title "cumulative total"

set key autotitle columnhead
set xdata time
set timefmt "%Y-%m-%d"
#set xrange ["2021-01-01" : *]
set logscale y
#set logscale y2

set datafile separator ','
plot '../epidemic/cases_malaysia.csv' using 1:2 with points, \
	'../epidemic/cases_malaysia.csv' using 1:2 smooth sbezier t "bezier" lw 2, \
    '../epidemic/cases_malaysia.csv' using 1:2 smooth cumulative t 'smooth cumulative' lc "red"