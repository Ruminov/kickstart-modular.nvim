return {
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      {
        -- Open in the current working directory
        '<leader>e',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
    },

    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      floating_window_scaling_factor = 0.99,
      yazi_floating_window_border = 'none',
      -- yazi_floating_window_zindex = 51,

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
        -- process_events_live = false,
      },
    },
  },
}
