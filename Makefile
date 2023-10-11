.DEFAULT_GOAL := install

~/.Xresources:
	@echo "Installinx Xresources..."
	cp xresources/Xresources ~/.Xresources

~/.zshrc:
	@echo "Installing zshrc config..."
	cp zsh/zshrc.zsh ~/.zshrc

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

.PHONY: add_kitty
add_kitty: ~/.config/kitty/kitty.conf ~/.config/ranger/rc.conf

.PHONY: add_qutebrowser
add_qutebrowser: ~/.config/qutebrowser/config.py

.PHONY: add_rofi
add_rofi: ~/.config/rofi/base16-seti.rasi ~/.config/rofi/config.rasi

.PHONY: add_xresources
add_xresources: ~/.Xresources
	xrdb ~/.Xresources

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

.PHONY: del_xresources
del_xresources:
	@echo "Removing Xresources..."
	rm -Rf ~/.Xresources

.PHONY: del_zsh
del_zsh:
	rm -Rf ~/.zshrc
	rm -Rf ~/.local/share/zinit

.PHONY: install
install: add_kitty add_qutebrowser add_rofi add_xresources add_zsh
	@echo "Notes for zsh: the setup will finish when you start a new zshell instance."

.PHONY: clean
clean: del_kitty del_qutebrowser del_rofi del_xresources del_zsh
