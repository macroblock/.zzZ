if [ "$TERM" = "linux" ]; then
#   set RGB color nRRGGBB 
    echo -en "\e]P0222222"
    echo -en "\e]P1DC322F"
    echo -en "\e]P2859900"
    echo -en "\e]P3B58900"
    echo -en "\e]P4268BD2"
    echo -en "\e]P5D33682"
    echo -en "\e]P62AA198"
    echo -en "\e]P7EEEEEE"

    echo -en "\e]P8111111"
    echo -en "\e]P9E09690"
    echo -en "\e]PA555555"
    echo -en "\e]PB888888"
    echo -en "\e]PCAAAAAA"
    echo -en "\e]PD6C71C4"
    echo -en "\e]PEBBBBBB"
    echo -en "\e]PFFFFFD7"
#    clear # bring us back to default input colours
# to get rgb color with index n:
# echo -en "\033]4;n;?\007"
fi
