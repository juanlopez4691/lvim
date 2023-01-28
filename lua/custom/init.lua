local base_path = '~/.config/lvim/lua/custom/'
local files = {
  'settings',
  'keymappings',
  'plugins',
  'telescope',
  'autocommands',
  'colorscheme',
}

for i, file in ipairs(files) do
  local status_ok, error = pcall(vim.cmd, "luafile " .. base_path .. file .. ".lua")
  if not status_ok then
    print("something is wrong with your lv-config")
    print(error)
    break
  end
end
