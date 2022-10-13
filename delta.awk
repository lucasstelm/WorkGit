BEGIN {arrdelay=0; depdelay=0} 
$9~/DL/ {if ($15>0) arrdelay+=$15}
$9~/DL/ {if ($16>0) depdelay+=$16}
END {print "Atraso total de chegada: " arrdelay; print "Atraso total de partida: " depdelay; print "Atraso total: " arrdelay+depdelay}