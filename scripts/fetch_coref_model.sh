SCIIE_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; cd ../sciie ; pwd -P )"
LOGS_PATH=$SCIIE_PATH/logs

if [ ! -d $LOGS_PATH ]; then
    mkdir -p $LOGS_PATH
fi

wget https://storage.googleapis.com/scierc/scientific_best_coref.zip -P $LOGS_PATH
unzip $LOGS_PATH/scientific_best_coref.zip -d $LOGS_PATH