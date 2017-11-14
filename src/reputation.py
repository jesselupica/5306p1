from __future__ import division
from tqdm import tqdm

import os

if __name__ == "__main__":
    results = {}
    for filename in tqdm(os.listdir("../data/reputation")):
        language = filename.split(".")[0]
        reps = []
        with open("../data/reputation/" + filename, 'r') as f:
            for line in f:
                if line.startswith("Id"):
                    continue
                _, rep = line.split(",")
                rep = int(rep.replace('"', ""))
                reps.append(rep)

        results[language] = sorted(reps)[int(len(reps)/2)]

    for language, rep in results.iteritems():
        print language + ": " + str(rep)
