local map = vim.keymap.set

-- File explorer
map("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Buffer navigation
map("n", "<A-6>", ":bprev<CR>", { noremap = true, silent = true })
map("n", "<C-6>", "<C-^>", { noremap = true, silent = true })
