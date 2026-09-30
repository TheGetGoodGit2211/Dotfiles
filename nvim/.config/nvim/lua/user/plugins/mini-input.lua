return {
	"nvim-mini/mini.input",
	version = "*",
	config = function()
		require("mini.input").setup({
			-- Anchor the input to the whole editor, not the cursor
			scope = "editor",
			handlers = {
				-- Override the default view with a floatwin at top-center
				view = require("mini.input").gen_view.floatwin({ style = "TM" }),
			},
		})
	end,
}
