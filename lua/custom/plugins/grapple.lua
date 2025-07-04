return {
  {
    'cbochs/grapple.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    opts = {
      -- scope = "git", -- also try out "git_branch"
      -- scope = "cwd",
      scope = 'git_branch',
      icons = false, -- setting to "true" requires "nvim-web-devicons"
      -- style = 'basename',
      command = function(path)
        if vim.api.nvim_buf_get_name(0) ~= path then
          vim.cmd.edit(path)
        end
      end,
      win_opts = {
        -- Can be fractional
        width = 55,
        height = 12,
        row = 0.5,
        col = 0.5,

        relative = 'editor',
        border = 'single',
        style = 'minimal',

        title = 'Grapple', -- fallback title for Grapple windows
        title_pos = 'center',
        title_padding = ' ', -- custom: adds padding around window title

        footer = '', -- disable footer
        footer_pos = 'center',
      },
    },
    cmd = 'Grapple',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      { 'ñ', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple open tags window' },
      { '<leader>ñ', '<cmd>Grapple toggle<cr>', desc = 'Grapple toggle tag' },
      { '<leader>j', '<cmd>Grapple select index=1<cr>', desc = 'Select first tag' },
      { '<leader>k', '<cmd>Grapple select index=2<cr>', desc = 'Select second tag' },
      { '<leader>l', '<cmd>Grapple select index=3<cr>', desc = 'Select third tag' },
      -- { '<leader>l', '<cmd>Grapple select index=4<cr>', desc = 'Select fourth tag' },
    },
  },
}
