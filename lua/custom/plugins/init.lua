require 'helper'

local files = {
  'core',
  'install',
  'flatten',
  'alpha',
  'nvimtree',
  'telescope',
  'treesitter',
}

Helper.require_files('custom/plugins/', files)
