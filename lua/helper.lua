Helper = {}

Helper.new = function()
  local self = {}
  return self
end

--
-- Requires a list of files from a directory.
--
function Helper.require_files(directory, files)
  for _, file in ipairs(files) do
    local status_ok, error = pcall(require, directory .. file)
    if not status_ok then
      print("something is wrong with your lv-config")
      print(error)
      break
    end
  end
end
