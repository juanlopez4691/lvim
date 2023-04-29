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

-- Go to last location when opening a buffer
autocmd(
  "BufReadPost",
  {
    group = augroup("last_loc", { clear = true }),
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        -- Jump to last position in buffer
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
        -- Center line on screen
        vim.api.nvim_feedkeys('zz', 'n', true)
      end
    end,
  }
)
