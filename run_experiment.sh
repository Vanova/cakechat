#!/bin/bash

source activate ai
export PYTHONPATH="${PYTHONPATH}:$(pwd)"

exp_dir=experiment/emotion_test
tst_data=$exp_dir/data.txt
emotions="neutral anger joy laugh disgust"

for emo in $emotions; do
  echo "===== Test: $emo ====="
  while IFS= read -r ln; do
    echo "$ln"
    res=$(python tools/test_api.py -f 127.0.0.1 -p 8080 -c "$ln" -e "$emo")
    # cleaning response
    rcl=$(echo $res | rev | cut -c 3- | rev)
    cl=$(echo $rcl | cut -c 15-)
    echo $cl >> $exp_dir/$emo.txt
  done < "$tst_data"
done



