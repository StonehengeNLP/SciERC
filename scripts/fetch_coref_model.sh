if [ ! -d "./logs" ]; then
    mkdir -p "./logs"
fi

wget http://nlp.cs.washington.edu/sciIE/models/scientific_best_coref.zip
unzip scientific_best_coref.zip -d ./logs