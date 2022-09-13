#!/bin/bash
#measure elapsed time in bash

start_time=$SECONDS

#Program body
#sleep 5

elapsed=$(( SECONDS - start_time ))
echo $elapsed
eval "echo Elapsed time: $(date -ud "@$elapsed" +'$((%s/3600/24)) days %H hr %M min %S sec')"
