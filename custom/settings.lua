-- ## General settings

vim.cmd("set nowrap")

-- Register * will not be modified by yank, delete, change or put operations
-- See https://neovim.io/doc/user/options.html#'clipboard'
vim.opt.clipboard = ""

-- Formatting and linting on save
lvim.format_on_save = false
lvim.lint_on_save = true

-- Wrap cursor movement at beginning and end of line
lvim.line_wrap_cursor_movement = true
vim.cmd("set whichwrap+=<,>,h,l,[,]")

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

--
-- Setup formatters for JavaScript family
--
-- lvim.lang.javascript.formatters = {
--   {
--     exe = "prettier",
--     args = lvim.lang.javascript.formatters[1].args,
--   },
-- }
-- lvim.lang.typescript.formatters = lvim.lang.javascript.formatters
-- lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
-- lvim.lang.typescriptreact.formatters = lvim.lang.javascript.formatters
-- lvim.lang.vue.formatters = lvim.lang.javascript.formatters

--
-- Setup linters for JavaScript family
--
-- lvim.lang.javascript.linters = { { exe = "eslint" } }
-- lvim.lang.typescript.linters = lvim.lang.javascript.linters
-- lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters
-- lvim.lang.typescriptreact.linters = lvim.lang.javascript.linters
-- lvim.lang.vue.linters = lvim.lang.javascript.linters

-- CSS formatter
-- lvim.lang.css.formatters = {{ "prettier" }}

-- PHP linter & formatter
-- TODO: get phpcs to run when file is saved
-- TODO: run phpcbf manually
-- lvim.lang.php.linters = {{ exe = "phpcs" }}
-- lvim.lang.php.formatters = {{ exe = "phpcbf" }}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    exe = "prettier",
      filetypes = {
      "javascript",
      "json",
      "scss",
      "css"
    }
  }
})

