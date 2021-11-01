#!/usr/bin/env bash

# Help
help() {
	echo "$1;"
    echo "Plots single or multiple benchmark results into .png file."
    echo "Only the first argument can be reference a flatzingo encoding."
    echo "Requires the following file structure, where prj can be any directory."
    echo "prj/tools/benchmark_plotter.sh"
    echo "prj/tools/plot_result.rkt"
    echo "prj/benchmarks/		Contains benchmark results."
    echo "prj/flatzingo/benchmarks/	Contains benchmark results for flatzingo."
    echo
    echo "Requires racket"
    echo
    echo "Syntax: benchmark_plotter.sh [-h] <log?> <solver> [<solver>] [<solver>] [<solver>]"
    echo "options:"
    echo "h    Print this Help."
    echo
}

# Plotting
# plot flat? number_of_solvers solvers..
plot() {
    for i in $DIRPATH/benchmarks/*.lp; do
	local benchmark=${i%.lp}
	local benchmarkname=${benchmark##*/}
	local flatbenchmark=$DIRPATH/flatzingo/benchmarks/$benchmarkname
	case $1 in
	    0) # no flatzingo
		case $2 in
		    1)
			racket $TOOLPATH/plot_result.rkt $3 ${benchmark}.png ${benchmark}_${4}.txt
			;;
		    2)
			racket $TOOLPATH/plot_result.rkt $3 ${benchmark}.png ${benchmark}_${4}.txt ${benchmark}_${5}.txt
			;;
		    3)
			racket $TOOLPATH/plot_result.rkt $3 ${benchmark}.png ${benchmark}_${4}.txt ${benchmark}_${5}.txt ${benchmark}_${6}.txt
			;;
		    4)
			racket $TOOLPATH/plot_result.rkt $3 ${benchmark}.png ${benchmark}_${4}.txt ${benchmark}_${5}.txt ${benchmark}_${6}.txt ${benchmark}_${7}.txt
			;;
		esac
		;;
	    1) # flatzingo
		case $2 in
		    1)
			racket $TOOLPATH/plot_result.rkt $3 ${benchmark}.png ${flatbenchmark}_flat.txt
			;;
		    2)
			racket $TOOLPATH/plot_result.rkt $3 ${benchmark}.png ${flatbenchmark}_flat.txt ${benchmark}_${5}.txt
			;;
		    3)
			racket $TOOLPATH/plot_result.rkt $3 ${benchmark}.png ${flatbenchmark}_flat.txt ${benchmark}_${5}.txt ${benchmark}_${6}.txt
			;;
		    4)
			racket $TOOLPATH/plot_result.rkt $3 ${benchmark}.png ${flatbenchmark}_flat.txt ${benchmark}_${5}.txt ${benchmark}_${6}.txt ${benchmark}_${7}.txt
			;;
		esac
		;;
	esac
	echo "Plotting complete. Result can be found in ${benchmark}.png." 	
    done		
}

# Main program
TOOLPATH=${0%/*}
DIRPATH=$TOOLPATH/..
while getopts ":h" option; do
    case $option in
    	h) # display Help
    		help
    		exit;;
    	\?) # invalid option
    		echo "Error: Invalid option"
		exit;;
    esac
done

if [[ -n $2 ]]; then
    if [[ $2 == "flat" ]]; then
	flat=1
    else
	flat=0
    fi
    if [[ -n $3 ]]; then
	if [[ -n $4 ]]; then
	    if [[ -n $5 ]]; then
		plot $flat 4 $1 $2 $3 $4 $5
		echo "Finished."
		exit
	    fi
	    plot $flat 3 $1 $2 $3 $4
	    echo "Finished."
	    exit
	fi
	plot $flat 2 $1 $2 $3
    	echo "Finished."
	exit
    fi
    plot $flat 1 $1 $2
    echo "Finished."
    exit
fi
echo "Error, Argument expected."
