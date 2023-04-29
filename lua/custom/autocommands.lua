-- ## Autocommands
-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

lvim.autocommands = {
  {
    -- Highlight matching brackets
    "BufRead,BufNewFile",
    {
      pattern = { "*" },
      command = ":highlight MatchParen ctermfg=yellow guifg=yellow",
    },
  },
  {
    -- Auto-reload file when changed on disk
    -- Requires setting vim.o.autoread = true
    -- See settings.lua file.
    "BufEnter,CursorHold,CursorHoldI,FocusGained",
    {
      pattern = { "*" },
      command = "if mode() != 'c' | checktime | endif",
    }
  },
}

-- let treesitter use bash highlight for zsh files as well
autocmd(
  "FileType",
  {
    pattern = "zsh",
    callback = function()
      require("nvim-treesitter.highlight").attach(0, "bash")
    end,
  }
)
