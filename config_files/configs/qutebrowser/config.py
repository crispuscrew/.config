config.load_autoconfig(False)
c.auto_save.session = True
c.url.start_pages = 'https://start.duckduckgo.com'
c.url.default_page = 'https://start.duckduckgo.com'
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('O', 'set-cmd-text -s :open -t')
config.bind('o', 'set-cmd-text -s :open')
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.bg = "#000000"
