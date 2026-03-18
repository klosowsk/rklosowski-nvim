-- configura os language servers
return {
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- configuração padrão pra maioria dos servers
    local servers = {
      "ts_ls", "pyright", "terraformls",
      "yamlls", "rust_analyzer", "clangd",
    }

    for _, server in ipairs(servers) do
      vim.lsp.config(server, { capabilities = capabilities })
    end

    -- lua com config especial
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    })

    -- ativa todos os servers instalados pelo mason
    vim.lsp.enable({
      "ts_ls", "pyright", "lua_ls", "terraformls",
      "yamlls", "rust_analyzer", "clangd",
    })

    -- keymaps do LSP
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local map = vim.keymap.set
        local opts = { buffer = ev.buf }

        map("n", "gd",          vim.lsp.buf.definition,     vim.tbl_extend("force", opts, { desc = "go to definition" }))
        map("n", "gD",          vim.lsp.buf.declaration,    vim.tbl_extend("force", opts, { desc = "go to declaration" }))
        map("n", "gr",          vim.lsp.buf.references,     vim.tbl_extend("force", opts, { desc = "references" }))
        map("n", "gi",          vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "implementation" }))
        map("n", "K",           vim.lsp.buf.hover,          vim.tbl_extend("force", opts, { desc = "hover doc" }))
        map("n", "<leader>rn",  vim.lsp.buf.rename,         vim.tbl_extend("force", opts, { desc = "rename" }))
        map("n", "<leader>ca",  vim.lsp.buf.code_action,    vim.tbl_extend("force", opts, { desc = "code action" }))
        map("n", "<leader>fd",  vim.lsp.buf.format,         vim.tbl_extend("force", opts, { desc = "formatar" }))
        map("n", "[d",          vim.diagnostic.goto_prev,   vim.tbl_extend("force", opts, { desc = "diagnóstico anterior" }))
        map("n", "]d",          vim.diagnostic.goto_next,   vim.tbl_extend("force", opts, { desc = "próximo diagnóstico" }))
        map("n", "<leader>cd",  vim.diagnostic.open_float,  vim.tbl_extend("force", opts, { desc = "ver diagnóstico" }))
      end,
    })
  end,
}
