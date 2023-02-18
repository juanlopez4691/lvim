-- Define telescope config settings.
function telescope_settings()
  local telescope = lvim.builtin.telescope
  local _, actions = pcall(require, "telescope.actions")
  local window_max_size = {
    width = 0.95,
    height = 0.95,
  }

  lvim.builtin.telescope.pickers.find_files = {
    layout_strategy = "flex",
    layout_config = {
      preview_width = nil,
      prompt_position = "top",
    }
  }

  telescope.defaults = {
    -- Exclude some folders from telescope live_grep.
    file_ignore_paths = { "vendor", "node_modules", "dist" },
    -- Ensure telescope shows full path to files.
    path_display = { "absolute" },
    -- Start telescope in normal mode.
    initial_mode = 'normal',
    -- Make telescope window bigger.
    layout_config = {
      center = window_max_size,
      vertical = window_max_size,
      horizontal = window_max_size,
    },
    -- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
    -- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
    mappings = {
      -- for input mode
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      },
      -- for normal mode
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  }
end

-- Apply Telescope settings
telescope_settings()

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
    },
  })
  telescope.load_extension("file_browser")
end
