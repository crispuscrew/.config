config.load_autoconfig()
c.auto_save.session = True
c.session.lazy_restore = False

def safe_unbind(keys):
    for key in keys:
        try:
            config.unbind(key)
        except:
            pass

safe_unbind([
    'F', 'O',
    'h', 'j', 'k', 'l', 'd', 'r',
    '<Ctrl-h>', '<Ctrl-N>',
    '<Ctrl-F>', '<Ctrl-B>', '<Ctrl-D>', '<Ctrl-U>',
])

config.bind('<Ctrl-w>', 'tab-close')
config.bind('<Ctrl-Shift-T>', 'undo')
config.bind('<Ctrl-Tab>', 'tab-next')
config.bind('<Ctrl-Shift-Tab>', 'tab-prev')
config.bind('<Ctrl-r>', 'reload')
config.bind('<Ctrl-f>', 'search')
config.bind('<Ctrl-l>', 'set-cmd-text -s :open')
config.bind('<Alt-Left>', 'back')
config.bind('<Alt-Right>', 'forward')
config.bind('<Ctrl-m>', 'quit --save')

config.bind('<PgUp>', 'scroll-page 0 -1')
config.bind('<PgDown>', 'scroll-page 0 1')

config.bind('<Ctrl-n>', 'spawn --detach qutebrowser')
config.bind('<Ctrl-N>', 'spawn --detach qutebrowser --target private')
config.bind('<F6>', 'set colors.webpage.darkmode.enabled false')
config.bind('<F7>', 'set colors.webpage.darkmode.enabled true')