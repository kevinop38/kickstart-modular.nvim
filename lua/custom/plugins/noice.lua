-- Replaces the command-line, messages, and LSP popups with a richer UI.
return -- lazy.nvim
{
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    lsp = {
      hover = {
        enabled = true,
        silent = false,
        view = nil, -- nil 代表使用預設 hover view
        opts = {},
      },

      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true,
          luasnip = true,
          throttle = 50,
        },
      },

      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },

    presets = {
      lsp_doc_border = true,
    },

    views = {
      hover = {
        border = {
          style = 'rounded',
        },
        position = {
          row = 2,
          col = 0,
        },
        size = {
          max_width = 80,
          max_height = 20,
        },
        win_options = {
          wrap = true,
          linebreak = true,
        },
      },
    },
  },
  keys = {
    {
      'K',
      function()
        require('noice.lsp').hover()
      end,
      desc = 'LSP Hover',
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    }
  end,
}
