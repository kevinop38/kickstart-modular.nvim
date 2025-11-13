-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- {
  --   'nvim-tree/nvim-web-devicons',
  --   lazy = true,
  --   config = function()
  --     require('nvim-web-devicons').setup { color_icons = true, default = true, strict = true }
  --   end,
  -- },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  {
    'OXY2DEV/markview.nvim',
    lazy = false,

    -- Completion for `blink.cmp`
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      require('markview').setup {
        preview = { enable = false, icon_provider = 'devicons' },
      }
    end,
  },
  {
    'vhyrro/luarocks.nvim',
    priority = 1001, -- ensure it runs before anything needing rocks
    opts = { rocks = { 'magick' } }, -- <-- installs 'magick'
  },
  {
    '3rd/image.nvim',
    dependencies = {
      'vhyrro/luarocks.nvim', -- optional helpers, if needed
    },
    config = function()
      require('image').setup {
        -- optional settings
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            only_render_image_at_cursor_mode = 'popup', -- or "inline"
            floating_windows = false, -- if true, images will be rendered in floating markdown windows
            filetypes = { 'markdown', 'vimwiki' }, -- markdown extensions (ie. quarto) can go here
          },
          neorg = {
            enabled = true,
            filetypes = { 'norg' },
          },
          typst = {
            enabled = true,
            filetypes = { 'typst' },
          },
          html = {
            enabled = false,
          },
          css = {
            enabled = false,
          },
        },
        backend = 'kitty', -- or "ueberzug"
        max_height_window_percentage = 50,
        hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.svg', '*.ppm' },
        -- other options per your workflow
      }
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      require('ufo').setup()
    end,
  },
  {
    'Pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup {
        enabled = true,
        execution_message = {
          message = function()
            return ''
          end, -- no message when saving
        },
        trigger_events = { 'InsertLeave', 'TextChanged' },
      }
    end,
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers', -- show buffers (tabs = show tabpages)
          numbers = 'none', -- "ordinal" | "buffer_id" | "both" etc.
          diagnostics = 'nvim_lsp', -- show LSP diagnostics in bufferline
          separator_style = 'padded_slant', -- "slant" | "padded_slant" | "thick" | "thin"
          show_buffer_close_icons = true,
          show_buffer_icons = true,
          show_close_icon = false,
          always_show_bufferline = true,
          color_icons = true,
          -- get_element_icon = function(element)
          --   local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
          --   return icon, hl
          -- end,
          show_tab_indicators = true,
        },
      }
    end,
  },
}
