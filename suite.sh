#!/bin/bash

cd binarytrees
go build -o main

for i in `seq 1 30`; do
    echo "$i binarytrees.go 7" >> suite_log.txt
    ./main 7 >> suite_log.txt

    echo "$i binarytrees.go 7" >> rc_suite_log.txt
    GOGC=off ./main 7 >> rc_suite_log.txt
done

for i in `seq 1 30`; do
    echo "$i binarytrees.go 14" >> suite_log.txt
    ./main 14 >> suite_log.txt

    echo "$i binarytrees.go 14" >> rc_suite_log.txt
    GOGC=off ./main 14 >> rc_suite_log.txt
done

for i in `seq 1 30`; do
    echo "$i binarytrees.go 21" >> suite_log.txt
    ./main 21 >> suite_log.txt

    echo "$i binarytrees.go 21" >> rc_suite_log.txt
    GOGC=off ./main 21 >> rc_suite_log.txt
done


cd ../chameneosredux
go build -o main

for i in `seq 1 30`; do
    echo "$i chameneosredux.go 60000" >> suite_log.txt
    ./main 60000 >> suite_log.txt

    echo "$i chameneosredux.go 60000" >> rc_suite_log.txt
    GOGC=off ./main 60000 >> rc_suite_log.txt
done

for i in `seq 1 30`; do
    echo "$i chameneosredux.go 600000" >> suite_log.txt
    ./main 600000 >> suite_log.txt

    echo "$i chameneosredux.go 600000" >> rc_suite_log.txt
    GOGC=off ./main 600000 >> rc_suite_log.txt
done

for i in `seq 1 30`; do
    echo "$i chameneosredux.go 6000000" >> suite_log.txt
    ./main 6000000 >> suite_log.txt

    echo "$i chameneosredux.go 6000000" >> rc_suite_log.txt
    GOGC=off ./main 6000000 >> rc_suite_log.txt
done

cd ../fannkuchredux
go build -o main

for i in `seq 1 30`; do
    echo "$i fannkuchredux.go 10" >> suite_log.txt
    ./main 10 >> suite_log.txt

    echo "$i fannkuchredux.go 10" >> rc_suite_log.txt
    GOGC=off ./main 10 >> rc_suite_log.txt
done

for i in `seq 1 30`; do
    echo "$i fannkuchredux.go 11" >> suite_log.txt
    ./main 11 >> suite_log.txt

    echo "$i fannkuchredux.go 11" >> rc_suite_log.txt
    GOGC=off ./main 11 >> rc_suite_log.txt
done

for i in `seq 1 30`; do
    echo "$i fannkuchredux.go 12" >> suite_log.txt
    ./main 12 >> suite_log.txt

    echo "$i fannkuchredux.go 12" >> rc_suite_log.txt
    GOGC=off ./main 12 >> rc_suite_log.txt
done

cd ../meteor
go build -o main

for i in `seq 1 30`; do
    echo "$i meteor.go 2098" >> suite_log.txt
    ./main 2098 >> suite_log.txt

    echo "$i meteor.go 2098" >> rc_suite_log.txt
    GOGC=off ./main 2098 >> rc_suite_log.txt
done

cd ../nbody
go build -o main

for i in `seq 1 30`; do
    echo "$i nbody.go 500000" >> suite_log.txt
    ./main 500000 >> suite_log.txt

    echo "$i nbody.go 500000" >> rc_suite_log.txt
    GOGC=off ./main 500000 >> rc_suite_log.txt
done

for i in `seq 1 30`; do
    echo "$i nbody.go 5000000" >> suite_log.txt
    ./main 5000000 >> suite_log.txt

    echo "$i nbody.go 5000000" >> rc_suite_log.txt
    GOGC=off ./main 5000000 >> rc_suite_log.txt
done

for i in `seq 1 30`; do
    echo "$i nbody.go 50000000" >> suite_log.txt
    ./main 50000000 >> suite_log.txt

    echo "$i nbody.go 50000000" >> rc_suite_log.txt
    GOGC=off ./main 50000000 >> rc_suite_log.txt
done

cd ../spectralnorm
go build -o main

for i in `seq 1 30`; do
    echo "$i spectralnorm.go 500" >> suite_log.txt
    ./main 500 >> suite_log.txt

    echo "$i spectralnorm.go 500" >> rc_suite_log.txt
    GOGC=off ./main 500 >> rc_suite_log.txt
done

for i in `seq 1 30`; do
    echo "$i spectralnorm.go 3000" >> suite_log.txt
    ./main 3000 >> suite_log.txt

    echo "$i spectralnorm.go 3000" >> rc_suite_log.txt
    GOGC=off ./main 3000 >> rc_suite_log.txt
done

for i in `seq 1 30`; do
    echo "$i spectralnorm.go 5500" >> suite_log.txt
    ./main 5500 >> suite_log.txt

    echo "$i spectralnorm.go 5500" >> rc_suite_log.txt
    GOGC=off ./main 5500 >> rc_suite_log.txt
done

cd ../threadring
go build -o main

for i in `seq 1 30`; do
    echo "$i threadring.go 500000" >> suite_log.txt
    ./main 500000 >> suite_log.txt

    echo "$i threadring.go 500000" >> rc_suite_log.txt
    GOGC=off ./main 500000 >> rc_suite_log.txt
done

for i in `seq 1 30`; do
    echo "$i threadring.go 5000000" >> suite_log.txt
    ./main 5000000 >> suite_log.txt

    echo "$i threadring.go 5000000" >> rc_suite_log.txt
    GOGC=off ./main 5000000 >> rc_suite_log.txt
done

for i in `seq 1 30`; do
    echo "$i threadring.go 50000000" >> suite_log.txt
    ./main 50000000 >> suite_log.txt

    echo "$i threadring.go 50000000" >> rc_suite_log.txt
    GOGC=off ./main 50000000 >> rc_suite_log.txt
done

echo "\n ThEnd"
