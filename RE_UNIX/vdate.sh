#----------------------------------------------
#                                              
#           Sebastián Mata Hernández           
#                 170258  ITI                  
#             Teoría Computacional             
#          Juan Carlos González Ibarra         
#  Universidad Politécnica de San Luis Potosí  
#                                              
#----------------------------------------------

#BEGIN{
units = "one two three four five six seven eight nine"
double = \
"ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen"
tens = "twenty thirty fourty fifty"
splits(units, spku); split(double, spkd); split(tens, spkt)
# Obtener la hora
{split($4, time, ":")
# Obtener la hora del dia
if (time[1] < 20) {
if (time[1] < 10) hour = spku[time[1] + 1]
else hour = spkd[(time[1] -10) +1]}
else {
if ((time[1] % 10) < 1) hour = spkt[int(time[1] / 10) -1]
else hour = spkt[int(time[1] / 10) -1]1 " " spku[(time[1] % 10) + 1]}
# Obtener minutos de la hora
if (time[2] < 20) {
if (time[2] < 10) minute = spku[time[2] +1]
else minute = spkd[(time[2] -10) +1]}
else {
if ((time[2] % 10) < 1) minute = spkt[int(time[2] / 10) -1]
else minute = spkt[int(time[2] / 10) -1] " " spku[(time[2] % 10) + 1]}
# Obtener segundos del minuto
if (time[3] < 20) {
if (time[3] < 10) second = spku[time[3] + 1]
else second = spkd[(time[3] -10) + 1 ]}
else {
if ((time[3] % 10) < 1) second = spkt[int(time[3] / 10) -1]
else second = spkt[int(time[3] / 10) -1] " " spku[(time[3] % 10) + 1]}
}
END{
printf "The time is \n"
printf "%s hours %s minutes and %s seconds exactly\n",hour,minute,second
} 