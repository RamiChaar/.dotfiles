vim.g.mapleader = " "

-- create new file in directory of current file
vim.keymap.set("n", "<leader>n", function ()
    local file_name = vim.fn.input("File Name > ")
    vim.cmd(":e %:h/" .. file_name)
    vim.cmd("w")
end)

-- keymap for lazy and mason
vim.keymap.set("n", "<leader>lz", ":Lazy<CR>")
vim.keymap.set("n", "<leader>ms", ":Mason<CR>")

-- move highlighted text
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Select all
vim.keymap.set("n", "<leader>=", "gg0vG")

-- keep cursor in middle when jumping and searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- retain paste buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- to exit in veritcal edit mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- format code
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- splitting windows
vim.keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- Get out Q
vim.keymap.set("n", "Q", "<nop>")
