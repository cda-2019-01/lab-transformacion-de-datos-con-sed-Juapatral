# Escriba su código aquí

sed 's/,/\./' data.csv > out.csv # decimales
sed 's/;/,/g' out.csv > out2.csv # separador ,
sed 's/,$/,\\N/' out2.csv > out3.csv # cambiar la ultima N
sed -e 's/a/A/g' -e 's/b/B/g' -e 's/c/C/g' -e 's/,N/,\\N/g' -e 's/,,/,\\N,/g' -e 's/n/N/g' -e 's/,N/,\\N/g' out3.csv > out4.csv # cambiar a mayusculas, las nulas N por \N y los blancos por \N
sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\),/20\3\-\2\-\1,/' out4.csv > out5.csv # convierte la fecha de DD/MM/YY a YYYY-MM-DD
sed 's/^\([0-9]\+\)\/\([0-9]\+\)\/\(20[0-9][0-9]\),/\3\-0\2\-0\1,/' out5.csv > out6.csv # convierte la fecha de DD/MM/YY a YYYY-MM-DD
#sed '/N/d' out5.csv > out6.csv # borra las nulas
sed 's/,\([0-9]*$\)/.\1/' out6.csv > out7.csv # si el ultimo dato tiene una coma extra
mv out7.csv base-organizada.csv # organiza la base de datos y la entrega en un csv
rm out* # elimina todos los archivos temporales
cat base-organizada.csv