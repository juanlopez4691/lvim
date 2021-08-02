-- ## Keymappings

lvim.keys.normal_mode = {
  -- Useful insert mode remappings
  [ "<C-s>" ] = { ":w<cr>" },
  [ "<C-c>" ] = { "<ESC>" },
  -- Move cursor
  [ "A-h" ] = { "<C-o>h" },
  [ "A-j" ] = { "<C-o>j" },
  [ "A-k" ] = { "<C-o>k" },
  [ "A-l" ] = { "<C-o>l" },
  -- Save and cancel
  [ "<C-s>" ] = { ":w<cr>" },
  [ "<C-c>" ] = { "<ESC>" },
  -- Move cursor
  [ "A-h" ] = { "<C-o>h" },
  [ "A-j" ] = { "<C-o>j" },
  [ "A-k" ] = { "<C-o>k" },
  [ "A-l" ] = { "<C-o>l" },
  -- Center cursor line when navigating jumps list
  [ "<C-o>" ] = { "<C-o>zz" },
  [ "<C-i>" ] = { "<C-i>zz" },
  -- Plugin rmagatti/goto-preview
  [ "gpd" ] = { "zz<cmd>lua require('goto-preview').goto_preview_definition()<CR>" },
  [ "gpi" ] = { "zz<cmd>lua require('goto-preview').goto_preview_implementation()<CR>" },
  [ "gP" ] = { "<cmd>lua require('goto-preview').close_all_win()<CR>"},
}

-- Resize window panes
if vim.fn.has "mac" == 1 then
  lvim.keys.normal_mode = {
    [ "<A-->" ] = { ":resize -2<CR>" },
    [ "<A-=>" ] = { ":resize +2<CR>" },
    [ "<A-,>" ] = { ":vertical resize -2<CR>" },
    [ "<A-.>" ] = { ":vertical resize +2<CR>" },
  }
end

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

