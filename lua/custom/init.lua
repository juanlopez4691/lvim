require 'helper'

-- Load custom settings, plugins, etc
local files = {
  'settings',
  'keymappings',
  'plugins/init',
  'code/init',
  'autocommands',
  'colorscheme',
}

Helper.require_files('custom/', files)
