#!/bin/bash

for i in {1..100}; do
  echo $RANDOM >> SomeRandomNumbers.txt
done

sort SomeRandomNumbers.txt

