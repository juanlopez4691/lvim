require 'helper'

local files = {
  'core',
  'install',
  'nvimtree',
  'telescope',
  'treesitter',
}

Helper.require_files('custom/plugins/', files)
