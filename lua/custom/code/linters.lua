--
-- Setup linters for JavaScript family
--
-- lvim.lang.javascript.linters = { { exe = "eslint" } }
-- lvim.lang.typescript.linters = lvim.lang.javascript.linters
-- lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters
-- lvim.lang.typescriptreact.linters = lvim.lang.javascript.linters
-- lvim.lang.vue.linters = lvim.lang.javascript.linters

-- CSS formatter
-- lvim.lang.css.formatters = {{ "prettier" }}

-- PHP linter & formatter
-- TODO: get phpcs to run when file is saved
-- TODO: run phpcbf manually
-- lvim.lang.php.linters = {{ exe = "phpcs" }}
-- lvim.lang.php.formatters = {{ exe = "phpcbf" }}

-- Linting
local linters = require 'lvim.lsp.null-ls.linters'
linters.setup {
  { command = 'phpcs', filetypes = { 'php' } },
}
