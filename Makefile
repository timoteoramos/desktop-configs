.DEFAULT_GOAL := install

~/.config/kitty/kitty.conf:
	@echo "Installing Kitty config..."
	mkdir -p ~/.config/kitty
	cp kitty/kitty.conf ~/.config/kitty/

~/.config/ranger/rc.conf:
	@echo "Installing Ranger config..."
	mkdir -p ~/.config/ranger
	cp kitty/rc.conf ~/.config/ranger

~/.config/rofi/base16-seti.rasi:
	@echo "Downloading base16-seti theme for Rofi..."
	mkdir -p ~/.config/rofi
	curl -s https://gitlab.com/jordiorlando/base16-rofi/-/raw/master/themes/base16-seti.rasi > ~/.config/rofi/base16-seti.rasi

~/.config/rofi/config.rasi:
	@echo "Installing Rofi config..."
	mkdir -p ~/.config/rofi
	cp rofi/config.rasi ~/.config/rofi/

.PHONY: add_kitty
add_kitty: ~/.config/kitty/kitty.conf ~/.config/ranger/rc.conf

.PHONY: add_rofi
add_rofi: ~/.config/rofi/base16-seti.rasi ~/.config/rofi/config.rasi

.PHONY: del_kitty
del_kitty:
	@echo "Removing Kitty and Ranger configurations"
	rm -Rf ~/.config/kitty/kitty.conf
	rm -Rf ~/.config/ranger/rc.conf


.PHONY: del_rofi
del_rofi:
	@echo "Removing Rofi configuration"
	rm -Rf ~/.config/rofi/base16-seti.rasi
	rm -Rf ~/.config/rofi/config.rasi

.PHONY: install
install: add_kitty add_rofi

.PHONY: clean
clean: del_kitty del_rofi
