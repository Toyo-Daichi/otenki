#!/bin/bash
#Himawari8 from https://storage.tenki.jp 

dir=`pwd`

YYYY=2020
MM=09
DD=(
01 02 03 04 05 06 07 08 09 10
11 12 13 14 15 16 17 18 18 20
)
HH=(
01 02 03 04 05 06 07 08 09 10
11 12 13 14 15 16 17 18 19 20
21 22 23 24
)

#
mkdir -p ${dir}/himawari8/gif
mkdir -p ${dir}/himawari8/png

for day in ${DD[@]}; do
mkdir -p ${dir}/himawari8/png/${YYYY}${MM}${DD}

for hr in ${HH[@]}; do
wget https://storage.tenki.jp/archive/satellite/${YYYY}/${MM}/${day}/${hr}/00/00/japan-near-large.jpg \
-O ${dir}/himawari8/png/${YYYY}${MM}${day}/${YYYY}${MM}${day}${hr}.jpg 
sleep 0.1s

done # hr

convert -loop 0 -delay 50 \
${dir}/himawari/png/${YYYY}${MM}${day}/*.jpg ${dir}/himawari8/gif/${yyyy}${mon}${day}.gif

done #day

exit

