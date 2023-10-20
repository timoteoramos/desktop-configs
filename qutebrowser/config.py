import catppuccin

config.load_autoconfig(True)

catppuccin.setup(c, 'mocha', True)

c.fonts.default_family = "JetBrainsMono Nerd Font"
c.fonts.default_size = "10pt"

c.content.cookies.accept = "never"
c.content.cookies.store = False
c.content.javascript.enabled = False
c.content.proxy = "http://127.0.0.1:8118"
c.url.default_page = "https://duckduckgogg42xjoc72x3sjasowoarfbgcmvfimaftt6twagswzczad.onion/html"
c.url.searchengines= {"DEFAULT": "https://duckduckgogg42xjoc72x3sjasowoarfbgcmvfimaftt6twagswzczad.onion/html?q={}"}
c.url.start_pages = "https://duckduckgogg42xjoc72x3sjasowoarfbgcmvfimaftt6twagswzczad.onion/html"
