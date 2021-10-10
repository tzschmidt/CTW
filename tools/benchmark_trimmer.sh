#!/usr/bin/env bash

# Help
help() {
	echo "Trims bigger minizinc benchmark instances into smaller ones, ranging from k=50 to 100."
	echo "Requires the following file structure, here prj can be any directory."
	echo "prj/tools/benchmark_trimmer.sh"
	echo "prj/tools/benchmark_filter.rkt"
	echo "prj/benchmarks/minizinc		Contains benchmarks, to be trimmed benchmarks should have prefix "pre"."
	echo
	echo "Requires racket"
	echo
	echo "Syntax: benchmark_trimmer.sh [-h]"
	echo "options:"
	echo "h    Print this Help."
	echo
}

# Main program
TOOLPATH=${0%/*}
PATH=$TOOLPATH/..
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

for i in $PATH/benchmarks/minizinc/pre*.dzn; do
	for j in {50..100..10}; do
		RESULTPATH=${i%.dzn}_k$j.dzn
		echo "Trimming ${i##*/} with k = $j ..."
		Racket benchmark_filter $i $RESULTPATH $j $((j / 2)) 
		echo "Done, result can be found in $RESULTPATH"
	done
done

echo "Trimming complete"
