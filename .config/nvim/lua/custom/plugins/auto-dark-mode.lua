return {
  'f-person/auto-dark-mode.nvim',
  config = {
    -- 10 seeconds. more than enough
    update_interval = 10000,
    set_dark_mode = function()
      vim.api.nvim_set_option('background', 'dark')
      vim.cmd 'colorscheme gruvbox'
    end,
    set_light_mode = function()
      vim.api.nvim_set_option('background', 'light')
      vim.cmd 'colorscheme gruvbox'
    end,
  },
}
