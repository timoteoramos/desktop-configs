~/.config/nvim:
	mkdir -p ~/.config/nvim

~/.config/nvim/.neoconf.json: ~/.config/nvim
	cp .neoconf.json ~/.config/nvim/

~/.config/nvim/init.lua: ~/.config/nvim
	cp init.lua ~/.config/nvim/

~/.config/nvim/LICENSE: ~/.config/nvim
	cp LICENSE ~/.config/nvim/

~/.config/nvim/stylua.toml: ~/.config/nvim
	cp stylua.toml ~/.config/nvim/

~/.config/nvim/lua: ~/.config/nvim
	mkdir ~/.config/nvim/lua

~/.config/nvim/lua/config: ~/.config/nvim/lua
	mkdir ~/.config/nvim/lua/config

~/.config/nvim/lua/config/autocmds.lua: ~/.config/nvim/lua/config
	cp lua/config/autocmds.lua ~/.config/nvim/lua/config/

~/.config/nvim/lua/config/keymaps.lua: ~/.config/nvim/lua/config
	cp lua/config/keymaps.lua ~/.config/nvim/lua/config/

~/.config/nvim/lua/config/lazy.lua: ~/.config/nvim/lua/config
	cp lua/config/lazy.lua ~/.config/nvim/lua/config/

~/.config/nvim/lua/config/options.lua: ~/.config/nvim/lua/config
	cp lua/config/options.lua ~/.config/nvim/lua/config/

~/.config/nvim/lua/plugins: ~/.config/nvim/lua
	mkdir ~/.config/nvim/lua/plugins

~/.config/nvim/lua/plugins/example.lua: ~/.config/nvim/lua/plugins
	cp lua/plugins/example.lua ~/.config/nvim/lua/plugins/

.PHONY: install
install: \
	~/.config/nvim/.neoconf.json \
	~/.config/nvim/init.lua \
	~/.config/nvim/LICENSE \
	~/.config/nvim/stylua.toml \
	~/.config/nvim/lua/config/autocmds.lua \
	~/.config/nvim/lua/config/keymaps.lua \
	~/.config/nvim/lua/config/lazy.lua \
	~/.config/nvim/lua/config/options.lua \
	~/.config/nvim/lua/plugins/example.lua

.PHONY: clean
clean:
	rm -Rf ~/.config/nvim
	rm -Rf ~/.local/share/nvim
