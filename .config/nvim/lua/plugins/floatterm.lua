return {
	"nvzone/floaterm",
	dependencies = "nvzone/volt",
	opts = {},
	cmd = "FloatermToggle",
	keys = {
		{
			"<A-i>",
			"<cmd>FloatermToggle<cr>",
			desc = "Toggle floating terminal",
		},
	},
	config = function()
		vim.keymap.set("t", "<A-i>", "<CMD>FloatermToggle<CR>", { desc = "Toggle floating terminal" })
	end,
}
