from __future__ import division
from tqdm import tqdm

import os

if __name__ == "__main__":
    results = {}
    for filename in tqdm(os.listdir("../data/up_down_ratio")):
        language = filename.split(".")[0]
        ratios = []
        with open("../data/up_down_ratio/" + filename, 'r') as f:
            for line in f:
                if line.startswith("Id"):
                    continue
                _, up, down = line.split(",")
                up = int(up.replace('"', ""))
                down = int(down.replace('"', ""))
                ratios.append(up/(up+down))

        results[language] = sum(ratios)/len(ratios)

    for language, ratio in results.iteritems():
        print language + ": " + str(ratio)
