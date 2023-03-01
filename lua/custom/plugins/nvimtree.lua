-- Ensure nvimtree shows git status icons.
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.highlight_opened_files = "all"

-- Adds support for nvim-rooter plugin
-- See https://github.com/notjedi/nvim-rooter.lua#usage
lvim.builtin.nvimtree.setup.update_cwd = true
lvim.builtin.nvimtree.setup.update_focused_file.enable = true
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = true
