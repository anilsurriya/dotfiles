return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		-- Flavors: latte, frappe, macchiato, mocha
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
