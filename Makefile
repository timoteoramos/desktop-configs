.DEFAULT_GOAL := install

~/.zshrc:
	@echo "Installing zshrc config..."
	cp zsh/zshrc.zsh ~/.zshrc

~/.config/kitty/kitty.conf:
	@echo "Installing Kitty config..."
	@mkdir -p ~/.config/kitty
	cp kitty/kitty.conf ~/.config/kitty/

~/.config/qutebrowser/config.py:
	@echo "Installing Qutebrowser config..."
	@mkdir -p ~/.config/qutebrowser
	cp qutebrowser/config.py ~/.config/qutebrowser/

~/.config/ranger/rc.conf:
	@echo "Installing Ranger config..."
	@mkdir -p ~/.config/ranger
	cp kitty/rc.conf ~/.config/ranger

~/.config/rofi/base16-seti.rasi:
	@echo "Downloading base16-seti theme for Rofi..."
	@mkdir -p ~/.config/rofi
	curl -s https://gitlab.com/jordiorlando/base16-rofi/-/raw/master/themes/base16-seti.rasi > ~/.config/rofi/base16-seti.rasi

~/.config/rofi/config.rasi:
	@echo "Installing Rofi config..."
	@mkdir -p ~/.config/rofi
	cp rofi/config.rasi ~/.config/rofi/

.PHONY: add_kitty
add_kitty: ~/.config/kitty/kitty.conf ~/.config/ranger/rc.conf

.PHONY: add_qutebrowser
add_qutebrowser: ~/.config/qutebrowser/config.py

.PHONY: add_rofi
add_rofi: ~/.config/rofi/base16-seti.rasi ~/.config/rofi/config.rasi

.PHONY: add_zsh
add_zsh: ~/.zshrc
	@echo "In order to complete the zshell setup, you need to restart your zshell instance."

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

del_zsh:
	rm -Rf ~/.zshrc
	rm -Rf ~/.local/share/zinit

.PHONY: install
install: add_kitty add_qutebrowser add_rofi add_zsh
	@echo "Notes for zsh: the setup will finish when you start a new zshell instance."

.PHONY: clean
clean: del_kitty del_qutebrowser del_rofi del_zsh
