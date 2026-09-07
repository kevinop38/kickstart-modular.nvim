-- Generates documentation annotations from Treesitter syntax information.
return {
  {
    'danymat/neogen',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local neogen = require 'neogen'

      neogen.setup {
        enabled = true,
        snippet_engine = 'luasnip',
      }
      local luasnip = require 'luasnip'

      vim.keymap.set({ 'i', 's' }, '<Tab>', function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
        end
      end, { silent = true })

      vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { silent = true })

      vim.keymap.set('n', '<leader>nd', function()
        neogen.generate()
      end, { desc = 'Neogen auto annotation' })

      vim.keymap.set('n', '<leader>nf', function()
        neogen.generate { type = 'func' }
      end, { desc = 'Neogen function annotation' })

      vim.keymap.set('n', '<leader>nc', function()
        neogen.generate { type = 'class' }
      end, { desc = 'Neogen class annotation' })

      vim.keymap.set('n', '<leader>nt', function()
        neogen.generate { type = 'type' }
      end, { desc = 'Neogen type annotation' })

      vim.keymap.set('n', '<leader>nF', function()
        neogen.generate { type = 'file' }
      end, { desc = 'Neogen file annotation' })
    end,
  },
}
