#!/usr/bin/env bash

# Help
help() {
    echo "Converts minizinc benchmark instances into ASP instances for flatzingo and other encodings."
    echo "Requires the following file structure, where prj can be any directory."
    echo "prj/tools/benchmark_converter.sh"
    echo "prj/tools/benchmark_converter.rkt"
    echo "prj/benchmarks/minizinc/	    Contains benchmarks, to be converted."
    echo "prj/flatzingo/		    Contains ctw.mzn."
    echo "prj/flatzingo/benchmarks/	    Will contain converted flatzingo instances."
    echo "prj/flatzingo/fzn/		    Will contain temporary fzn files."
    echo
    echo "Requires racket"
    echo "Requires minizinc"
    echo "Requires fzn2lp"
    echo
    echo "Syntax: benchmark_converter.sh [-h]"
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

for i in $DIRPATH/benchmarks/minizinc/*.dzn; do
    NAME=${i##*/}
    FZNPATH=$DIRPATH/flatzingo/fzn/${NAME%.dzn}.fzn
    FLATRESULT=$DIRPATH/flatzingo/benchmarks/${NAME%.dzn}.lp
    STDRESULT=$DIRPATH/benchmarks/${NAME%.dzn}.lp
    echo "Converting ${i##*/}"
    minizinc --solver flatzingo -c --output-fzn-to-stdout $DIRPATH/flatzingo/ctw.mzn $i > $FZNPATH 
    fzn2lp $FZNPATH > $FLATRESULT
    racket $TOOLPATH/dzn2lp.rkt ${NAME%.dzn} $i $STDRESULT 
    echo "Done, result can be found in $FLATRESULT and $STDRESULT"
done

echo "Converting complete"
