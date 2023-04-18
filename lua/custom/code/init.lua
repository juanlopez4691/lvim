require 'helper'

local files = {
  'formatters',
  'linters',
  'lsp',
  'php_debug',
  'lua_ls',
}

Helper.require_files('custom/code/', files)
