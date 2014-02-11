#!/bin/bash

. ./env.sh

echo "Build ARPA and binary models of Vietnamese"

echo "First, estimate a 5-gram kneser-ney language model from RIVF-2013 unsegmented corpus 1."

java -ea -mx1000m -server -cp berkeleylm.jar edu.berkeley.nlp.lm.io.MakeKneserNeyArpaFromText 5 unsegmented.arpa $UNSEGMENTED_CORPUS_TRAIN

echo "Second, build a hash-based language model binary from the ARPA file."

java -ea -mx1000m -server -cp berkeleylm.jar edu.berkeley.nlp.lm.io.MakeLmBinaryFromArpa unsegmented.arpa unsegmented.binary

echo "Compute log probability of RIVF-2013 corpus 2"

java -ea -mx1000m -server -cp berkeleylm.jar edu.berkeley.nlp.lm.io.ComputeLogProbabilityOfTextStream unsegmented.binary $UNSEGMENTED_CORPUS_VALID

echo "Number of sentences in validate corpus:"
wc -l $UNSEGMENTED_CORPUS_VALID | tail -n 1

echo "Number of words in validate corpus:"
wc -w $UNSEGMENTED_CORPUS_VALID | tail -n 1

