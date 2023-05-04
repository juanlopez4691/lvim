-- ## General settings

vim.g.editorconfig = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.cmd('set nowrap')

-- Hide cursor on inactive window.
vim.opt.guicursor = "a:noCursor"

lvim.log.level = "info"
lvim.leader = "space"

-- Time delay to show WhichKey panel.
vim.opt.timeoutlen = 300

-- Register * will not be modified by yank, delete, change or put operations
-- See https://neovim.io/doc/user/options.html#'clipboard'
vim.opt.clipboard = ''

-- Vertical and horizontal scroll offset.
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 4

-- Formatting and linting on save
lvim.lint_on_save = true
lvim.format_on_save = {
  enabled = true,
  pattern = {
    "*.lua",
    "*.js",
    "*.php",
  },
  timeout = 1000,
}


-- Wrap cursor movement at beginning and end of line
lvim.line_wrap_cursor_movement = true
vim.cmd('set whichwrap+=<,>,h,l,[,]')

-- Disable virtual text display for lsp diagnostics
vim.diagnostic.config({ virtual_text = false })

-- Reload a file when it is changed outside of nvim
-- Complemented with an autocommand in autocommands.lua
vim.o.autoread = true

-- vim.o.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
vim.o.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50'..
  ',a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'..
  ',sm:block-blinkwait175-blinkoff150-blinkon175'
