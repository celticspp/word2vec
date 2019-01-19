make
if [ ! -e text8 ]; then
    if [ ! -e text8.gz];then
      wget http://mattmahoney.net/dc/text8.zip -O text8.gz
    fi
    #gzip -d text8.gz -f
    tar zxvf text8.gz text8
fi
time ./word2vec -train text8 -output vectors.bin -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
./distance vectors.bin
