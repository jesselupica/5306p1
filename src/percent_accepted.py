from __future__ import division
from tqdm import tqdm

import os

if __name__ == "__main__":
    results = {}
    for filename in tqdm(os.listdir("../data/percent_answered")):
        language = filename.split(".")[0]
        answered = []
        with open("../data/percent_answered/" + filename, 'r') as f:
            for line in f:
                if line.startswith("Id"):
                    continue
                _, has_answer = line.split(",")
                has_answer = int(has_answer.replace('"', ""))
                answered.append(bool(has_answer))

        results[language] = answered.count(True) / len(answered)

    for language, percent_answered in results.iteritems():
        print language + ": " + str(percent_answered)
