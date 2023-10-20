border_colors = {
    'focus': '5555ff',
    'normal': 'aaaaff',
}

has_battery = True

network_interface = 'wlp2s0'

terminal = 'alacritty'

startup_apps = [
    ['/usr/bin/ibus-daemon', '-rxR'],
    ['/usr/bin/dunst'],
    ['/usr/libexec/xfce-polkit'],
    ['/usr/bin/nm-applet'],
    ['/usr/bin/volumeicon'],
    ['/usr/bin/copyq'],
    ['/usr/bin/light-locker'],
]
