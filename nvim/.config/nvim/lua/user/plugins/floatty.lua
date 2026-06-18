return {
	"ingur/floatty.nvim",
	config = function()
		local term = require("floatty").setup({})
		vim.keymap.set({ "n", "t" }, "<C-Space>", function()
			term.toggle()
		end)
	end,
}
