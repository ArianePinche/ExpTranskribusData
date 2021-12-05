#!/bin/sh

echo "Training eScriptorium.normal"
ketos train  -r 0.0001 --lag 20\
 --preload -f alto -e escriptorium.dev.txt -t escriptorium.train.txt -u NFKD --device cuda:0 --batch-size 32 -o eScriptorium.normal --threads 10


echo "Training transkribus.normal"
ketos train  -r 0.0001 --lag 20\
--preload -f alto -e transkribus.dev.txt -t transkribus.train.txt -u NFKD --device cuda:0 --batch-size 32 -o transkribus.normal --threads 10


echo "Training transkribus.repolygonize"
ketos train  -r 0.0001 --lag 20\
 --preload -f alto -e transkribus.dev.txt -t transkribus.train.txt -u NFKD --device cuda:0 --batch-size 32 -o transkribus.repolygonize --threads 10 --repolygonize 