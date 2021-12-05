#!/bin/sh

echo "Training eScriptorium"
ketos train  -r 0.0001 --lag 20\
 --preload -f alto -e escriptorium.dev.txt -t escriptorium.train.txt -u NFKD --device cuda:0 --batch-size 32 -o eScriptorium.normal --threads 10


echo "Training transkribus_SimpleNoRepoly"
ketos train  -r 0.0001 --lag 20\
--preload -f alto -e TranskribusSimpleMask_nopoly_dev.txt -t TranskribusSimpleMask_nopoly_train.txt -u NFKD --device cuda:0 --batch-size 32 -o transkribus_SimpleNoRepoly --threads 10


echo "Training transkribus_SimpleRepoly"
ketos train  -r 0.0001 --lag 20\
 --preload -f alto -e TranskribusSimpleMask_poly_dev.txt -t TranskribusSimpleMask_poly_train.txt -u NFKD --device cuda:0 --batch-size 32 -o transkribus_SimpleRepoly --threads 10


echo "Training transkribus_ComplexNoRepoly"
ketos train  -r 0.0001 --lag 20\
--preload -f alto -e TranskribusComplexMask_nopoly_dev.txt -t TranskribusComplexMask_nopoly_train.txt -u NFKD --device cuda:0 --batch-size 32 -o transkribus_ComplexNoRepoly --threads 10

echo "Training transkribus_ComplexRepoly"
ketos train  -r 0.0001 --lag 20\
 --preload -f alto -e TranskribusComplexMask_poly_dev.txt -t TranskribusComplexMask_poly_train.txt -u NFKD --device cuda:0 --batch-size 32 -o transkribus_ComplexRepoly --threads 10