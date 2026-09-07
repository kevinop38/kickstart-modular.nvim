-- Automatically saves buffers after text changes or leaving insert mode.
return {
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
}
