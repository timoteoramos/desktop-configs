# Personal Desktop Configurations

These are my personal tweaks for daily usage. Most configurations could be used separately, I personally use all of them together. Feel free to copy, edit and do anything you want to do.

I chose Seti UI as my default theme for terminal and all tools compatible with [base16 templates](https://github.com/chriskempson/base16-templates-source). For fonts, I use MesloLGS Nerd Font, from [Nerd Fonts](https://www.nerdfonts.com/), it's very nice and I have no problems with it.

## Setup

Just make sure you have GNU make installed in your system and run `make` in order to install all user configurations. If you just want a specific configuration, you can run the other targets separately. You can also use the `clean` target in order to remove all the configurations.

## Makefile Targets

```bash
# Install all user configurations
make install

# Uninstall all user configurations
make clean

# Install all system configurations
sudo make sysinstall

# Uninstall all system configurations
sudo make sysclean

# Install specific user configurations
make add_alacritty add_qutebrowser add_ranger add_rofi add_tmux add_xresources add_zsh

# Uninstall specific user configurations
make del_alacritty del_qutebrowser add_ranger del_rofi del_tmux del_xresources del_zsh

# Install specific system configurations
sudo make sysadd_gtk sysadd_tmux sysadd_zsh

# Uninstall specific system configurations
sudo make sysdel_gtk sysdel_tmux sysdel_zsh
```
