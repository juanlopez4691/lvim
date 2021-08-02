-- ## Autocommands

lvim.autocommands.custom_groups = {
  -- Highlight matching brackets
  {
    "BufRead,BufNewFile",
    "*",
    "highlight MatchParen ctermfg=yellow guifg=yellow",
  },
}
