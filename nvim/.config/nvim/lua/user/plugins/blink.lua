return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		opts = {
			-- Replicating your custom keymaps:
			-- <C-j> to accept, <C-h> to select next, <C-l> to select previous
			keymap = {
				preset = "none",
				["<C-j>"] = { "accept", "fallback" },
				["<C-h>"] = { "select_next", "fallback" },
				["<C-l>"] = { "select_prev", "fallback" },
			},

			appearance = {
				use_nvim_cmp_as_default = true, -- Fallback highlight groups to match your theme
				nerd_font_variant = "mono",
			},

			-- Equivalent to your cmp sources (LSP, path, snippets, buffer)
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
