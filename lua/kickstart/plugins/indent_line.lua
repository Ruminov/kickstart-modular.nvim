return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    event = 'VeryLazy',
    opts = {},
    config = function()
      local highlight = {
        'gray-fg-300',
      }
      require('ibl').setup {
        indent = { highlight = highlight },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
        exclude = {
          filetypes = { 'sot' },
        },
      }
    end,
  },
}
