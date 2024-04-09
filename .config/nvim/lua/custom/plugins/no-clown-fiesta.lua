return {
  {
    'aktersnurra/no-clown-fiesta.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      local palette = require 'no-clown-fiesta.palette'
      require('no-clown-fiesta').setup {
        transparent = true, -- Enable this to disable the bg color
        term_colors = true, -- Change terminal color as per the selected theme style
        styles = {

          -- You can set any of the style values specified for `:h nvim_set_hl`
          match_paren = { bold = true, fg = palette.red, underline = false },
          type = { bold = true },
          lsp = { underline = true },
        },
      }
      vim.cmd.colorscheme 'no-clown-fiesta'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
