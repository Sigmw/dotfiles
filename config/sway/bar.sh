date_fmt=$(date +'%d-%m-%Y %T %p')
battery=$(/bin/cat /sys/class/power_supply/BAT0/capacity)
echo Remember who you are. $date_fmt $battery"%"


