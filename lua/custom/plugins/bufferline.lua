-- Displays open buffers as a tab-like line with icons and diagnostics.
return {
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
}
