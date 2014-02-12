#!/bin/bash

. ./env.sh

echo "Estimate n-gram model from"
echo $UNSEGMENTED_CORPUS_TRAIN

cat $UNSEGMENTED_CORPUS_TRAIN > /tmp/unsegmented.train.txt
ngram-count -ukndiscount -order 5 -lm unsegmented.srilm.arpa -text /tmp/unsegmented.train.txt

echo "Compute log probability of RIVF-2013 corpus 2"

cat $UNSEGMENTED_CORPUS_VALID > /tmp/unsegmented.valid.txt
ngram -lm unsegmented.srilm.arpa -ppl /tmp/unsegmented.valid.txt

