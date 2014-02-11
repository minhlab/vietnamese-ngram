#!/bin/bash

. ./env.sh

echo "Build ARPA and binary models of Vietnamese"

echo "First, estimate a 5-gram kneser-ney language model from RIVF-2013 corpus 1."

java -ea -mx1000m -server -cp berkeleylm.jar edu.berkeley.nlp.lm.io.MakeKneserNeyArpaFromText 5 segmented.arpa $SEGMENTED_CORPUS_TRAIN

echo "Second, build a hash-based language model binary from the ARPA file."

java -ea -mx1000m -server -cp berkeleylm.jar edu.berkeley.nlp.lm.io.MakeLmBinaryFromArpa segmented.arpa segmented.binary

echo "Compute log probability of RIVF-2013 corpus 2"

java -ea -mx1000m -server -cp berkeleylm.jar edu.berkeley.nlp.lm.io.ComputeLogProbabilityOfTextStream segmented.binary $SEGMENTED_CORPUS_VALID

echo "Number of sentences in validate corpus:"
wc -l $SEGMENTED_CORPUS_VALID | tail -n 1

echo "Number of words in validate corpus:"
wc -w $SEGMENTED_CORPUS_VALID | tail -n 1

