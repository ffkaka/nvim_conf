return {
	"preservim/tagbar",
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<F5>", ":TagbarToggle<CR>", { desc = "Toggle Tag bar" })
	end,
}
