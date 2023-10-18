.DEFAULT_GOAL := install
SYSTEM_KEYMAP := br-abnt2
SYSTEM_LOCALE := pt_BR.UTF-8
SYSTEM_TIMEZONE := America/Araguaina
ZSHPREFIX := /etc

/etc/gtk-2.0:
	mkdir -p /etc/gtk-2.0

/etc/gtk-2.0/gtkrc: /etc/gtk-2.0
	cp gtkrc /etc/gtk-2.0/

/etc/gtk-3.0:
	mkdir -p /etc/gtk-3.0

/etc/gtk-3.0/settings.ini: /etc/gtk-3.0
	cp settings.ini /etc/gtk-3.0/

/etc/tmux.conf:
	cp tmux.conf /etc/tmux.conf

/usr/local/share/fonts/Meslo:
	mkdir -p /usr/local/share/fonts/Meslo

/usr/local/share/fonts/Meslo/Meslo\ LG\ S\ Regular\ Nerd\ Font\ Complete.ttf: /usr/local/share/fonts/Meslo
	wget -O /root/Meslo.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip
	unzip -d /usr/local/share/fonts/Meslo /root/Meslo.zip


$(ZSHPREFIX):
	mkdir -p $(ZSHPREFIX)

$(ZSHPREFIX)/zshenv: $(ZSHPREFIX)
	cp zshenv.zsh $(ZSHPREFIX)/zshenv
	sed -i 's/$$EDITOR/vi/g' $(ZSHPREFIX)/zshenv

$(ZSHPREFIX)/zshrc: $(ZSHPREFIX)
	cp zshrc.zsh $(ZSHPREFIX)/zshrc

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
	rm -Rf /etc/gtk-2.0/gtkrc
	rm -Rf /etc/gtk-3.0/settings.ini

.PHONY: del_nerdfont
del_nerdfont:
	rm -Rf /usr/local/share/fonts/Meslo

.PHONY: del_tmux
del_tmux:
	rm -Rf /etc/tmux.conf

.PHONY: del_zsh
del_zsh:
	rm -Rf $(ZSHPREFIX)/zshenv
	rm -Rf $(ZSHPREFIX)/zshrc

.PHONY: install
install: add_gtk add_nerdfont add_tmux add_zsh

.PHONY: clean
clean: del_gtk del_nerdfont del_tmux del_zsh

.PHONY: setup_archlinux
setup_archlinux:
	ln -sf /usr/share/zoneinfo/$(SYSTEM_TIMEZONE) /etc/localtime
	hwclock --systohc
	echo "$(SYSTEM_LOCALE)" > /etc/locale.gen
	locale-gen
	echo "LANG=$(SYSTEM_LOCALE)" > /etc/locale.conf
	echo "KEYMAP=$(SYSTEM_KEYMAP)" > /etc/vconsole.conf
	pacman -Sy lightdm-gtk-greeter-settings
	systemctl set-default graphical.target
	systemctl enable lightdm.service
	pacman -Sy \
		accountsservice \
		alacritty \
		caja \
		chromium \
		curl \
		dialog \
		dunst \
		elementary-icon-theme \
		firefox-i18n-pt-br \
		gcc \
		git \
		gvfs-afc \
		gvfs-gphoto2 \
		gvfs-mtp \
		gvfs-nfs \
		gvfs-smb \
		htop \
		ibus \
		jq \
		keepassxc \
		light-locker \
		mate-polkit \
		mate-themes \
		mosh \
		neovim \
		noto-fonts \
		noto-fonts-emoji \
		noto-fonts-extra \
		p7zip \
		pipewire-alsa \
		pipewire-audio \
		pipewire-jack \
		pipewire-pulse \
		pv \
		python-dbus-next \
		python-pipx \
		python-pynvim \
		python-pyxdg \
		qtile \
		ranger \
		rofi \
		seahorse \
		sudo \
		sysstat \
		thunderbird-i18n-pt-br \
		tmux \
		unzip \
		wget \
		wireplumber \
		xorg-fonts-100dpi \
		xorg-fonts-75dpi \
		xorg-fonts-cyrillic \
		xorg-fonts-encodings \
		xorg-fonts-misc \
		xorg-fonts-type1 \
		zip \
		zsh
