#!/bin/bash

for i in `ls *.html`; do 
    echo $i;
    csplit $i "/=====/+1" && csplit xx01 "/=====/-1"
    mv xx00 $i
done

