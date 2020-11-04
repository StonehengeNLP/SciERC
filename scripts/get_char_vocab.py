#!/usr/bin/env python

import sys
import json


def get_char_vocab(input_filenames, output_filename):
  vocab = set()
  for filename in input_filenames:
    with open(filename, "r", encoding="utf-8") as f:
      for line in f.readlines():
        for sentence in json.loads(line)["sentences"]:
          for word in sentence:
            vocab.update(word)
  vocab = sorted(list(vocab))
  with open(output_filename, "w", encoding="utf-8") as f:
    for char in vocab:
      f.write(u"{}\n".format(char))
  print(("Wrote {} characters to {}".format(len(vocab), output_filename)))

if __name__ == '__main__':
  sciie_path = sys.argv[1]
  get_char_vocab([sciie_path+'/data/processed_data/json/{}.json'.format(partition) for partition in ("train", "dev", "test")], sciie_path+'/char_vocab.english.txt')
