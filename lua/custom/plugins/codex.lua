-- Integrates the Codex CLI into a toggleable Neovim terminal window.
return {
  'kkrampis/codex.nvim',
  lazy = true,
  cmd = { 'Codex', 'CodexToggle' },
  keys = {
    {
      '<leader>cc',
      function()
        require('codex').toggle()
      end,
      desc = 'Toggle Codex',
      mode = { 'n', 't' },
    },
  },
  opts = {
    keymaps = {
      toggle = '<C-e>',
      quit = '<C-q>',
    },
    border = 'rounded',

    -- popup 大小
    width = 0.8,
    height = 0.8,

    model = nil,

    autoinstall = false,

    panel = false,

    use_buffer = false,
  },
}
