require 'helper'

local files = {
  'formatters',
  'linters',
  'php_debug',
}

Helper.require_files('custom/code/', files)
