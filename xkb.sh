
# usr/share/X11/xkb/symbols

# setxkbmap -verbose 10 -symbols "+zzz(yet_another_shift)"

# -option ""  to clear previous values
#setxkbmap \
#    -rules "evdev" -model "(qrty)" -compat "compat-xkb(zzz)" -layout "us+zzz-xkb(dexp)" -option ""  \
#    -variant "" \
#    -print #| xkbcomp -I"$HOME/tuning/xkb" - "${DISPLAY%%.*}"
        
#    -option "" -option "grp:lctrl_lshift_toggle,grp_led:scroll" \

#xkbcomp "$HOME/tuning/zzz-xkb"  "${DISPLAY%%.*}"
#   -compat "accessx(full)" \

setxkbmap -option "" -print \
    -rules "evdev" \
    -model "pc105" \
    -layout "us,ru" \
    -variant "," \
    -option "" \
| sed -e '/xkb_compat/s/\(.*\)"/\1+compat(dexp)"/' \
| sed -e '/xkb_symbols/s/\(.*\)"/\1+symbols(dexp)"/' \
| xkbcomp -I"$HOME/tuning/xkb" - "${DISPLAY%%.*}"
