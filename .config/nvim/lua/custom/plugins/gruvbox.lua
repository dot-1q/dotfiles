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
          -- I don't like how gruvbox highlights matching words under cursor.
          -- So I remap that highlight to the one similar to Selecting Text (Visual mode).
          LspReferenceText = { link = 'Visual' },
          LspReferenceRead = { link = 'Visual' },
          LspReferenceWrite = { link = 'Visual' },
        },
      }
    end,
  },
}
