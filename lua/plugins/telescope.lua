return {
  {
    'nvim-telescope/telescope.nvim', 
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function() 
      local builtin = require("telescope.builtin")
      local map = vim.keymap.set

      map("n", "<leader>ff", builtin.find_files,  { desc = "find files" })
      map("n", "<leader>fg", builtin.live_grep,   { desc = "live grep" })
      map("n", "<leader>fb", builtin.buffers,     { desc = "buffers" })
      map("n", "<leader>fh", builtin.help_tags,   { desc = "help tags" })
      map("n", "<leader>fr", builtin.oldfiles,    { desc = "recent files" })
    end,
  },
}
