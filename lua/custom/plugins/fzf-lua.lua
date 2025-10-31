return {
  {
    'ibhagwan/fzf-lua',
    opts = {},
    event = 'VeryLazy',
    config = function()
      require('fzf-lua').setup {
        -- defaults = {},
        -- grep = {
        --   rg_opts = '--column --color=never --line-number --no-heading',
        -- },
        winopts = {
          height = 1.0, -- 0.70
          width = 1.0, -- 0.70
          -- border = 'none', -- single
          -- border = false,
          border = 'none',
          preview = {
            default = 'bat',
            hidden = true,
            border = 'none',
          },
          treesitter = false,
        },
        fzf_opts = {
          ['--pointer'] = '$', -- change the pink arrow to something else or remove it
          -- ['--marker'] = 'X', -- optional: change the multi-select marker
          -- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
          ['--no-separator'] = true,
          -- optional: hide the "x/y" info line at the bottom
          -- ['--info'] = 'hidden',
          -- /////////////////////////////////////////////////////
          ['--gutter'] = ' ',
          ['--no-scrollbar'] = '',
        },
        fzf_colors = {
          true, -- inherit fzf colors that aren't specified below from
          -- the auto-generated theme similar to `fzf_colors=true`
          ['fg'] = { 'fg', 'gray-fg-100' },
          -- ['bg'] = { 'bg', 'Normal' },
          ['hl'] = { 'fg', 'SourceBlue' },
          ['fg+'] = { 'fg', { 'SourceWhite' }, 'regular' },
          ['bg+'] = { 'bg', 'gray-bg-400' },
          ['hl+'] = { 'fg', { 'SourceBlue' }, 'regular' },
          ['info'] = { 'fg', 'gray-fg-100' },
          ['prompt'] = { 'fg', { 'Normal' }, 'regular' },
          ['pointer'] = { 'fg', 'SourcePrompt' },
          ['marker'] = { 'fg', 'Keyword' },
          ['spinner'] = { 'fg', 'SourceBlue' },
          ['header'] = { 'fg', 'Comment' },
          ['query'] = { 'fg', { 'Normal' }, 'regular' },
        },
        buffers = { hidden = false, file_icons = false },
        files = { hidden = false, file_icons = false },
        git = {
          grep = { file_icons = false },
          status = { file_icons = false },
          diff = { file_icons = false },
          hunks = { file_icons = false },
          commits = { file_icons = false },
          bcommits = { file_icons = false },
          blame = { file_icons = false },
          branches = { file_icons = false },
          stash = { file_icons = false },
          icons = { file_icons = false },
          -- tags = { file_icons = false, previewer = 'bat' },
        },
        grep = {
          file_icons = false,
        },
        oldfiles = {
          file_icons = false,
          prompt = 'History: ',
          -- cwd_only = true,
          -- stat_file = false,
          -- include_current_session = true,
        },
        tags = { file_icons = false, previewer = 'bat' },
        helptags = { file_icons = false, previewer = 'help_native' },
        btags = { file_icons = false, previewer = 'bat' },
        -- highlights = { previewer = 'bat' },
        previewers = {
          cat = {
            cmd = 'cat',
            args = '-n',
          },
          bat = {
            cmd = 'bat',
            args = '--style=numbers --color always',
            -- theme = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
            theme = 'Source', -- bat preview theme (bat --list-themes)
            config = nil, -- nil uses $BAT_CONFIG_PATH
          },
          builtin = {
            treesitter = {
              enabled = false,
            },
          },
        },
        keymap = {
          -- Below are the default binds, setting any value in these tables will override
          -- the defaults, to inherit from the defaults change [1] from `false` to `true`
          builtin = {
            -- neovim `:tmap` mappings for the fzf win
            -- true, -- uncomment to inherit all the below in your custom config
            ['<M-Esc>'] = 'hide', -- hide fzf-lua, `:FzfLua resume` to continue
            ['<F1>'] = 'toggle-help',
            ['<A-f>'] = 'toggle-fullscreen',
            -- Only valid with the 'builtin' previewer
            ['<F3>'] = 'toggle-preview-wrap',
            ['<A-p>'] = 'toggle-preview',
            -- Rotate preview clockwise/counter-clockwise
            ['<F5>'] = 'toggle-preview-ccw',
            ['<F6>'] = 'toggle-treview-cw',
            -- `ts-ctx` binds require `nvim-treesitter-context`
            ['<F7>'] = 'toggle-preview-ts-ctx',
            ['<F8>'] = 'preview-ts-ctx-dec',
            ['<F9>'] = 'preview-ts-ctx-inc',
            ['<S-Left>'] = 'preview-reset',
            ['<A-j>'] = 'preview-page-down',
            ['<A-k>'] = 'preview-page-up',
            -- TODO: Add this keymap when the plugin provides more support
            -- FEAT:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            -- ['<A-w>'] = 'focus-preview',
            -- FEAT://///////////////////////////////////////////////////
            ['<M-S-down>'] = 'preview-down',
            ['<M-S-up>'] = 'preview-up',
          },
          fzf = {
            -- fzf '--bind=' options
            true, -- uncomment to inherit all the below in your custom config
            ['ctrl-z'] = 'abort',
            -- ['ctrl-y'] = 'unix-line-discard',
            ['ctrl-d'] = 'half-page-down',
            ['ctrl-u'] = 'half-page-up',
            ['ctrl-a'] = 'beginning-of-line',
            ['ctrl-e'] = 'end-of-line',
            ['alt-w'] = 'toggle-all',
            ['alt-g'] = 'first',
            ['alt-G'] = 'last',
            -- Only valid with fzf previewers (bat/cat/git/etc)
            ['f3'] = 'toggle-preview-wrap',
            ['alt-p'] = 'toggle-preview',
            ['alt-j'] = 'preview-page-down',
            ['alt-k'] = 'preview-page-up',
          },
        },
      }

      -- See `:help telescope.builtin`
      local key = vim.keymap.set
      local builtin = require 'fzf-lua'

      key('n', '<leader>p', require('auto-session').search, { desc = 'Open auto-session picker' })
      key('n', '<leader>sh', builtin.highlights, { desc = '[S]earch [H]ighlights' })
      key('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      key('n', '<leader>sf', builtin.files, { desc = '[S]earch [F]iles' })
      key('n', '<leader>ss', builtin.git_status, { desc = '[S]earch LSP [S]ymbols' })
      key('n', '<leader>sy', builtin.lsp_document_symbols, { desc = '[S]earch LSP [S]ymbols' })
      key('n', '<leader>S', builtin.builtin, { desc = '[S]earch [B]uiltin' })
      key('n', '<leader>sw', builtin.grep_cword, { desc = '[S]earch current [W]ord' })
      key('n', '<leader>sg', builtin.live_grep_native, { desc = '[S]earch [T]ext with [G]rep' })
      key('n', '<leader>sd', builtin.diagnostics_document, { desc = '[S]earch [D]iagnostics' })
      key('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      key('n', '<leader>so', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      key('n', '<leader>sb', builtin.buffers, { desc = '[S]earch existing buffers' })

      -- todo comments grep
      key('n', '<leader>st', function()
        builtin.grep { search = [[\b(TODO|FIX):]], no_esc = true }
      end, { desc = 'fzf-lua grep TODO/FIX tags' })
      key('n', '<leader>sT', function()
        builtin.grep { search = '\\b(REFACTOR|FEAT|DEBUG):[^/]', no_esc = true }
      end, { desc = 'fzf-lua grep tags' })
      key('n', '<leader>sx', function()
        builtin.grep { search = '\\b(TEST|EXPERIMENT):[^/]', no_esc = true }
      end, { desc = 'fzf-lua grep TODO/FIX tags' })
    end,
  },
}
