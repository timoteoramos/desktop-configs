.DEFAULT_GOAL := install

~/.config/kitty/kitty.conf:
	@echo "Installing Kitty config..."
	mkdir -p ~/.config/kitty
	cp kitty/kitty.conf ~/.config/kitty/

~/.config/ranger/rc.conf:
	@echo "Installing Ranger config..."
	mkdir -p ~/.config/ranger
	cp kitty/rc.conf ~/.config/ranger

.PHONY: add_kitty
add_kitty: ~/.config/kitty/kitty.conf ~/.config/ranger/rc.conf

.PHONY: del_kitty
del_kitty:
	@echo "Removing Kitty and Ranger configurations"
	rm -Rf ~/.config/kitty/kitty.conf
	rm -Rf ~/.config/ranger/rc.conf

.PHONY: install
install: add_kitty

.PHONY: clean
clean: del_kitty
