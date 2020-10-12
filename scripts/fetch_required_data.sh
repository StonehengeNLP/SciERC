#!/bin/bash


EMB_PATH="./embeddings"
if [ ! -d $EMB_PATH ]; then
  mkdir -p $EMB_PATH
fi

cd embeddings

if [ ! -f "glove.840B.300d.txt" ]; then
  # wget http://nlp.stanford.edu/data/glove.840B.300d.zip
  wget https://storage.googleapis.com/mag-tongplw/mag/glove.840B.300d.zip
  unzip glove.840B.300d.zip
  rm glove.840B.300d.zip
fi

if [ ! -f "glove_50_300_2.txt" ]; then
  # wget https://dada.cs.washington.edu/qasrl/data/glove_50_300_2.zip
  wget https://storage.googleapis.com/mag-tongplw/mag/glove_50_300_2.zip
  unzip glove_50_300_2.zip
  rm glove_50_300_2.zip
fi

cd $OLDPWD

DATA_PATH="./data/"
if [ ! -d $DATA_PATH ]; then
  mkdir -p $DATA_PATH
fi

# Get srl-conll package.
if [ ! -d "processed_data" ]; then
  wget -O "${DATA_PATH}/sciERC_processed.tar.gz" http://ssli.ee.washington.edu/tial/projects/sciIE/data/sciERC_processed.tar.gz
  tar xf "${DATA_PATH}/sciERC_processed.tar.gz" -C "${DATA_PATH}"
  rm "${DATA_PATH}/sciERC_processed.tar.gz"
fi

python scripts/filter_embeddings.py ${EMB_PATH}/glove.840B.300d.txt ${EMB_PATH}/glove.840B.300d.txt.filtered ${DATA_PATH}/processed_data/json/train.json ${DATA_PATH}/processed_data/json/dev.json

python scripts/get_char_vocab.py 
