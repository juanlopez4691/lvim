require 'helper'

local files = {
  'formatters',
  'linters',
  'lsp',
  'php_debug',
}

Helper.require_files('custom/code/', files)
