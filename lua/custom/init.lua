require 'helper'

-- Load custom settings, plugins, etc
local files = {
  'settings',
  'plugins/init',
  'colorscheme',
  'code/init',
  'keymappings',
  'autocommands',
}

Helper.require_files('custom/', files)
