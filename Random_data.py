import sys
import random
import os

if __name__ == '__main__':

    train = open("train.txt", "w")
    val = open("val.txt", "w")
    random.seed('1214')

    for i in sys.argv[1:]:
        with open("test.txt") as f:
            if i in f.read():
                continue
            elif "mufichecker.xml" in i:
                continue
            else:
                i = os.path.abspath(i)
                monRand = random.random()
                if monRand <= 0.1:
                    val.write(i+"\n")
                else:
                    train.write(i+"\n")

    train.close()
    val.close()

for file in ("train.txt", "val.txt", "test.txt"):
    with open(file) as inp:
        with open(file.replace(".txt", ".mufichecker.txt"), "w") as out:
            for line in inp:
                out.write(line.replace(".xml", ".mufichecker.xml"))

