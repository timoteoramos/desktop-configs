from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import defaults, subprocess, theme

widget_defaults = dict(
    font=theme.fontconfig['lower_name'],
    fontsize=theme.fontconfig['lower_size'],
)

extension_defaults = widget_defaults.copy()

auto_minimize = True

mod = 'mod4'

keys = [
    Key([mod], 'left', lazy.layout.left(), desc='Move focus to left'),
    Key([mod], 'right', lazy.layout.right(), desc='Move focus to right'),
    Key([mod], 'down', lazy.layout.down(), desc='Move focus down'),
    Key([mod], 'up', lazy.layout.up(), desc='Move focus up'),
    Key([mod], 'space', lazy.layout.next(), desc='Move window focus to other window'),
    Key([mod, 'shift'], 'left', lazy.layout.shuffle_left(), desc='Move window to the left'),
    Key([mod, 'shift'], 'right', lazy.layout.shuffle_right(), desc='Move window to the right'),
    Key([mod, 'shift'], 'down', lazy.layout.shuffle_down(), desc='Move window down'),
    Key([mod, 'shift'], 'up', lazy.layout.shuffle_up(), desc='Move window up'),
    Key([mod, 'control'], 'left', lazy.layout.grow_left(), desc='Grow window to the left'),
    Key([mod, 'control'], 'right', lazy.layout.grow_right(), desc='Grow window to the right'),
    Key([mod, 'control'], 'down', lazy.layout.grow_down(), desc='Grow window down'),
    Key([mod, 'control'], 'up', lazy.layout.grow_up(), desc='Grow window up'),
    Key([mod], 'n', lazy.layout.normalize(), desc='Reset all window sizes'),
    Key(
        [mod, 'shift'],
        'Return',
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack',
    ),
    Key([mod], 'Return', lazy.spawn(defaults.terminal), desc='Launch terminal'),
    Key([mod], 'Tab', lazy.next_layout(), desc='Toggle between layouts'),
    Key([mod], 'w', lazy.window.kill(), desc='Kill focused window'),
    Key([mod, 'control'], 'r', lazy.reload_config(), desc='Reload the config'),
    Key([mod, 'control'], 'q', lazy.shutdown(), desc='Shutdown Qtile'),
    Key([mod], 'r', lazy.spawncmd(), desc='Spawn a command using a prompt widget'),
    Key([mod], 'Return', lazy.spawn('rofi -show drun -show-icons'), desc='Launch Rofi'),
]

groups = [Group(i) for i in '123456789']

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc='Switch to group {}'.format(i.name),
            ),
            Key(
                [mod, 'shift'],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc='Switch to & move focused window to group {}'.format(i.name),
            ),
        ]
    )

layouts = [
    layout.Max(),
    layout.Columns(
        border_focus=theme.colors['border_focus'],
        border_normal=theme.colors['border_normal'],
        border_on_single=True,
        border_width=1,
        fair=True,
        margin=2,
        margin_on_single=True,
    ),
]



screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(
                    block_highlight_text_color=theme.colors['lower_foreground'],
                    disable_drag=True,
                    highlight_method='block',
                    inactive=theme.colors['lower_foreground_inactive'],
                    this_current_screen_border=theme.colors['lower_foreground_selected'],
                    this_screen_border=theme.colors['lower_foreground_selected'],

                ),
                widget.Chord(
                    chords_colors={
                        'launch': (theme.colors['highlight_urgent'], theme.colors['lower_foreground']),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Prompt(
                    foreground=theme.colors['lower_foreground'],
                ),
            ],
            24,
            background=theme.colors['lower_background'],
        ),
        top=bar.Bar(
            [
                widget.CurrentLayout(
                    font=theme.fontconfig['upper_name'],
                    fontsize=theme.fontconfig['upper_size'],
                ),
                widget.TaskList(
                    border=theme.colors['border_focus'],
                    borderwidth=1,
                    font=theme.fontconfig['upper_name'],
                    fontsize=theme.fontconfig['upper_size'],
                    rounded=False,
                    title_width_method='uniform',
                ),
                widget.Systray(),
                widget.Clock(
                    font=theme.fontconfig['upper_name'],
                    fontsize=theme.fontconfig['upper_size'],
                    format='%d/%m/%Y %a %H:%M %p',
                ),
            ],
            28,
        ),
    ),
]

mouse = [
    Drag([mod], 'Button1', lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], 'Button3', lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], 'Button2', lazy.window.bring_to_front()),
]

dgroups_key_binder = None

dgroups_app_rules = []

follow_mouse_focus = True

bring_front_click = False

cursor_warp = False

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),
        Match(wm_class='makebranch'),
        Match(wm_class='maketag'),
        Match(wm_class='ssh-askpass'),
        Match(title='branchdialog'),
        Match(title='pinentry'),
    ]
)

auto_fullscreen = True

focus_on_window_activation = 'smart'

reconfigure_screens = True

wl_input_rules = None

wmname = 'LG3D'


@hook.subscribe.startup_once
def autostart():
    for app in defaults.startup_apps:
        subprocess.Popen(app)
