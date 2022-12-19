-- ## Color schemes
table.insert(lvim.plugins, { "olimorris/onedarkpro.nvim" })
table.insert(lvim.plugins, { "rebelot/kanagawa.nvim" })
-- table.insert(lvim.plugins, { "folke/tokyonight.nvim" })

-- Custom colors for kanagawa colorscheme.
if lvim.colorscheme == "kanagawa" then
  local colors = {
    sumiInk1 = "#17171F",
    sumiInk3 = "#22222d"
  }
  require'kanagawa'.setup({ colors = colors })
end

-- Set color scheme
-- lvim.colorscheme = "tokyonight"
lvim.colorscheme = "onedark"
-- lvim.colorscheme = "kanagawa"

-- Fix galaxyline colors for tokyonight colorscheme
if lvim.colorscheme == "tokyonight" then
  -- Colorschene tokyonight settings
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_italic_comments = true
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_dark_float = true
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

  -- change the "hint" color to the "orange" color, and make the "error" color bright red
  vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

  lvim.builtin.galaxyline = {
    active = true,
    colors = {
      alt_bg = "#173450",
      grey = "#8BA4BD",
      blue = "#569CD6",
      green = "#608B4E",
      yellow = "#DCDCAA",
      orange = "#FF8800",
      purple = "#C586C0",
      magenta = "#D16D9E",
      cyan = "#4EC9B0",
      red = "#D16969",
      error_red = "#F44747",
      warning_orange = "#FF8800",
      info_yellow = "#FFCC66",
      hint_blue = "#9CDCFE",
    },
  }
end

-- Colorschene olimorris/onedarkpro
if lvim.colorscheme == "onedark" then
  local onedarkpro = require("onedarkpro")
  onedarkpro.setup({
    colors = {
      onedark = {
        bg = "#181a1f"
      },
    },
    styles = {
      comments = "italic",
      functions = "NONE",
      keywords = "bold,italic",
      strings = "NONE",
      variables = "NONE"
    },
    options = {
      bold = true,
      italic = true,
      underline = true,
      undercurl = true
    }
  })

  -- Set dark variant
  vim.o.background = "dark"
  -- Load colorscheme
  onedarkpro.load()
end
