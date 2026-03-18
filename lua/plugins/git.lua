return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "┃" },
          change       = { text = "┃" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
          untracked    = { text = "┆" },
        },
        current_line_blame = false, -- toggle com <leader>tb
        on_attach = function(bufnr)
          local gs = require("gitsigns")

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
          end

          -- navegar entre hunks (respeita diff mode)
          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gs.nav_hunk("next")
            end
          end, "próximo hunk")

          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gs.nav_hunk("prev")
            end
          end, "hunk anterior")

          -- ações
          map("n", "<leader>hs", gs.stage_hunk,        "stage hunk")
          map("n", "<leader>hr", gs.reset_hunk,        "reset hunk")
          map("n", "<leader>hS", gs.stage_buffer,      "stage buffer")
          map("n", "<leader>hR", gs.reset_buffer,      "reset buffer")
          map("n", "<leader>hu", gs.undo_stage_hunk,   "undo stage hunk")
          map("n", "<leader>hp", gs.preview_hunk,      "preview hunk")
          map("n", "<leader>hi", gs.preview_hunk_inline, "preview hunk inline")
          map("n", "<leader>hd", gs.diffthis,          "diff arquivo")
          map("n", "<leader>hD", function() gs.diffthis("~") end, "diff último commit")

          -- stage/reset hunk em visual mode (só as linhas selecionadas)
          map("v", "<leader>hs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, "stage hunk (visual)")
          map("v", "<leader>hr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, "reset hunk (visual)")

          -- blame
          map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "blame linha")
          map("n", "<leader>hq", gs.setqflist, "hunks no quickfix")

          -- toggles
          map("n", "<leader>tb", gs.toggle_current_line_blame, "toggle blame inline")
          map("n", "<leader>tw", gs.toggle_word_diff,          "toggle word diff")

          -- text object — seleciona hunk como objeto
          map({ "o", "x" }, "ih", gs.select_hunk, "selecionar hunk")
        end,
      })
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>",        desc = "git status" },
      { "<leader>gc", "<cmd>Git commit<cr>", desc = "git commit" },
      { "<leader>gp", "<cmd>Git push<cr>",   desc = "git push" },
      { "<leader>gl", "<cmd>Git log<cr>",    desc = "git log" },
      { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "git diff split" },
    },
  },
}
