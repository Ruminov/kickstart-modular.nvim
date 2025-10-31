local hl = vim.api.nvim_set_hl
-- HL for nvim background: Normal, NormalNC (inactive window)

-- Custom highlight groups
-- foreground
hl(0, 'TrackHL', { fg = '#FF0000', bg = '#00FF00' })
hl(0, 'SourcePrompt', { fg = '#00AFFF', bg = '#353535' })
hl(0, 'SourceBlue', { fg = '#48CBFF' })
hl(0, 'SourceRed', { fg = '#FE3B3B' })
hl(0, 'SourcePink', { fg = '#FF6BA8' })
hl(0, 'SourceYellow', { fg = '#FFD059' })
hl(0, 'SourceOrange', { fg = '#F28B2C' })
hl(0, 'cyan-fg-100', { fg = '#67F0E7' })
hl(0, 'cyan-fg-200', { fg = '#00DDC0' })
hl(0, 'SourceGreen', { fg = '#80EE6A' })
hl(0, 'SourceWhite', { fg = '#E5E5E5' })
hl(0, 'white-fg-200', { fg = '#B2B2B2' })
hl(0, 'gray-fg-000', { fg = '#A5A5A5' })
hl(0, 'gray-fg-100', { fg = '#828282' })
hl(0, 'gray-fg-200', { fg = '#676767' })
hl(0, 'gray-fg-300', { fg = '#555555' })
hl(0, 'gray-fg-400', { fg = '#353535' })
hl(0, 'gray-fg-500', { fg = '#1C1C1C' })

-- background
hl(0, 'gray-bg-000', { bg = '#A5A5A5' })
hl(0, 'gray-bg-100', { bg = '#828282' })
hl(0, 'gray-bg-200', { bg = '#676767' })
hl(0, 'gray-bg-300', { bg = '#555555' })
hl(0, 'gray-bg-400', { bg = '#353535' })
hl(0, 'gray-bg-500', { bg = '#1C1C1C' })

-- Background transparent for the float windows
hl(0, 'NormalFloat', { fg = 'none', bg = 'none' })
-- hl(0, 'FloatBorder', { fg = 'none', bg = 'none' })
hl(0, 'FloatBorder', { link = 'gray-fg-300' })
hl(0, 'FloatTitle', { fg = 'none', bg = 'none' })

-- hl(0, 'Normal', { bg = '#1C1C1C' })
-- EXPERIMENT:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- hl(0, 'Normal', { bg = '#161616' })
-- EXPERIMENT://///////////////////////////////////////////////////
-- hl(0, 'BqfPreviewFloat', { bg = '#1C1C1C' })
-- hl(0, 'BqfPreviewFloat', { bg = '#1C1C1C', fg = '#555555' })

-- No highlight references for the current word
hl(0, 'LspReferenceText', { link = 'none' })
hl(0, 'LspReferenceRead', { link = 'none' })
hl(0, 'LspReferenceWrite', { link = 'none' })

-- Background transparent for the blink suggestions
hl(0, 'Pmenu', { fg = 'none', bg = 'none' })
-- hl(0, "PmenuSel", { fg = "none", bg = "none" })

-- Neovim layout color redraw
hl(0, 'LineNr', { link = 'gray-fg-200' })
hl(0, 'IncSearch', { fg = 'none', bg = '#353535' })
hl(0, 'Search', { fg = 'none', bg = '#353535' })

-- Lazy.nvim plugin
hl(0, 'LazySpecial', { link = 'SourceWhite' })
hl(0, 'LazyProgressDone', { link = 'SourceGreen' })
hl(0, 'LazyReasonKeys', { link = 'SourcePink' })
hl(0, 'LazyReasonPlugin', { link = 'SourceYellow' })
hl(0, 'LazyReasonSource', { link = 'SourceYellow' })
hl(0, 'LazyReasonEvent', { link = 'SourceYellow' })
hl(0, 'LazyReasonStart', { link = 'SourceYellow' })

-- Treesitter
hl(0, '@constructor', { link = 'SourceWhite' })
hl(0, '@module', { link = 'SourceWhite' })

