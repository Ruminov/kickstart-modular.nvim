return {
  {
    'mikavilpas/yazi.nvim',
    -- event = 'VeryLazy',
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        '<leader>yf',
        mode = { 'n', 'v' },
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file',
      },
      {
        -- Open in the current working directory
        '<leader><leader>',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
      {
        '<leader>yr',
        '<cmd>Yazi toggle<cr>',
        desc = 'Resume the last yazi session',
      },
    },

    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = true,
      -- REFACTOR:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
      floating_window_scaling_factor = 1.0,
      yazi_floating_window_border = 'none',
      yazi_floating_window_zindex = 200,
      -- REFACTOR://///////////////////////////////////////////////////
      keymaps = {
        show_help = '<f1>',
      },
      integrations = {
        grep_in_directory = 'fzf-lua',
        grep_in_selected_files = 'fzf-lua',
      },
      future_features = {
        -- By default, this is `true`, which means yazi.nvim processes events
        -- before yazi has been closed. If this is `false`, events are processed
        -- in a batch when the user closes yazi. If this is `true`, events are
        -- processed immediately.
        process_events_live = false,
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      -- vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
