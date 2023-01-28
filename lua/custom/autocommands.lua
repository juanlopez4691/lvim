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
  }
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
