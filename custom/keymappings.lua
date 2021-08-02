-- ## Keymappings

local keymap = require("utils.keymap")

-- Useful insert mode remappings
keymap.load_mode(
  "i",
  {
    { "<C-s>", ":w<cr>" },
    { "<C-c>", "<ESC>" },
    -- Move cursor
    { "A-h", "<C-o>h" },
    { "A-j", "<C-o>j" },
    { "A-k", "<C-o>k" },
    { "A-l", "<C-o>l" },
  },
  { silent = true }
)

-- Center cursor line when navigating jumps list
keymap.load_mode(
  "n",
  {
    { "<C-o>", "<C-o>zz" },
    { "<C-i>", "<C-i>zz" },
  },
  { silent = true, noremap = true }
)

-- Resize window panes
if vim.fn.has("mac") == 1 then
  keymap.load_mode(
    "n",
    {
      { "<A-->", ":resize -2<CR>" },
      { "<A-=>", ":resize +2<CR>" },
      { "<A-,>", ":vertical resize -2<CR>" },
      { "<A-.>", ":vertical resize +2<CR>" },
    },
    { silent = true, noremap = true }
  )
end

-- Plugin rmagatti/goto-preview
keymap.load_mode(
  "n",
  {
    { "gpd", "zz<cmd>lua require('goto-preview').goto_preview_definition()<CR>" },
    { "gpi", "zz<cmd>lua require('goto-preview').goto_preview_implementation()<CR>" },
    { "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>" }
  },
  { noremap = true, silent = true }
)

-- ## Whichkey mappings

-- Symbols outline plugin
lvim.builtin.which_key.mappings.o = {
  "<cmd>SymbolsOutline<CR>",
  "Symbols outline",
}

-- Trouble plugin
lvim.builtin.which_key.mappings.l.t = {
  "<cmd>TroubleToggle<CR>",
  "trouble toggle",
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
}

