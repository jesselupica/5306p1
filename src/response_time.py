from __future__ import division
from tqdm import tqdm

import os

if __name__ == "__main__":
    results = {}
    for filename in tqdm(os.listdir("../data/response_time")):
        language = filename.split(".")[0]
        times = []
        with open("../data/response_time/" + filename, 'r') as f:
            for line in f:
                if line.startswith("Id"):
                    continue
                _, response_time = line.split(",")
                response_time = int(response_time.replace('"', ""))
                times.append(response_time)

        results[language] = sorted(times)[int(len(times)/2)]

    for language, response_time in results.iteritems():
        print language + ": " + str(response_time)