-- fzf-lua
hl(0, 'FzfLuaBorder', { link = 'gray-fg-300' })
hl(0, 'FzfLuaTitle', { link = 'gray-fg-100' })
hl(0, 'FzfLuaFzfPrompt', { link = 'SourceWhite' })
hl(0, 'FzfLuaLivePrompt', { link = 'SourceWhite' })
hl(0, 'FzfLuaHelpNormal', { link = 'TrackHL' })

-- grapple.nvim
hl(0, 'GrappleTitle', { link = 'gray-fg-100' })
hl(0, 'GrappleBorder', { link = 'gray-fg-300' })
hl(0, 'GrappleNormal', { link = 'gray-fg-100' })

-- csvview
local colors = {
  -- '#A5A5A5', -- red
  '#B2B2B2', -- red
  '#B2B2B2', -- peach
  '#B2B2B2', -- yellow
  '#a6e3a1', -- green
  '#94e2d5', -- teal
  '#89dceb', -- sky
  '#74c7ec', -- sapphire
  '#b4befe', -- lavender
  '#cba6f7', -- mauve
  '#cdd6f4', -- text
  '#bac2de', -- subtext
  '#a6adc8', -- overlay
  '#9399b2', -- surface2
  '#7f849c', -- surface1
  '#6c7086', -- surface0
  '#585b70', -- crust
  '#45475a', -- mantle
  '#f5c2e7', -- pink
  '#eba0ac', -- rosewater
}

for i, color in ipairs(colors) do
  hl(0, 'csvCol' .. (i - 1), { fg = color })
end
-- hl(0, 'CsvViewDelimiter', { link = 'gray-fg-100' })
hl(0, 'CsvViewDelimiter', { fg = '#B2B2B2' })
-- TODO:123 Change .sot header row fg color
hl(0, 'CsvViewHeaderLine', { fg = '#000000', bg = '#B2B2B2' })

-- Status bar
hl(0, 'StatusLine', { link = 'gray-fg-100' })
hl(0, 'MiniStatusLineModeNormal', { fg = '#48CBFF' })
hl(0, 'MiniStatusLineModeInsert', { fg = '#80EE6A' })
hl(0, 'MiniStatusLineModeVisual', { fg = '#FF6BA8' })
hl(0, 'MiniStatusLineModeCommand', { fg = '#FFD059' })
hl(0, 'MiniStatusLineModeReplace', { fg = '#FE3B3B' })
hl(0, 'MiniStatusLineModeOther', { fg = '#A5A5A5' })

--fzflua
-- hl(0, 'FzfLuaBackdrop', { fg = '#00FF00' })

--Quicker
-- hl(0, 'Delimiter', { link = 'gray-fg-300' })

--Indent Blankline
-- vim.api.nvim_set_hl(0, '@ibl.indent.char.1', { link = 'gray-fg-300' })

--Trouble
vim.api.nvim_set_hl(0, 'TroubleFilename', { fg = '#000000', bg = '#828282' })
vim.api.nvim_set_hl(0, 'TroubleCount', { fg = '#B2B2B2', bg = '#353535' })
vim.api.nvim_set_hl(0, 'TroublePointerL', { fg = '#838383', bg = '#353535' })
vim.api.nvim_set_hl(0, 'TroublePointerLNoBG', { fg = '#838383', bg = 'none' })
vim.api.nvim_set_hl(0, 'TroublePointerR', { fg = '#353535', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'TroubleIndent', { link = 'gray-fg-300' })
-- vim.api.nvim_set_hl(0, 'TroubleCode', { link = 'SourceYellow' })
-- vim.api.nvim_set_hl(0, 'TroubleIconDirectory', { link = 'cyan-fg-100' })

-- Markdown
-- REFACTOR:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- hl(0, 'markdownH1', { link = 'gray-fg-100' })
-- hl(0, '@spell.markdown', { link = 'gray-fg-000' })
-- hl(0, '@markup.list.markdown', { link = 'gray-fg-100' })
-- hl(0, '@markup.list.unchecked', { fg = '#FE3B3B', bold = true })
-- hl(0, '@markup.list.checked', { fg = '#80EE6A', bold = true })
-- REFACTOR://///////////////////////////////////////////////////
