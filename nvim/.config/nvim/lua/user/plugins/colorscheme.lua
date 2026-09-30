return {
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({})
		end,
	},
	{
		"AvengeMedia/base46",
		lazy = true,
		opts = {},
	},
}
