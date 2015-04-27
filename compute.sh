#!/bin/sh

gzcat *.tsv.gz | grep -Eo 'bytes=[0-9]+' | cut -d= -f2 | paste -sd+ - | bc
