return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = true,
    config = function()
      -- obrigatório: desativa o netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      
      require("nvim-tree").setup({
        view = { width = 30 },
        renderer = { group_empty = true },
        filters = { dotfiles = false },
      })

      -- toggle com Space+e
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "toggle nvim-tree" })
      -- foca na árvore sem fechar
      vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<cr>", { desc = "focar nvim-tree" })
      -- localiza o arquivo atual na árvore
      vim.keymap.set("n", "<leader>el", "<cmd>NvimTreeFindFile<cr>", { desc = "localizar arquivo" })
    end,
  },
}
