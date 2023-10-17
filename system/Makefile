.DEFAULT_GOAL := install
ZSHPREFIX := /etc

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

/etc/tmux.conf:
	@echo "Installing tmux system-wide config..."
	cp system/tmux.conf /etc/tmux.conf

/usr/local/share/fonts/Meslo:
	mkdir -p /usr/local/share/fonts/Meslo

/usr/local/share/fonts/Meslo/Meslo\ LG\ S\ Regular\ Nerd\ Font\ Complete.ttf: /usr/local/share/fonts/Meslo
	wget -O /root/Meslo.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip
	unzip -d /usr/local/share/fonts/Meslo /root/Meslo.zip


$(ZSHPREFIX):
	mkdir -p $(ZSHPREFIX)

$(ZSHPREFIX)/zshenv: $(ZSHPREFIX)
	cp system/zshenv.zsh $(ZSHPREFIX)/zshenv
	sed -i 's/$$EDITOR/vi/g' $(ZSHPREFIX)/zshenv

$(ZSHPREFIX)/zshrc: $(ZSHPREFIX)
	cp system/zshrc.zsh $(ZSHPREFIX)/zshrc

.PHONY: add_gtk
add_gtk: /etc/gtk-2.0/gtkrc /etc/gtk-3.0/settings.ini

.PHONY: add_nerdfont
add_nerdfont: /usr/local/share/fonts/Meslo/Meslo\ LG\ S\ Regular\ Nerd\ Font\ Complete.ttf
	fc-cache -fv

.PHONY: add_tmux
add_tmux: /etc/tmux.conf

.PHONY: add_zsh
add_zsh: $(ZSHPREFIX)/zshenv $(ZSHPREFIX)/zshrc

.PHONY: del_gtk
del_gtk:
	@echo "Removing GTK tem-wide configuration..."
	rm -Rf /etc/gtk-2.0/gtkrc
	rm -Rf /etc/gtk-3.0/settings.ini

.PHONY: del_nerdfont
del_nerdfont:
	rm -Rf /usr/local/share/fonts/Meslo

.PHONY: del_tmux
del_tmux:
	@echo "Removing tmux tem-wide configuration..."
	rm -Rf /etc/tmux.conf

.PHONY: del_zsh
del_zsh:
	@echo "Removing zshell tem-wide configuration..."
	rm -Rf $(ZSHPREFIX)/zshenv
	rm -Rf $(ZSHPREFIX)/zshrc

.PHONY: install
install: add_gtk add_nerdfont add_tmux add_zsh

.PHONY: clean
clean: del_gtk del_nerdfont del_tmux del_zsh
