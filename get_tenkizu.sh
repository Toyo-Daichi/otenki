#!/bin/csh -f
#tenkizu from http://www.hbc.co.jp
#							http://agora.ex.nii.ac.jp/digital-typhoon/

#
set dir     = `pwd`
set timeset = 'JST' #"JST" or "UTC"

set s_yy = 2020; set e_yy = 2020
set s_mm =    9; set e_mm =    9
set s_dd =    3; set e_dd =   15
set s_hh =    0; set e_hh =   21

#
mkdir -p ${dir}/tenkizu/png
mkdir -p ${dir}/tenkizu/gif

while ( ${s_yy} <= ${e_yy} ) 

while ( ${s_mm} <= ${e_mm} )
set m0 = ${s_mm}
if( ${s_mm} <= 9 ) set m0 = 0${s_mm}

while ( ${s_dd} <= ${e_dd} )
set d0 = ${s_dd}
if( ${s_dd} <= 9 ) set d0 = 0${s_dd}

mkdir -p ${dir}/tenkizu/png/${s_yy}${m0}${d0}

while ( ${s_hh} <= ${e_hh} )
set h0 = ${s_hh}
if( ${s_hh} <= 9 ) set h0 = 0${s_hh}

if ( ${timeset} == "JST" ) then
	wget http://www.hbc.co.jp/tecweather/archive/pdf/SPAS_${s_yy}${m0}${d0}${h0}.pdf -P ${dir}/tenkizu/png/${s_yy}${m0}${d0}
else if ( ${timeset} == "UTC" ) then
	wget http://agora.ex.nii.ac.jp/digital-typhoon/weather-chart/thumb/js/1280x960/${s_yy}${m0}/${s_yy}${m0}${d0}00.jpg -P ${dir}/tenkizu/png/${s_yy}${m0}${d0}
endif
sleep 0.1s 

@ s_hh = ${s_hh} + 3
end

if ( ${timeset} == "JST" ) then
	convert -loop 0 -delay 150 ${dir}/tenkizu/png/${s_yy}${m0}${d0}/*.pdf ${dir}/tenkizu/gif/${s_yy}${m0}${d0}.gif
else if ( ${timeset} == "UTC" ) then
	convert -loop 0 -delay 150 ${dir}/tenkizu/png/${s_yy}${m0}${d0}/*.jpg ${dir}/tenkizu/gif/${s_yy}${m0}${d0}.gif
endif

@ s_dd = ${s_dd} + 1
end

@ s_mm = ${s_mm} + 1
end

@ s_yy = ${s_yy} + 1
end

exit
