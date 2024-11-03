vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<C-s>", ":w<CR>", { desc = "Save current file" })
map("n", "<ESC>", ":nohl<CR>", { desc = "Clear search highlighting" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

map("n", "<leader>fm", function()
    require("conform").format()
end)

map("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Nvim Tree Toggle" })

map({ "n", "v" }, "C-c", "<cmd>%y+<CR>", { desc = "Copy to clipboard" })

map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

map("n", "<Tab>", ":tabnext<CR>", { desc = "Go to next tab" })
map("n", "<S-Tab>", ":tabprevious<CR>", { desc = "Go to previous tab" })
map("n", "<leader>x", ":tabclose<CR>", { desc = "Close tab" })

-- map({"n", "v"}, "<leader>/", "", {desc= "Comment"})
map("n", "<F5>", ":!bash runCode.sh<CR>", { noremap = true, silent = true })

map("n", "<leader>x", ":close<CR>", { noremap = true, silent = true })
