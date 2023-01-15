-- ## Core plugins custom settings

local max_window_width = math.ceil(math.min(vim.o.columns, math.max(120, vim.o.columns - 5)))
local max_window_height = math.ceil(math.min(vim.o.lines, math.max(20, vim.o.lines - 7)))

-- Ensure nvimtree shows git status icons.
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.highlight_opened_files = "all"

-- Define telescope config settings.
local telescope = lvim.builtin.telescope
local _, actions = pcall(require, "telescope.actions")
local window_max_size = {
  width = 0.95,
  height = 0.95,
}
telescope.defaults = {
  -- Exclude some folders from telescope live_grep.
  file_ignore_paths = {"vendor", "node_modules", "dist"},
  -- Ensure telescope shows full path to files.
  path_display = {"absolute"},
  -- Start telescope in normal mode.
  initial_mode = 'normal',
  -- Make telescope window bigger.
  layout_config = {
    center = window_max_size,
    vertical = window_max_size,
    horizontal = window_max_size,
  },
  -- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
  -- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
  mappings = {
    -- for input mode
    i = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-n>"] = actions.cycle_history_next,
      ["<C-p>"] = actions.cycle_history_prev,
    },
    -- for normal mode
    n = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
    },
  },
}

-- We want a bigger floating terminal.
lvim.builtin.terminal.float_opts.width = max_window_width
lvim.builtin.terminal.float_opts.height = max_window_height

-- ## User plugins installation
lvim.plugins = {
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require"lsp_signature".on_attach()
    end,
    event = "BufRead"
  },
  {
    "editorconfig/editorconfig-vim",
    event = "BufRead",
    config = function()
      vim.g.EditorConfig_exclude_patterns = {
        'fugitive://.*',
        'scp://.*'
      }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
        '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = "cubic", -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup({
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = 'right',
        relative_width = true,
        width = 25,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = '',
        autofold_depth = nil,
        auto_unfold_hover = true,
        fold_markers = { '', '' },
        wrap = false,
        keymaps = { -- These keymaps can be a string or a table for multiple keys
          close = {"<Esc>", "q"},
          goto_location = "<Cr>",
          focus_location = "o",
          hover_symbol = "<C-space>",
          toggle_preview = "K",
          rename_symbol = "r",
          code_actions = "a",
          fold = "h",
          unfold = "l",
          fold_all = "W",
          unfold_all = "E",
          fold_reset = "R",
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
          File = {icon = "", hl = "TSURI"},
          Module = {icon = "", hl = "TSNamespace"},
          Namespace = {icon = "", hl = "TSNamespace"},
          Package = {icon = "", hl = "TSNamespace"},
          Class = {icon = "𝓒", hl = "TSType"},
          Method = {icon = "ƒ", hl = "TSMethod"},
          Property = {icon = "", hl = "TSMethod"},
          Field = {icon = "", hl = "TSField"},
          Constructor = {icon = "", hl = "TSConstructor"},
          Enum = {icon = "ℰ", hl = "TSType"},
          Interface = {icon = "ﰮ", hl = "TSType"},
          Function = {icon = "", hl = "TSFunction"},
          Variable = {icon = "", hl = "TSConstant"},
          Constant = {icon = "", hl = "TSConstant"},
          String = {icon = "𝓐", hl = "TSString"},
          Number = {icon = "#", hl = "TSNumber"},
          Boolean = {icon = "⊨", hl = "TSBoolean"},
          Array = {icon = "", hl = "TSConstant"},
          Object = {icon = "⦿", hl = "TSType"},
          Key = {icon = "🔐", hl = "TSType"},
          Null = {icon = "NULL", hl = "TSType"},
          EnumMember = {icon = "", hl = "TSField"},
          Struct = {icon = "𝓢", hl = "TSType"},
          Event = {icon = "🗲", hl = "TSType"},
          Operator = {icon = "+", hl = "TSOperator"},
          TypeParameter = {icon = "𝙏", hl = "TSParameter"}
        }
      })
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufWinEnter",
    config = function()
      local status_ok, colorizer = pcall(require, "colorizer")
      if not status_ok then
        return
      end
      colorizer.setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
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
          vim.api.nvim_buf_set_keymap(buffer, 'n', 'q', ':q<CR>', {noremap = true})
        end
      }
    end
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = 2000,
        }
      }
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  {
    "jeffkreeftmeijer/vim-numbertoggle",
  },
}

-- Attach ls_signature to lsp
lvim.lsp.on_attach_callback = function()
  require("lsp_signature").on_attach()
end

