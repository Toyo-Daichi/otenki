#!/bin/bash
#R/A from https://storage.tenki.jp

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
mkdir -p ${dir}/radar/gif
mkdir -p ${dir}/radar/png

for day in ${DD[@]}; do
mkdir -p ${dir}/radar/png/${YYYY}${MM}${day}

for hr in ${HH[@]}; do
wget https://storage.tenki.jp/archive/radar/${YYYY}/${MM}/${day}/${hr}/00/00/area-3-large.jpg \
-O ${dir}/radar/png/${YYYY}${MM}${day}/${YYYY}${MM}${day}${hr}.jpg 
sleep 0.1s

done # hr

convert -loop 0 -delay 50 \
${dir}/radar/png/${YYYY}${MM}${day}/*.jpg ${dir}/radar/gif/${YYYY}${MM}${day}.gif

done #day

exit

