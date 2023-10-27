.DEFAULT_GOAL := install
EDITOR=vi
QTILE_TERM := alacritty

~/.Xresources:
	cp xresources/Xresources ~/.Xresources

~/.Xresources.d/catppuccin:
	mkdir -p ~/.Xresources.d/catppuccin

~/.Xresources.d/catppuccin/frappe.Xresources: ~/.Xresources.d/catppuccin
	curl -s https://raw.githubusercontent.com/catppuccin/xresources/main/frappe.Xresources > ~/.Xresources.d/catppuccin/frappe.Xresources

~/.Xresources.d/catppuccin/latte.Xresources: ~/.Xresources.d/catppuccin
	curl -s https://raw.githubusercontent.com/catppuccin/xresources/main/latte.Xresources > ~/.Xresources.d/catppuccin/latte.Xresources

~/.Xresources.d/catppuccin/macchiato.Xresources: ~/.Xresources.d/catppuccin
	curl -s https://raw.githubusercontent.com/catppuccin/xresources/main/macchiato.Xresources > ~/.Xresources.d/catppuccin/macchiato.Xresources

~/.Xresources.d/catppuccin/mocha.Xresources: ~/.Xresources.d/catppuccin
	curl -s https://raw.githubusercontent.com/catppuccin/xresources/main/mocha.Xresources > ~/.Xresources.d/catppuccin/mocha.Xresources

~/.config/alacritty:
	mkdir -p ~/.config/alacritty

~/.config/alacritty/alacritty.yml: ~/.config/alacritty
	cp alacritty/alacritty.yml ~/.config/alacritty/

~/.config/alacritty/catppuccin:
	mkdir -p ~/.config/alacritty/catppuccin

~/.config/alacritty/catppuccin/catppuccin-frappe.yml: ~/.config/alacritty/catppuccin
	curl -s https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-frappe.yml > ~/.config/alacritty/catppuccin/catppuccin-frappe.yml

~/.config/alacritty/catppuccin/catppuccin-latte.yml: ~/.config/alacritty/catppuccin
	curl -s https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-latte.yml > ~/.config/alacritty/catppuccin/catppuccin-latte.yml

~/.config/alacritty/catppuccin/catppuccin-macchiato.yml: ~/.config/alacritty/catppuccin
	curl -s https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-macchiato.yml > ~/.config/alacritty/catppuccin/catppuccin-macchiato.yml

~/.config/alacritty/catppuccin/catppuccin-mocha.yml: ~/.config/alacritty/catppuccin
	curl -s https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-mocha.yml > ~/.config/alacritty/catppuccin/catppuccin-mocha.yml

~/.config/dunst:
	mkdir -p ~/.config/dunst

~/.config/dunst/dunstrc: ~/.config/dunst
	cp dunst/dunstrc.ini ~/.config/dunst/dunstrc

~/.config/qutebrowser:
	mkdir -p ~/.config/qutebrowser

~/.config/qutebrowser/config.py: ~/.config/qutebrowser
	cp qutebrowser/config.py ~/.config/qutebrowser/

~/.config/qutebrowser/catppuccin:
	git clone https://github.com/catppuccin/qutebrowser.git ~/.config/qutebrowser/catppuccin

~/.config/qtile:
	mkdir -p ~/.config/qtile

~/.config/qtile/config.py: ~/.config/qtile
	cp qtile/config.py ~/.config/qtile/

~/.config/qtile/defaults.py: ~/.config/qtile
	cp qtile/defaults.py ~/.config/qtile/

~/.config/ranger:
	mkdir -p ~/.config/ranger

~/.config/ranger/rc.conf: ~/.config/ranger
	cp ranger/rc.conf ~/.config/ranger

~/.config/rofi:
	mkdir -p ~/.config/rofi

~/.config/rofi/config.rasi: ~/.config/rofi
	cp rofi/config.rasi ~/.config/rofi/

~/.local/share/rofi/themes:
	mkdir -p ~/.local/share/rofi/themes

~/.local/share/rofi/themes/catppuccin-frappe.rasi: ~/.local/share/rofi/themes
	curl -s https://raw.githubusercontent.com/catppuccin/rofi/main/basic/.local/share/rofi/themes/catppuccin-frappe.rasi > ~/.local/share/rofi/themes/catppuccin-frappe.rasi

~/.local/share/rofi/themes/catppuccin-latte.rasi: ~/.local/share/rofi/themes
	curl -s https://raw.githubusercontent.com/catppuccin/rofi/main/basic/.local/share/rofi/themes/catppuccin-latte.rasi > ~/.local/share/rofi/themes/catppuccin-latte.rasi

