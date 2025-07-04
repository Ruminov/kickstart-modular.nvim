return {
  {
    'nvim-telescope/telescope.nvim',
    -- lazy = false,
    -- event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>p', '<cmd>SessionSearch<cr>', desc = 'Open auto-session picker' },
    },
    config = function()
      local actions = require 'telescope.actions'
      require('telescope').setup {
        defaults = {
          layout_strategy = 'center',
          sorting_strategy = 'ascending',
          prompt_prefix = 'Session: ',
          selection_caret = '$ ',

          mappings = {
            i = {
              ['<esc>'] = actions.close,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
              ['<C-d>'] = actions.results_scrolling_up,
              ['<C-u>'] = actions.results_scrolling_down,
            },
          },
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
