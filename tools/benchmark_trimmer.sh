#!/usr/bin/env bash

# Help
help() {
	echo "Trims bigger minizinc benchmark instances into smaller ones, ranging from k=50 to 100."
	echo "Requires the following file structure, where prj can be any directory."
	echo "prj/tools/benchmark_trimmer.sh"
	echo "prj/tools/benchmark_filter.rkt"
	echo "prj/benchmarks/minizinc		Contains benchmarks, to be trimmed benchmarks should have prefix "pre_"."
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

for i in $DIRPATH/benchmarks/minizinc/pre_*.dzn; do
	NAME=${i##*/}
	NEWNAME=${NAME:4}
	for j in {50..100..10}; do
		RESULTPATH=$DIRPATH/benchmarks/minizinc/${NEWNAME%.dzn}_k$j.dzn
		echo "Trimming ${i##*/} with k = $j ..."
		racket $TOOLPATH/benchmark_filter.rkt $i $RESULTPATH $j $((j / 2)) 
		echo "Done, result can be found in $RESULTPATH"
	done
done

echo "Trimming complete"
