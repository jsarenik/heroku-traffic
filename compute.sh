#!/bin/sh

sumit() {
  paste -sd+ - | bc
}

processit() {
  FILE=$1
  FILE=${FILE%.tsv.gz}
  gzcat $FILE.tsv.gz | grep -Eo 'bytes=[0-9]+' | cut -d= -f2 > $FILE.bytes
}

for file in *.tsv.gz
do
  processit $file
done

cat *.bytes | sumit
