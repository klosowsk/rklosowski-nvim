return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal", mode = {"n", "t", "i"} },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal", mode = {"n", "t"} },
    },
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        terminal_mappings = true,
        insert_mappings = true,
        direction = "horizontal",
        size = 15,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })
      
      -- Terminal-specific keymaps for navigation
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      end

      vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
    end
  }
}
