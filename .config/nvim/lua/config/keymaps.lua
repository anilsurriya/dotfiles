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
vim.keymap.set("n", "<leader>tc", ":tabnew<CR>", { desc = "New tab" })

-- Navigate tabs quickly
-- vim.keymap.set("n", "<leader>tl", ":tabnext<CR>", { desc = "Next tab" })
-- vim.keymap.set("n", "<leader>th", ":tabprevious<CR>", { desc = "Previous tab" })

-- Close tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })

-- Exit terminal mode with ESC
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("t", "<leader><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Toggle status line between global (3) and hidden (0)
vim.keymap.set("n", "<leader>ts", function()
	if vim.opt.laststatus:get() == 0 then
		vim.opt.laststatus = 3 -- Use 2 if you prefer standard split status lines
		print("Statusline: Shown")
	else
		vim.opt.laststatus = 0
		print("Statusline: Hidden")
	end
end, { desc = "Toggle Statusline" })
