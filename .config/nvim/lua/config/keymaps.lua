vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file" })

-- Map <leader>fp to open projects
vim.keymap.set("n", "<leader>fp", ":ProjectFzf<CR>", { noremap = true, silent = true })

-- Create a new tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })

-- Navigate tabs quickly
vim.keymap.set("n", "<A-.>", ":tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<A-,>", ":tabprevious<CR>", { desc = "Previous tab" })

-- Close tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
