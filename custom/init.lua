local base_path = '~/.config/lvim/custom/'
local files = {'settings', 'keymappings', 'plugins', 'autocommands', 'colorscheme'}

for i, file in ipairs(files) do
  local status_ok, error = pcall(vim.cmd, "luafile " .. base_path .. file .. ".lua")
  if not status_ok then
    print("something is wrong with your lv-config")
    print(error)
    break
  end
end

