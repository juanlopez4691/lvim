-- Setup telescope extensions.
lvim.builtin.telescope.on_config_done = function(telescope)
  local actions = require('telescope.actions')

  telescope.setup({
    extensions = {
      file_browser = {
        theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          ["i"] = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ['q'] = actions.close,
          },
        },
      },
    }
  })
  telescope.load_extension("file_browser")
end
