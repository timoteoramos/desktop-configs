.DEFAULT_GOAL := install

~/.Xresources:
	@echo "Installinx Xresources..."
	cp xresources/Xresources ~/.Xresources
	xrdb ~/.Xresources

~/.config/kitty:
	mkdir -p ~/.config/kitty

~/.config/kitty/kitty.conf: ~/.config/kitty
	@echo "Installing Kitty config..."
	cp kitty/kitty.conf ~/.config/kitty/

~/.config/qutebrowser:
	mkdir ~/.config/qutebrowser

~/.config/qutebrowser/config.py: ~/.config/qutebrowser
	@echo "Installing Qutebrowser config..."
	cp qutebrowser/config.py ~/.config/qutebrowser/

~/.config/ranger:
	mkdir ~/.config/ranger

~/.config/ranger/rc.conf:
	@echo "Installing Ranger config..."
	cp kitty/rc.conf ~/.config/ranger

~/.config/rofi:
	mkdir ~/.config/rofi

~/.config/rofi/base16-seti.rasi: ~/.config/rofi
	@echo "Downloading base16-seti theme for Rofi..."
	curl -s https://gitlab.com/jordiorlando/base16-rofi/-/raw/master/themes/base16-seti.rasi > ~/.config/rofi/base16-seti.rasi

~/.config/rofi/config.rasi: ~/.config/rofi
	@echo "Installing Rofi config..."
	cp rofi/config.rasi ~/.config/rofi/

~/.tmux.conf:
	@echo "Installing tmux config..."
	cp tmux/tmux.conf ~/.tmux.conf

~/.tmux/plugins/tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	@echo "Restart your tmux and run the installer by pressing <prefix> + I"

~/.zshrc:
	@echo "Installing zshrc config..."
	cp zsh/zshrc.zsh ~/.zshrc

/etc/gtk-2.0:
	mkdir -p /etc/gtk-2.0

/etc/gtk-2.0/gtkrc: /etc/gtk-2.0
	@echo "Installing GTK2 system-wide config..."
	cp system/gtkrc /etc/gtk-2.0/

/etc/gtk-3.0:
	mkdir -p /etc/gtk-3.0

/etc/gtk-3.0/settings.ini: /etc/gtk-3.0
	@echo "Installing GTK3 system-wide config..."
	cp system/settings.ini /etc/gtk-3.0/

.PHONY: add_kitty
add_kitty: ~/.config/kitty/kitty.conf ~/.config/ranger/rc.conf

.PHONY: add_qutebrowser
add_qutebrowser: ~/.config/qutebrowser/config.py

.PHONY: add_rofi
add_rofi: ~/.config/rofi/base16-seti.rasi ~/.config/rofi/config.rasi

.PHONY: add_tmux
add_tmux: ~/.tmux.conf ~/.tmux/plugins/tpm

.PHONY: add_xresources
add_xresources: ~/.Xresources

.PHONY: add_zsh
add_zsh: ~/.zshrc

.PHONY: del_kitty
del_kitty:
	@echo "Removing Kitty and Ranger configurations"
	rm -Rf ~/.config/kitty/kitty.conf
	rm -Rf ~/.config/ranger/rc.conf

.PHONY: del_qutebrowser
del_qutebrowser:
	@echo "Removing Qutebrowser configuration"
	rm -Rf ~/.config/qutebrowser/config.py

.PHONY: del_rofi
del_rofi:
	@echo "Removing Rofi configuration"
	rm -Rf ~/.config/rofi/base16-seti.rasi
	rm -Rf ~/.config/rofi/config.rasi

.PHONY: del_tmux
del_tmux:
	@echo "Removing tmux configuration"
	rm -Rf ~/.tmux.conf
	rm -Rf ~/.tmux/plugins/tpm

.PHONY: del_xresources
del_xresources:
	@echo "Removing Xresources..."
	rm -Rf ~/.Xresources

.PHONY: del_zsh
del_zsh:
	rm -Rf ~/.zshrc
	rm -Rf ~/.local/share/zinit

.PHONY: sysadd_gtk
sysadd_gtk: /etc/gtk-2.0/gtkrc /etc/gtk-3.0/settings.ini

.PHONY: sysdel_gtk
sysdel_gtk:
	@echo "Removing GTK system-wide configuration..."
	rm -Rf /etc/gtk-2.0/gtkrc
	rm -Rf /etc/gtk-3.0/settings.ini

.PHONY: install
install: add_kitty add_qutebrowser add_rofi add_tmux add_xresources add_zsh
	@echo "Notes for tmux: you can use <prefix> + I in order to complete the setup."
	@echo "Notes for zsh: the setup will finish when you start a new zshell instance."

.PHONY: clean
clean: del_kitty del_qutebrowser del_rofi del_tmux del_xresources del_zsh

.PHONY: sysinstall
sysinstall: sysadd_gtk

.PHONY: sysclean
sysclean: sysdel_gtk
