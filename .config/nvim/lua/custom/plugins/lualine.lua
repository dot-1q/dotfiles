-- Add and customize lualine Statusline
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'BufReadPost',
    config = function()
      require('lualine').setup {
        options = {
          -- theme = 'no-clown-fiesta',
          theme = 'gruvbox',
        },
      }
    end,
  },
}
