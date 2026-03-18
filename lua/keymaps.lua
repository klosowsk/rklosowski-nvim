local map = vim.keymap.set

-- salvar
map("n", "<leader>w", "<cmd>w<cr>",  { desc = "salvar" })

-- navegar splits com Ctrl + hjkl
map("n", "<C-h>", "<C-w>h", { desc = "split esquerdo" })
map("n", "<C-l>", "<C-w>l", { desc = "split direito" })
map("n", "<C-j>", "<C-w>j", { desc = "split baixo" })
map("n", "<C-k>", "<C-w>k", { desc = "split cima" })

-- mover linhas selecionadas no visual mode
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "mover linha abaixo" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "mover linha acima" })

-- manter cursor no centro ao rolar
map("n", "<C-d>", "<C-d>zz", { desc = "rolar baixo" })
map("n", "<C-u>", "<C-u>zz", { desc = "rolar cima" })

-- manter cursor no centro ao buscar
map("n", "n", "nzzzv", { desc = "próximo resultado" })
map("n", "N", "Nzzzv", { desc = "resultado anterior" })

-- colar sem perder o clipboard
map("x", "<leader>p", '"_dP', { desc = "colar sem perder registro" })

-- sair do insert mode com jk
map("i", "jk", "<Esc>", { desc = "voltar normal mode" })

-- limpar highlight de busca
map("n", "<Esc>", "<cmd>noh<cr>", { desc = "limpar busca" })

-- identar e manter seleção
map("v", "<", "<gv", { desc = "indentar esquerda" })
map("v", ">", ">gv", { desc = "indentar direita" })
