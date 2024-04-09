return {
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    -- Below are keybinds to gitsigns
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              return ']c'
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then
              return '[c'
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage Hunk' })
          map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset Hunk (undo hunk changes)' })
          map('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage Buffer' })
          map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
          map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset Buffer (undo all changes)' })
          map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview Hunk' })
          map('n', '<leader>hb', function()
            gs.blame_line { full = true }
          end, { desc = 'Show Full Blame' })
          map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle Current Line Blame' })
          map('n', '<leader>hd', function()
            gs.diffthis(nil, { split = 'botright' })
          end, { desc = 'Open Git Diff' })
          map('n', '<leader>td', gs.toggle_deleted, { desc = 'Toggle Deleted Changes' })
        end,
      }
    end,
  },
}
