. ./env.sh

ALL_CORPORA="$UNSEGMENTED_CORPUS_TRAIN $SEGMENTED_CORPUS_TRAIN $UNSEGMENTED_CORPUS_VALID $SEGMENTED_CORPUS_VALID"

echo "Remove tags and blank lines in those files:"
echo $ALL_CORPORA

sed -i '/^<.*>/d' $ALL_CORPORA

sed -i '/^\s*$/d' $ALL_CORPORA