~/.local/share/rofi/themes/catppuccin-macchiato.rasi: ~/.local/share/rofi/themes
	curl -s https://raw.githubusercontent.com/catppuccin/rofi/main/basic/.local/share/rofi/themes/catppuccin-macchiato.rasi > ~/.local/share/rofi/themes/catppuccin-macchiato.rasi

~/.local/share/rofi/themes/catppuccin-mocha.rasi: ~/.local/share/rofi/themes
	curl -s https://raw.githubusercontent.com/catppuccin/rofi/main/basic/.local/share/rofi/themes/catppuccin-mocha.rasi > ~/.local/share/rofi/themes/catppuccin-mocha.rasi

~/.tmux.conf:
	cp tmux/tmux.conf ~/.tmux.conf

~/.tmux/plugins/tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	@echo "Restart your tmux and run the installer by pressing <prefix> + I"

~/.zshrc:
	cp zsh/zshrc.zsh ~/.zshrc

.PHONY: add_alacritty
add_alacritty: ~/.config/alacritty/alacritty.yml ~/.config/alacritty/catppuccin/catppuccin-frappe.yml ~/.config/alacritty/catppuccin/catppuccin-latte.yml ~/.config/alacritty/catppuccin/catppuccin-macchiato.yml ~/.config/alacritty/catppuccin/catppuccin-mocha.yml

.PHONY: add_dust
add_dunst: ~/.config/dunst/dunstrc

.PHONY: add_neovim
add_neovim:
	cd neovim ; make install

.PHONY: add_qutebrowser
add_qutebrowser: ~/.config/qutebrowser/config.py ~/.config/qutebrowser/catppuccin

.PHONY: add_qtile
add_qtile: ~/.config/qtile/config.py ~/.config/qtile/defaults.py

.PHONY: add_ranger
add_ranger: ~/.config/ranger/rc.conf

.PHONY: add_rofi
add_rofi: ~/.config/rofi/config.rasi ~/.local/share/rofi/themes/catppuccin-frappe.rasi ~/.local/share/rofi/themes/catppuccin-latte.rasi ~/.local/share/rofi/themes/catppuccin-macchiato.rasi ~/.local/share/rofi/themes/catppuccin-mocha.rasi

.PHONY: add_tmux
add_tmux: ~/.tmux.conf ~/.tmux/plugins/tpm

.PHONY: add_xresources
add_xresources: ~/.Xresources ~/.Xresources.d/catppuccin/frappe.Xresources ~/.Xresources.d/catppuccin/latte.Xresources ~/.Xresources.d/catppuccin/macchiato.Xresources ~/.Xresources.d/catppuccin/mocha.Xresources
	xrdb ~/.Xresources

.PHONY: add_zsh
add_zsh: ~/.zshrc

.PHONY: del_alacritty
del_alacritty:
	rm -Rf ~/.config/alacritty/alacritty.yml
	rm -Rf ~/.config/alacritty/catppuccin

.PHONY: del_dunst
del_dunst:
	rm -Rf ~/.config/dunst/dunstrc

.PHONY: del_neovim
del_neovim:
	cd neovim ; make clean

.PHONY: del_qutebrowser
del_qutebrowser:
	rm -Rf ~/.config/qutebrowser/config.py

.PHONY: del_qtile
del_qtile:
	rm -Rf ~/.config/qtile/config.py

.PHONY: del_ranger
del_ranger:
	rm -Rf ~/.config/ranger/rc.conf

.PHONY: del_rofi
del_rofi:
	rm -Rf ~/.config/rofi/config.rasi
	rm -Rf ~/.local/share/rofi/themes/catppuccin-*.rasi

.PHONY: del_tmux
del_tmux:
	rm -Rf ~/.tmux.conf
	rm -Rf ~/.tmux/plugins/tpm

.PHONY: del_xresources
del_xresources:
	rm -Rf ~/.Xresources
	rm -Rf ~/.Xresources.d/catppuccin

.PHONY: del_zsh
del_zsh:
	rm -Rf ~/.zshrc
	rm -Rf ~/.local/share/zinit

.PHONY: install
install: add_alacritty add_dunst add_neovim add_qutebrowser add_qtile add_ranger add_rofi add_tmux add_xresources add_zsh
	@echo "Notes for tmux: you can use <prefix> + I in order to complete the setup."
	@echo "Notes for zsh: the setup will finish when you start a new zshell instance."

.PHONY: clean
clean: del_alacritty del_dunst del_neovim del_qutebrowser del_qtile del_ranger del_rofi del_tmux del_xresources del_zsh

.PHONY: sysinstall
sysinstall:
	cd system ; make install

.PHONY: sysclean
sysclean:
	cd system ; make clean
