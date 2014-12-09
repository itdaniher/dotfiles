xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
synclient VertHysteresis=100
feh --bg-fill ~/Pictures/downloadACar.jpg
set_bar(){
       while true
            do
                xsetroot -name "Bat. $(awk 'sub(/,/,"") {print $3, $4}' <(acpi -b)) \
                | Vol. $(awk '/\%/ { gsub(/[\[\]]/,""); print $5, $6}' <(amixer get Master)) \
                | $(date +"%a, %b %d %R")"
              sleep 1
         done &
}
set_bar&disown
dwm
