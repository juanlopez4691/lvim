-- ## Keymappings

-- Useful insert mode remappings
lvim.keys.normal_mode[ "<C-s>" ] = ":w<cr>"
lvim.keys.normal_mode[ "<C-c>" ] = "<ESC>"
-- Save and cancel
lvim.keys.normal_mode[ "<C-s>" ] = ":w<cr>"
lvim.keys.normal_mode[ "<C-c>" ] = "<ESC>"
-- Center cursor line when navigating jumps list
lvim.keys.normal_mode[ "<C-o>" ] = "<C-o>zz"
lvim.keys.normal_mode[ "<C-i>" ] = "<C-i>zz"
-- Plugin rmagatti/goto-preview
lvim.keys.normal_mode[ "gpd" ] = "zz<cmd>lua require('goto-preview').goto_preview_definition()<CR>"
lvim.keys.normal_mode[ "gpi" ] = "zz<cmd>lua require('goto-preview').goto_preview_implementation()<CR>"
lvim.keys.normal_mode[ "gP" ] = "<cmd>lua require('goto-preview').close_all_win()<CR>"
-- Move cursor while in insert mode
lvim.keys.insert_mode[ "A-h" ] = "<C-o>h"
lvim.keys.insert_mode[ "A-j" ] = "<C-o>j"
lvim.keys.insert_mode[ "A-k" ] = "<C-o>k"
lvim.keys.insert_mode[ "A-l" ] = "<C-o>l"

-- Resize window panes
if vim.fn.has "mac" == 1 then
  lvim.keys.normal_mode[ "<A-->" ] = ":resize -2<CR>"
  lvim.keys.normal_mode[ "<A-=>" ] = ":resize +2<CR>"
  lvim.keys.normal_mode[ "<A-,>" ] = ":vertical resize -2<CR>"
  lvim.keys.normal_mode[ "<A-.>" ] = ":vertical resize +2<CR>"
end

-- ## Whichkey mappings

-- Symbols outline plugin
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<CR>", "Symbols outline" }

-- Trouble plugin
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  t = { "<cmd>TroubleToggle<CR>", "Trouble toggle" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
}

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end

