local base_path = '~/.config/lvim/lua/custom/'
local files = {
  'settings',
  'keymappings',
  'plugins',
  'autocommands',
  'colorscheme'
}

for i, file in ipairs(files) do
  local status_ok, error = pcall(vim.cmd, "luafile " .. base_path .. file .. ".lua")
  if not status_ok then
    print("something is wrong with your lv-config")
    print(error)
    break
  end
end

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
