#!/bin/sh

sumit() {
  paste -sd+ - | bc
}

processit() {
  FILE=$1
  FILE=${FILE%.tsv.gz}
  gzcat $FILE.tsv.gz | grep -Eo 'bytes=[0-9]+' | cut -d= -f2 > $FILE.bytes
  cat $FILE.bytes | sumit > $FILE.sum
}

for file in *.tsv.gz
do
  process $file
done

cat *.sum | sumit
