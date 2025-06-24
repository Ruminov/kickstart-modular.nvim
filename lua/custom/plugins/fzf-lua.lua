return {
  {
    'ibhagwan/fzf-lua',
    opts = {},
    config = function()
      require('fzf-lua').setup {
        -- defaults = {},
        -- grep = {
        --   rg_opts = '--column --color=never --line-number --no-heading',
        -- },

        winopts = {
          height = 0.70, -- window height
          width = 0.70, -- window width
          border = 'single',
          preview = {
            default = 'bat',
            hidden = true,
            border = 'none',
          },
          treesitter = false,
        },
        fzf_opts = {
          ['--pointer'] = '>', -- change the pink arrow to something else or remove it
          -- ['--marker'] = 'X', -- optional: change the multi-select marker
        },
        fzf_colors = {
          true, -- inherit fzf colors that aren't specified below from
          -- the auto-generated theme similar to `fzf_colors=true`
          ['fg'] = { 'fg', 'Comment' },
          ['bg'] = { 'bg', 'Normal' },
          ['hl'] = { 'fg', 'LazySpecial' },
          ['fg+'] = { 'fg', { 'Normal' }, 'regular' },
          ['bg+'] = { 'bg', 'CursorLine' },
          ['hl+'] = { 'fg', { 'LazySpecial' }, 'regular' },
          ['info'] = { 'fg', 'StatusLineNC' },
          ['prompt'] = { 'fg', { 'Normal' }, 'regular' },
          ['pointer'] = { 'fg', 'LazySpecial' },
          ['marker'] = { 'fg', 'Keyword' },
          ['spinner'] = { 'fg', 'LazySpecial' },
          ['header'] = { 'fg', 'Comment' },
          ['query'] = { 'fg', { 'Normal' }, 'regular' },
          ['gutter'] = '-1',
        },
        files = { hidden = false },
        helptags = { previewer = 'help_native' },
        lsp = { lsp = { code_actions = { previer = 'codeaction_native' } } },
        tags = { previewer = 'bat' },
        btags = { previewer = 'bat' },
        -- highlights = { previewer = 'bat' },
        previewers = {
          bat = {
            cmd = 'bat',
            args = '--style=numbers --color always',
            theme = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
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
            ['alt-a'] = 'toggle-all',
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
      local builtin = require 'fzf-lua'
      vim.keymap.set('n', '<leader>sh', builtin.highlights, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_cword, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep_native, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics_document, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    end,
  },
}
