return {
  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = {
      'ibhagwan/fzf-lua',
    },
    config = function()
      require('auto-session').setup {
        pre_save_cmds = {
          -- To make sure that auto-session plugin only saves the currently visiblue buffers
          function()
            -- 1. Gather the buffer numbers of all visible windows
            local visible_bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local buf = vim.api.nvim_win_get_buf(win)
              visible_bufs[buf] = true
            end

            -- 2. Delete every listed + loaded buffer not in the visible set
            for _, buf in ipairs(vim.fn.getbufinfo { buflisted = 1 }) do
              if not visible_bufs[buf.bufnr] then
                vim.api.nvim_buf_delete(buf.bufnr, { force = true })
              end
            end
          end,
        },

        pre_restore_cmds = {},
        post_restore_cmds = {
          function()
            local path = vim.fn.getcwd() .. '/.sot'
            if vim.fn.filereadable(path) == 1 then
              -- load .sot first line to module storage
              require('custom.modules.sot').parse_first_line_data()
              -- Populate the qflist if file exist and pattern is available
              require('custom.modules.sot').populate_qflist()
            end
          end,
        },

        -- Save quickfix list and open it when restoring the session
        save_extra_cmds = {},

        -- log_level = 'debug',
        enabled = true, -- Enables/disables auto creating, saving and restoring
        root_dir = vim.fn.stdpath 'data' .. '/sessions/', -- Root dir where sessions will be stored
        auto_save = true, -- Enables/disables auto saving session on exit
        auto_restore = true, -- Enables/disables auto restoring session on start
        auto_create = false, -- Enables/disables auto creating new session files. Can take a function that should return true/false if a new session file should be created or not
        suppressed_dirs = {
          '~/',
          '~/Projects',
          '~/Downloads',
          '/',
          '~/adsequi/*',
          '~/code/syntax/*',
          '~/code/patterns/*',
          '~/code/snippets/*',
        },
        allowed_dirs = nil, -- Allow session restore/create in certain directories
        auto_restore_last_session = false, -- On startup, loads the last saved session if session for cwd does not exist
        git_use_branch_name = true, -- Include git branch name in session name
        lazy_support = true, -- Automatically detect if Lazy.nvim is being used and wait until Lazy is done to make sure session is restored correctly. Does nothing if Lazy isn't being used. Can be disabled if a problem is suspected or for debugging
        bypass_save_filetypes = nil, -- List of filetypes to bypass auto save when the only buffer open is one of the file types listed, useful to ignore dashboards
        close_unsupported_windows = true, -- Close windows that aren't backed by normal file before autosaving a session
        args_allow_single_directory = true, -- Follow normal session save/load logic if launched with a single directory as the only argument
        args_allow_files_auto_save = false, -- Allow saving a session even when launched with a file argument (or multiple files/dirs). It does not load any existing session first. While you can just set this to true, you probably want to set it to a function that decides when to save a session when launched with file args. See documentation for more detail
        continue_restore_on_error = true, -- Keep loading the session even if there's an error
        show_auto_restore_notif = true, -- Whether to show a notification when auto-restoring
        cwd_change_handling = true, -- Follow cwd changes, saving a session before change and restoring after
        -- WARNING: It could potentially break LSP
        -- TEST:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        lsp_stop_on_restore = true, -- Should language servers be stopped when restoring a session. Can also be a function that will be called if set. Not called on autorestore from startup
        -- TEST://///////////////////////////////////////////////////
        restore_error_handler = nil, -- Called when there's an error restoring. By default, it ignores fold errors otherwise it displays the error and returns false to disable auto_save
        purge_after_minutes = nil, -- Sessions older than purge_after_minutes will be deleted asynchronously on startup, e.g. set to 14400 to delete sessions that haven't been accessed for more than 10 days, defaults to off (no purging), requires >= nvim 0.10
        log_level = 'error', -- Sets the log level of the plugin (debug, info, warn, error).

        session_lens = {
          picker = 'fzf',
          mappings = {
            -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
            delete_session = { { 'i', 'n' }, '<C-x>' },
            alternate_session = { 'i', '<C-S>' },
            -- copy_session = { 'i', '<C-Y>' },
          },

          picker_opts = {
            -- For Fzf-Lua, picker_opts just turns into winopts, see:
            -- https://github.com/ibhagwan/fzf-lua#customization
            --
            --  height = 0.8,
            --  width = 0.50,
          },

          -- Telescope only: If load_on_setup is false, make sure you use `:AutoSession search` to open the picker as it will initialize everything first
          load_on_setup = true,
        },
      }
    end,
  },
}
