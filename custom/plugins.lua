-- ## Core plugins custom settings

local max_window_width = math.ceil(math.min(vim.o.columns, math.max(120, vim.o.columns - 5)))
local max_window_height = math.ceil(math.min(vim.o.lines, math.max(20, vim.o.lines - 7)))

-- Ensure nvimtree shows git status icons.
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.highlight_opened_files = "all"

-- Ensure telescope shows full path to files.
lvim.builtin.telescope.defaults.path_display = {"absolute"}
lvim.builtin.telescope.defaults.layout_strategy = "flex"
-- Exclude some folders from telescope live_grep.
lvim.builtin.telescope.defaults.file_ignore_paths = {"vendor", "node_modules", "dist"}
lvim.builtin.telescope.defaults.vimgrep_arguments = {
  "rg",
  'rg',
  '--color=never',
  '--no-heading',
  '--with-filename',
  '--line-number',
  '--column',
  '--smart-case',
  "--hidden",
  "--glob=!.git/",
  '--ignore-file',
  '.gitignore'
}

-- We want a bigger telescope window
lvim.builtin.telescope.defaults.layout_config.width = 0.9

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
      require('symbols-outline').setup()
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
    event = "BufRead",
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
}

-- Attach ls_signature to lsp
lvim.lsp.on_attach_callback = function()
  require("lsp_signature").on_attach()
end

