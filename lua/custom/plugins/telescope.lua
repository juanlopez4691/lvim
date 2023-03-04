-- Define telescope config settings.
local function telescope_settings()
  local telescope = lvim.builtin.telescope
  local _, actions = pcall(require, "telescope.actions")

  telescope.defaults = {
    -- Exclude some folders from telescope live_grep.
    file_ignore_paths = { "vendor", "node_modules", "dist" },
    -- Ensure telescope shows full path to files.
    path_display = { "absolute" },
    -- Start telescope in normal mode.
    initial_mode = 'normal',
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
    layout_config = {
      -- prompt_position = "top",
      height = 0.9,
      width = 0.9,
      bottom_pane = {
        height = 25,
        preview_cutoff = 120,
      },
      center = {
        height = 0.4,
        preview_cutoff = 40,
        width = 0.5,
      },
      cursor = {
        preview_cutoff = 40,
      },
      horizontal = {
        preview_cutoff = 120,
        preview_width = 0.6,
      },
      vertical = {
        preview_cutoff = 40,
      },
      flex = {
        flip_columns = 150,
      },
    },
  }

  for key, _ in pairs(lvim.builtin.telescope.pickers) do
    if key ~= "planets" then
      lvim.builtin.telescope.pickers[key].previewer = nil
      lvim.builtin.telescope.pickers[key].theme = nil
      lvim.builtin.telescope.pickers[key].layout_strategy = nil
    end
  end

  lvim.builtin.telescope.pickers.git_files.previewer = nil

  -- lvim.builtin.telescope.defaults.initial_mode = "insert"
  -- lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
  lvim.builtin.telescope.defaults.layout_strategy = "flex"
  lvim.builtin.telescope.defaults.prompt_prefix = "  "
  lvim.builtin.telescope.defaults.selection_caret = "❯ "
  lvim.builtin.telescope.defaults.mappings.i["<esc>"] = actions.close
  lvim.builtin.telescope.defaults.winblend = 10

  lvim.builtin.telescope.defaults.borderchars = {
    -- prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
    prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
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
        -- Do not open file_browser when starting nvim on a directory
        hijack_netrw = false,
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
