#!/usr/bin/gnuplot

set terminal png enhanced font "Helvetica,20" size 1920,1080
set output 'cumulative_total_conventional.png'
set title "cumulative total"

set key autotitle columnhead
set autoscale

set xlabel "Date"
set xdata time
set timefmt "%Y-%m-%d"

# data ranges select
set xrange ["2020-01-01" : "2022-01-01"]

set ylabel "No. of reported cases"
#set logscale y
#set logscale y2

set datafile separator ','
plot '../epidemic/cases_malaysia.csv' using 1:2 with points t "Daily reported cases", \
	'../epidemic/cases_malaysia.csv' using 1:2 smooth sbezier t "Daily reported cases (curve smoothed)" lw 2, \
    '../epidemic/cases_malaysia.csv' using 1:2 smooth cumulative t "Cumulative total of reported cases" lc "red"