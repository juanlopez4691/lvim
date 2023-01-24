-- ## Autocommands

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
