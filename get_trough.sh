#!/bin/csh -f
#500hPa from https://www.sunny-spot.net 

#
set dir     = `pwd`

set s_yy = 2020; set e_yy = 2020
set s_mm =    9; set e_mm =    9
set s_dd =    3; set e_dd =   15

#
mkdir -p ${dir}/trough/png
mkdir -p ${dir}/trough/gif

while ( ${s_yy} <= ${e_yy} ) 

while ( ${s_mm} <= ${e_mm} )
set m0 = ${s_mm}
if( ${s_mm} <= 9 ) set m0 = 0${s_mm}

while ( ${s_dd} <= ${e_dd} )
set d0 = ${s_dd}
if( ${s_dd} <= 9 ) set d0 = 0${s_dd}


while ( ${s_hh} <= ${e_hh} )
set h0 = ${s_hh}
if( ${s_hh} <= 9 ) set h0 = 0${s_hh}

wget https://www.sunny-spot.net/chart/data/AUXN50/${s_yy}/${m0}/AUXN50_${s_yy}${m0}${d0}0036.pdf -P ${dir}/trough/png
sleep 0.1s 

@ s_dd = ${s_dd} + 1
end
convert -loop 0 -delay 50 ${dir}/trough/png/*.pdf ${dir}/trough/gif/${s_yy}${m0}${s_dd}-${e_dd}.gif

@ s_mm = ${s_mm} + 1
end

@ s_yy = ${s_yy} + 1
end

exit
