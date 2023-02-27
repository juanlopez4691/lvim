-- ## General settings

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.cmd('set nowrap')

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
lvim.lsp.diagnostics.virtual_text = false

-- Reload a file when it is changed outside of nvim
-- Complemented with an autocommand in autocommands.lua
vim.o.autoread = true
