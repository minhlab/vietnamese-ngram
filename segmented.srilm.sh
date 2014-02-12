#!/bin/bash

. ./env.sh

echo "Estimate n-gram model from"
echo $SEGMENTED_CORPUS_TRAIN

cat $SEGMENTED_CORPUS_TRAIN > /tmp/segmented.train.txt
ngram-count -ukndiscount -order 5 -lm segmented.srilm.arpa -text /tmp/segmented.train.txt

echo "Compute log probability of RIVF-2013 corpus 2"

cat $SEGMENTED_CORPUS_VALID > /tmp/segmented.valid.txt
ngram -lm segmented.srilm.arpa -ppl /tmp/segmented.valid.txt

