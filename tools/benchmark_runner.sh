#!/usr/bin/env bash

# Help
help() {
    echo "Runs benchmarks with encodings."
    echo "Requires the following file structure, where prj can be any directory."
    echo "prj/tools/benchmark_runner.sh"
    echo "prj/tools/time_stamp.py"
    echo "prj/encodings/			Contains all encodings to be benchmarked."
    echo "prj/benchmarks/			Contains all benchmarks."
    echo "prj/flatzingo/			Contains flatzingo encodings."
    echo "prj/flatzingo/benchmarks/	Contains flatzingo benchmarks."
    echo
    echo "Requires python"
    echo
    echo "Syntax: benchmark_runner.sh [-e|f|h]"
    echo "options:"
    echo "e    Run benchmarks in benchmark/ with encodings in encodings/ ."
    echo "f    Run flatzingo benchmarks with flatzingo."
    echo "h    Print this Help."
    echo
}

# Main program

TOOLPATH=${0%/*}
PATH=$TOOLPATH/..
FLATPATH=$PATH/flatzingo
TIMESTAMP=$PATH/tools/time_stamp.py
TLIMIT=1800

while getopts ":efh" option; do
    case $option in
	e)
	    for i in $PATH/encodings/*.lp; do
		ENCODINGBASE=${i##*/}
		for j in $PATH/benchmarks/*.lp; do
		    RESULTPATH=${j%.lp}.txt
		    if [[ ${ENCODINGBASE:4:3} == "nat" ]]; then
			solver="clingo"
		    elif [[ ${ENCODINGBASE:4:8} == "clingcon" ]]; then
			solver="clingcon"
		    elif [[ ${ENCODINGBASE:4:8} == "clingoDL" ]]; then
			solver="clingo-dl"
		    fi
		    echo "Solving ${j##*/} with ${i##*/} ..."
		    $solver --time-limit=$TLIMIT $i $j | python $TIMESTAMP > $RESULTPATH
		    echo "Done, result can be found in $RESULTPATH"
		done
	    done
	    ;;
	f) 
	    for i in $FLATPATH/benchmarks/*.lp; do
		RESULTPATH=${i%.lp}.txt
		echo "Solving ${i##*/} with flatzingo ..."
		#clingcon --time-limit=$TLIMIT $FLATPATH/encoding.lp $FLATPATH/types.lp $i | python $TIMESTAMP > $RESULTPATH
		echo "Done, result can be found in $RESULTPATH"
	    done
	    ;;
	h)
	    help
	    exit;;
	\?)
	    echo "Error: Invalid option"
	    exit;;
    esac
done

echo "Finished"
