return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      require('gruvbox').setup {
        terminal_colors = true, -- add neovim terminal colors
        contrast = 'soft', -- can be "hard", "soft" or empty string
        italic = {
          strings = false,
          emphasis = false,
          comments = true,
          operators = false,
          folds = true,
        },
        transparent_mode = true,
        overrides = {
          LspReferenceText = { bg = '#665c54' },
          LspReferenceRead = { bg = '#665c54' },
          LspReferenceWrite = { bg = '#665c54' },
        },
      }
    end,
  },
}
