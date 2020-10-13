if [ ! -d "./logs" ]; then
    mkdir -p "./logs"
fi

wget https://storage.googleapis.com/scierc/scientific_best_coref.zip
unzip scientific_best_coref.zip -d ./logs