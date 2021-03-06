#!/bin/bash

object_size="1000"
object_rate="10 20 30 40 50"
data_part_size="1000000"
num_data_parts="10 20 30 40 50"

for dpsz in $data_part_size; do
    for ndp in $num_data_parts; do
        for osz in $object_size; do
            for orate in $object_rate; do
                if ! grep -q " $osz $orate $dpsz $ndp " client.results; then
                    ./cloudlab-client.sh $osz $orate $dpsz $ndp
                    sleep 2
                fi
            done
        done
    done
done
