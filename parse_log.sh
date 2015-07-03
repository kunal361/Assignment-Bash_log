#!/bin/bash
echo "max_time : request"
echo `grep ':' tmp_more_than_50|awk '{l=$0;getline;print l " " $0;}'|cut -d\( -f1|awk '{printf "%s : ",$NF;{for(f=1;f<NF-4;f++)printf "%s\t",$f;printf "\n"}}'|sort -nr|sed q`