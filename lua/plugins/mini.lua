return {
  {
    "nvim-mini/mini.nvim",
    config = function()
      require("mini.pairs").setup()      -- fecha () [] {} "" '' automaticamente
      require("mini.surround").setup()   -- sa, sd, sr pra manipular surrounds
      require("mini.comment").setup()    -- gcc pra comentar linha, gc em visual
      require("mini.statusline").setup() -- statusline minimalista
      require("mini.icons").setup()      -- ícones (substitui nvim-web-devicons
    end,
  },
}
