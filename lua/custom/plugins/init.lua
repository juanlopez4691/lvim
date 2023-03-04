require 'helper'

local files = {
  'core',
  'install',
  'alpha',
  'nvimtree',
  'telescope',
  'treesitter',
}

Helper.require_files('custom/plugins/', files)
