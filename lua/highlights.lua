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

-- No highlight references for the current word
hl(0, 'LspReferenceText', { link = 'none' })
hl(0, 'LspReferenceRead', { link = 'none' })
hl(0, 'LspReferenceWrite', { link = 'none' })

-- Background transparent for the blink suggestions
hl(0, 'Pmenu', { fg = 'none', bg = 'none' })
-- hl(0, "PmenuSel", { fg = "none", bg = "none" })

-- Neovim layout color redraw
hl(0, 'LineNr', { link = 'gray-fg-200' })
hl(0, 'IncSearch', { fg = 'none', bg = '#555555' })

-- Lazy.nvim plugin
hl(0, 'LazySpecial', { link = 'SourceBlue' })
hl(0, 'LazyProgressDone', { link = 'SourceGreen' })
hl(0, 'LazyReasonKeys', { link = 'SourcePink' })
hl(0, 'LazyReasonPlugin', { link = 'SourceYellow' })
hl(0, 'LazyReasonSource', { link = 'SourceYellow' })
hl(0, 'LazyReasonEvent', { link = 'SourceYellow' })
hl(0, 'LazyReasonStart', { link = 'SourceYellow' })

-- Treesitter
hl(0, '@constructor', { link = 'SourceWhite' })

-- fzf-lua
hl(0, 'FzfLuaBorder', { link = 'gray-fg-300' })
hl(0, 'FzfLuaTitle', { link = 'gray-fg-100' })
hl(0, 'FzfLuaFzfPrompt', { link = 'SourceWhite' })
hl(0, 'FzfLuaLivePrompt', { link = 'SourceWhite' })

-- Telescope
hl(0, 'TelescopePromptTitle', { link = 'gray-fg-100' })
hl(0, 'TelescopeBorder', { link = 'gray-fg-300' })
hl(0, 'TelescopePromptPrefix', { link = 'SourceWhite' })
hl(0, 'TelescopePromptCounter', { link = 'gray-fg-100' })
hl(0, 'TelescopeSelection', { fg = '#E5E5E5', bg = '#353535' })
hl(0, 'TelescopeResultsNormal', { link = 'gray-fg-100' })
hl(0, 'TelescopeSelectionCaret', { link = 'SourcePrompt' })

-- grapple.nvim
hl(0, 'GrappleTitle', { link = 'gray-fg-100' })
hl(0, 'GrappleBorder', { link = 'gray-fg-300' })
hl(0, 'GrappleNormal', { link = 'gray-fg-100' })

-- Status bar
hl(0, 'StatusLine', { link = 'gray-fg-100' })
hl(0, 'MiniStatusLineModeNormal', { fg = '#48CBFF' })
hl(0, 'MiniStatusLineModeInsert', { fg = '#80EE6A' })
hl(0, 'MiniStatusLineModeVisual', { fg = '#FF6BA8' })
hl(0, 'MiniStatusLineModeCommand', { fg = '#FFD059' })
hl(0, 'MiniStatusLineModeReplace', { fg = '#FE3B3B' })

-- Markdown
-- REFACTOR:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- hl(0, 'markdownH1', { link = 'gray-fg-100' })
-- hl(0, '@spell.markdown', { link = 'gray-fg-000' })
-- hl(0, '@markup.list.markdown', { link = 'gray-fg-100' })
-- hl(0, '@markup.list.unchecked', { fg = '#FE3B3B', bold = true })
-- hl(0, '@markup.list.checked', { fg = '#80EE6A', bold = true })
-- REFACTOR://///////////////////////////////////////////////////
