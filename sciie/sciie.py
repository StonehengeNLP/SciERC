from .write_single import run_experiment
from .util import SCIIE_DIR

def _hash_list(l:list):
    return hash(str(l))

def extract(abstracts:list):
    for abstract in abstracts:
        assert isinstance(abstract, list)
        
    data = [{"clusters": [],
            "sentences": abstract,
            "ner": [[] for _ in range(len(abstract))],
            "relation": [[] for _ in range(len(abstract))],
            "doc_key": _hash_list(abstract)} for abstract in abstracts]
        
    with open(SCIIE_DIR + '/data/processed_data/json/dev.json', 'w') as f:
        for line in data:
            json.dump(line, f)
            f.write('\n')
    
    run_experiment('scientific_best_coref')