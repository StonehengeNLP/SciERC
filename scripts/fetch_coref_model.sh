SCIIE_PACK_ORIGIN=$(python3 -c 'import importlib; print(importlib.util.find_spec("sciie").origin)')
SCIIE_PATH=$(dirname $SCIIE_PACK_ORIGIN)
LOGS_PATH=$SCIIE_PATH/logs

cd 

if [ ! -d $LOGS_PATH ]; then
    mkdir -p $LOGS_PATH
fi

wget https://storage.googleapis.com/scierc/scientific_best_coref.zip -P $LOGS_PATH
unzip $LOGS_PATH/scientific_best_coref.zip -d $LOGS_PATH