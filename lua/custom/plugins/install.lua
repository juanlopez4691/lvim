-- ## Core plugins custom settings
local max_window_width = math.ceil(math.min(vim.o.columns, math.max(120, vim.o.columns - 5)))
local max_window_height = math.ceil(math.min(vim.o.lines, math.max(20, vim.o.lines - 7)))

-- We want a bigger floating terminal.
lvim.builtin.terminal.float_opts.width = max_window_width
lvim.builtin.terminal.float_opts.height = max_window_height

-- ## User plugins installation
lvim.plugins = {
  {
    'ray-x/lsp_signature.nvim',
    -- Attach lsp_signature to lsp
    config = function()
      require('lsp_signature').on_attach()
    end,
    event = 'BufRead'
  },
  {
    'karb94/neoscroll.nvim',
    event = 'WinScrolled',
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = 'cubic', -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end
  },
  {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    version = '*'
  },
  {
    -- 'simrat39/symbols-outline.nvim',
    'enddeadroyal/symbols-outline.nvim',
    branch = 'bugfix/symbol-hover-misplacement',
    config = function()
      require('symbols-outline').setup({
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = 'right',
        relative_width = true,
        width = 25,
        auto_close = false,
        show_numbers = true,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = '',
        autofold_depth = nil,
        auto_unfold_hover = true,
        fold_markers = { '', '' },
        wrap = false,
        keymaps = { -- These keymaps can be a string or a table for multiple keys
          close = { '<Esc>', 'q' },
          goto_location = '<Cr>',
          focus_location = 'o',
          hover_symbol = '<C-space>',
          toggle_preview = 'K',
          rename_symbol = 'r',
          code_actions = 'a',
          fold = 'h',
          unfold = 'l',
          fold_all = 'W',
          unfold_all = 'E',
          fold_reset = 'R',
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
          File = { icon = '', hl = '@text.uri' },
          Module = { icon = '', hl = '@namespace' },
          Namespace = { icon = '', hl = '@namespace' },
          Package = { icon = '', hl = '@namespace' },
          Class = { icon = '𝓒', hl = '@type' },
          Method = { icon = 'ƒ', hl = '@method' },
          Property = { icon = '', hl = '@method' },
          Field = { icon = '', hl = '@field' },
          Constructor = { icon = '', hl = '@constructor' },
          Enum = { icon = 'ℰ', hl = '@type' },
          Interface = { icon = 'ﰮ', hl = '@type' },
          Function = { icon = '', hl = '@function' },
          Variable = { icon = '', hl = '@constant' },
          Constant = { icon = '', hl = '@constant' },
          String = { icon = '𝓐', hl = '@string' },
          Number = { icon = '#', hl = '@number' },
          Boolean = { icon = '⊨', hl = '@boolean' },
          Array = { icon = '', hl = '@constant' },
          Object = { icon = '⦿', hl = '@type' },
          Key = { icon = '🔐', hl = '@type' },
          Null = { icon = 'NULL', hl = '@type' },
          EnumMember = { icon = '', hl = '@field' },
          Struct = { icon = '𝓢', hl = '@type' },
          Event = { icon = '🗲', hl = '@type' },
          Operator = { icon = '+', hl = '@operator' },
          TypeParameter = { icon = '𝙏', hl = '@parameter' },
          Component = { icon = '', hl = '@function' },
          Fragment = { icon = '', hl = '@constant' },
        }
      })
    end
  },
  {
    'themaxmarchuk/tailwindcss-colors.nvim',
    config = function()
      require('tailwindcss-colors').setup()
    end
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufWinEnter',
    config = function()
      require('colorizer').setup(
        { 'css', 'scss', 'html', 'php', 'twig', 'javascript' },
        {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        })
    end,
  },
  {
    'folke/trouble.nvim',
    cmd = 'TroubleToggle',
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {
        width = max_window_width; -- Width of the floating window
        height = 15; -- Height of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        -- post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
        post_open_hook = function(buffer, _)
          vim.api.nvim_buf_set_keymap(buffer, 'n', 'q', ':q<CR>', { noremap = true })
        end,
        references = {
          telescope = require('telescope.themes').get_dropdown({
            hide_preview = false,
            layout_config = {
              width = 0.8,
            },
          })
        }
      }
    end
  },
  {
    'nacro90/numb.nvim',
    event = 'BufRead',
    config = function()
      require('numb').setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    -- Telescope extension file_browser
    'nvim-telescope/telescope-file-browser.nvim',
    lazy = true,
  },
  {
    'jeffkreeftmeijer/vim-numbertoggle',
  },
  {
    'nvim-zh/colorful-winsep.nvim',
    event = 'BufWinEnter',
    config = function()
      require('colorful-winsep').setup({
        -- highlight for Window separator
        highlight = {
          bg = '#16161E',
          fg = '#32566E',
        },
        -- timer refresh rate
        interval = 30,
        -- This plugin will not be activated for filetype in the following table.
        no_exec_files = { 'packer', 'TelescopePrompt', 'mason', 'CompetiTest', 'NvimTree' },
        -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
        symbols = { '━', '┃', '┏', '┓', '┗', '┛' },
        close_event = function()
          -- Executed after closing the window separator
        end,
        create_event = function()
          -- Executed after creating the window separator
        end,
      })
    end
  },
  {
    'sindrets/diffview.nvim',
    event = 'BufWinEnter',
  },
  -- Color schemes.
  {
    'olimorris/onedarkpro.nvim',
  },
  {
    'rebelot/kanagawa.nvim',
  },
  {
    'tiagovla/tokyodark.nvim',
  },
  -- Prevents nesting of nvim instances
  {
    'willothy/flatten.nvim',
    config = true,
  },
}
