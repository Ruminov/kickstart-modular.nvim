-- Highlight todo, notes, etc in comments
return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>tt', 'OTODO: <Esc><Cmd>normal gcc<CR>A <Left>', desc = 'Add todo comment', mode = 'n' },
      { '<leader>tn', 'ONOTE: <Esc><Cmd>normal gcc<CR>A <Left>', desc = 'Add note comment', mode = 'n' },
      { '<leader>tf', 'OFIX: <Esc><Cmd>normal gcc<CR>A <Left>', desc = 'Add fix comment', mode = 'n' },
      { '<leader>tw', 'OWARNING: <Esc><Cmd>normal gcc<CR>A <Left>', desc = 'Add warning comment', mode = 'n' },
      -- TEST:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
      {
        '<leader>tr',
        'OREFACTOR://///////////////////////////////////////////////////<Esc>.vblr\\Vj<Cmd>normal gcc<CR>',
        desc = 'Add refactor comment',
        mode = 'n',
      },
      {
        '<leader>td',
        'ODEBUG://///////////////////////////////////////////////////<Esc>.vblr\\Vj<Cmd>normal gcc<CR>',
        desc = 'Add debug comment',
        mode = 'n',
      },
      {
        '<leader>te',
        'OFEAT://///////////////////////////////////////////////////<Esc>.vblr\\Vj<Cmd>normal gcc<CR>',
        desc = 'Add feat comment',
        mode = 'n',
      },
      {
        '<leader>ts',
        'OTEST://///////////////////////////////////////////////////<Esc>.vblr\\Vj<Cmd>normal gcc<CR>',
        desc = 'Add test comment',
        mode = 'n',
      },
      {
        '<leader>tx',
        'OEXPERIMENT://///////////////////////////////////////////////////<Esc>.vblr\\Vj<Cmd>normal gcc<CR>',
        desc = 'Add experiment comment',
        mode = 'n',
      },
      -- previous iteration ↓
      -- { '<leader>tr', 'OREFACTOR:<Esc><Cmd>normal gcc<CR>53A\\<Esc>Vypf\\53r/', desc = 'Add refactor comment', mode = 'n' },
      -- { '<leader>td', 'ODEBUG:<Esc><Cmd>normal gcc<CR>53A\\<Esc>Vypf\\53r/', desc = 'Add debug comment', mode = 'n' },
      -- { '<leader>te', 'OFEAT:<Esc><Cmd>normal gcc<CR>53A\\<Esc>Vypf\\53r/', desc = 'Add feat comment', mode = 'n' },
      -- { '<leader>ts', 'OTEST:<Esc><Cmd>normal gcc<CR>53A\\<Esc>Vypf\\53r/', desc = 'Add test comment', mode = 'n' },
      -- { '<leader>tx', 'OEXPERIMENT:<Esc><Cmd>normal gcc<CR>53A\\<Esc>Vypf\\53r/', desc = 'Add test comment', mode = 'n' },
      -- TEST://///////////////////////////////////////////////////
    },
    opts = {
      signs = false,
      gui_style = {
        fg = 'NONE', -- The gui style to use for the fg highlight group.
        bg = 'NONE', -- The gui style to use for the bg highlight group.
      },
      highlight = {
        multiline = false, -- enable multine todo comments
        keyword = 'fg', -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = 'fg', -- "fg" or "bg" or empty
        comments_only = true, -- uses treesitter to match keywords in comments only
        exclude = {}, -- list of file types to exclude highlighting
      },

      colors = {
        fix = { 'SourceRed' },
        todo = { 'SourcePink' },
        warning = { 'SourceOrange' },
        test = { 'cyan-fg-200' },
        default = { 'gray-fg-100' },
      },

      keywords = {
        -- Todocomments purpose: Repair, Improve, Create, Inform, Review
        -- Repair: FIX, DEBUG
        -- Improve: TODO, REFACTOR
        -- Create: TODO, FEAT
        -- Inform: WARNING, NOTE
        -- Review: TEST, EXPERIMENT

        FIX = { color = 'fix', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
        DEBUG = { color = 'fix' },

        TODO = { color = 'todo' },
        FEAT = { color = 'todo' },

        REFACTOR = { color = 'todo' },

        WARNING = { color = 'warning', alt = { 'WARN' } },
        NOTE = { color = 'warning' },

        TEST = { color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
        EXPERIMENT = { color = 'test' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
