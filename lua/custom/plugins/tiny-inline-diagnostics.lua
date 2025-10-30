return {
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy',
    priority = 1000,
    config = function()
      require('tiny-inline-diagnostic').setup {
        -- preset = 'powerline',
        transparent_bg = true,
        transparent_cursorline = true,

        hi = {
          background = 'None',
          arrow = 'ErrorMsg',
        },
        signs = {
          left = '', -- Left border character
          right = '', -- Right border character
          diag = '●', -- Diagnostic indicator character
          -- arrow = '➜', -- Arrow pointing to diagnostic
          -- up_arrow = '🭯   ', -- Upward arrow for multiline
          vertical = ' │', -- Vertical line for multiline
          vertical_end = ' └', -- End of vertical line for multiline
        },

        options = {
          show_source = {
            enabled = true,
            -- Show source only when multiple sources exist for the same diagnostic
            if_many = true,
          },
          show_all_diags_on_cursorline = true,
        },
      }
      -- Start with the highlight disabled
      require('tiny-inline-diagnostic').disable()
    end,
  },
}
