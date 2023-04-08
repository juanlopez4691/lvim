-- ## Keymappings

-- Useful insert mode remappings
lvim.keys.insert_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["<C-c>"] = "<ESC>"
-- Save and cancel
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-c>"] = "<ESC>"
-- Center cursor line when navigating jumps list
lvim.keys.normal_mode["<C-o>"] = "<C-o>zz"
lvim.keys.normal_mode["<C-i>"] = "<C-i>zz"
-- Move cursor while in insert mode
lvim.keys.insert_mode["<A-h>"] = "<C-o>h"
lvim.keys.insert_mode["<A-j>"] = "<C-o>j"
lvim.keys.insert_mode["<A-k>"] = "<C-o>k"
lvim.keys.insert_mode["<A-l>"] = "<C-o>l"
-- Tab switch buffer
lvim.keys.normal_mode["<A-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<A-l>"] = ":BufferLineCycleNext<CR>"
-- Restore jump to screen top, bottom
lvim.keys.normal_mode["<S-h>"] = "H"
lvim.keys.normal_mode["<S-l>"] = "L"
-- Resize window panes
if vim.fn.has "mac" == 1 then
  lvim.keys.normal_mode["<A-->"] = ":resize -2<CR>"
  lvim.keys.normal_mode["<A-=>"] = ":resize +2<CR>"
  lvim.keys.normal_mode["<A-,>"] = ":vertical resize -2<CR>"
  lvim.keys.normal_mode["<A-.>"] = ":vertical resize +2<CR>"
end

-- ## Whichkey mappings

-- Telescope File Browser
lvim.builtin.which_key.mappings["E"] = { "<cmd>Telescope file_browser<CR>", "Telescope file browser" }

-- Symbols outline plugin
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<CR>", "Symbols outline" }

-- Plugin danymat/neogen
lvim.builtin.which_key.mappings["N"] = {
  name = "Neogen",
  c = { "<cmd>lua require('neogen').generate({ type = 'class' })<CR>", "Generate class doc block" },
  f = { "<cmd>lua require('neogen').generate({ type = 'func' })<CR>", "Generate function doc block" },
}
-- Plugin rmagatti/goto-preview
lvim.builtin.which_key.mappings["G"] = {
  name = "+Goto preview",
  d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Preview definition" },
  i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Preview implementation" },
  r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "Preview references" },
  P = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close all windows" },
}
-- Trouble plugin
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "Quick fix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "Location list" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
}
