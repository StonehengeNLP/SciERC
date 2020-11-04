#!/bin/bash

SCIIE_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; cd ../sciie ; pwd -P )"

EMB_PATH=$SCIIE_PATH/embeddings
if [ ! -d $EMB_PATH ]; then
  mkdir -p $EMB_PATH
fi

if [ ! -f $EMB_PATH/glove.840B.300d.txt ]; then
  # wget http://nlp.stanford.edu/data/glove.840B.300d.zip
  wget https://storage.googleapis.com/scierc/glove.840B.300d.zip -P $EMB_PATH
  unzip $EMB_PATH/glove.840B.300d.zip -d $EMB_PATH
  rm $EMB_PATH/glove.840B.300d.zip
fi

if [ ! -f $EMB_PATH/glove_50_300_2.txt ]; then
  # wget https://dada.cs.washington.edu/qasrl/data/glove_50_300_2.zip
  wget https://storage.googleapis.com/scierc/glove_50_300_2.zip -P $EMB_PATH
  unzip $EMB_PATH/glove_50_300_2.zip -d $EMB_PATH
  rm $EMB_PATH/glove_50_300_2.zip
fi


DATA_PATH=$SCIIE_PATH/data
if [ ! -d $DATA_PATH ]; then
  mkdir -p $DATA_PATH
fi

# Get srl-conll package.
if [ ! -d $DATA_PATH/processed_data ]; then
  # wget -O $DATA_PATH/sciERC_processed.tar.gz http://ssli.ee.washington.edu/tial/projects/sciIE/data/sciERC_processed.tar.gz
  wget -O $DATA_PATH/sciERC_processed.tar.gz https://storage.googleapis.com/scierc/sciERC_processed.tar.gz
  tar xf $DATA_PATH/sciERC_processed.tar.gz -C $DATA_PATH
  rm $DATA_PATH/sciERC_processed.tar.gz
fi

python3 scripts/filter_embeddings.py ${EMB_PATH}/glove.840B.300d.txt ${EMB_PATH}/glove.840B.300d.txt.filtered ${DATA_PATH}/processed_data/json/train.json ${DATA_PATH}/processed_data/json/dev.json

python3 scripts/get_char_vocab.py 
