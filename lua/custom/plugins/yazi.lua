return {
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
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
        -- '<cmd>Yazi cwd<cr>',
        '<leader>e',
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
      open_for_directories = false,
      -- REFACTOR:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
      floating_window_scaling_factor = 1.0,
      -- floating_window_scaling_factor = 0.99,
      yazi_floating_window_border = 'solid',
      -- yazi_floating_window_zindex = 51,

      -- EXPERIMENT:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
      -- the zindex of the yazi floating window. Can be used to make the yazi
      -- window fullscreen. See `:h nvim_open_win()` for more information.
      -- EXPERIMENT://///////////////////////////////////////////////////
      -- REFACTOR://///////////////////////////////////////////////////
      keymaps = {
        show_help = '<f1>',
        open_file_in_vertical_split = '<c-v>',
        open_file_in_horizontal_split = '<c-s>',
        grep_in_directory = '<c-z>',
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
