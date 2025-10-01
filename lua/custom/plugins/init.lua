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
