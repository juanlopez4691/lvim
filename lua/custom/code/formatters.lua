--
-- Setup formatters for JavaScript family
--
-- lvim.lang.javascript.formatters = {
--   {
--     exe = "prettier",
--     args = lvim.lang.javascript.formatters[1].args,
--   },
-- }
-- lvim.lang.typescript.formatters = lvim.lang.javascript.formatters
-- lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
-- lvim.lang.typescriptreact.formatters = lvim.lang.javascript.formatters
-- lvim.lang.vue.formatters = lvim.lang.javascript.formatters

-- Formatters set up.
local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup({
  {
    exe = "prettier",
    filetypes = {
      "javascript",
      "json",
      "scss",
      "css"
    }
  }
})

formatters.setup {
  { command = "phpcsfixer", filetypes = { "php" } },
}

lvim.format_on_save = {
  pattern = { "*.php" },
}
