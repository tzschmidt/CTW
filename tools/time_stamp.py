# python script to timestamp stdout since command execution
# usage: command | python time_stamp.py
import sys,time;
time_start = time.time_ns()//1000000
for line in sys.stdin:
    time_in_ms = time.time_ns()//1000000-time_start
    sys.stdout.write("".join(( " ".join((time.strftime("%M:%S.{}".format(time_in_ms%1000), time.gmtime(time_in_ms//1000)), line)))))
