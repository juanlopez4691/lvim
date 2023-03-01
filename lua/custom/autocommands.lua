-- ## Autocommands
-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>

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
    -- Set working directory
    "BufRead,BufNewFile",
    {
      pattern = { "*" },
      callback = function()
        require('nvim-rooter').setup()
      end
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

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "zsh",
    callback = function()
      -- let treesitter use bash highlight for zsh files as well
      require("nvim-treesitter.highlight").attach(0, "bash")
    end,
  }
)
