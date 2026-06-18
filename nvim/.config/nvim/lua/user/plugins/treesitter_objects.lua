return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	dependencies = { "nvim-treesitter/nvim-treesitter", branch = "main" },
	config = function()
		-- Setup is still used in main branch, but simpler
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
			},
			move = {
				enable = true,
				set_jumps = true,
			},
		})

		-- Function textobjects
		vim.keymap.set({ "x", "o" }, "af", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
		end)
		vim.keymap.set({ "x", "o" }, "if", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
		end)

		-- Class/struct/impl textobjects
		vim.keymap.set({ "x", "o" }, "ac", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
		end)
		vim.keymap.set({ "x", "o" }, "ic", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
		end)

		-- Parameter/argument textobjects
		vim.keymap.set({ "x", "o" }, "aa", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
		end)
		vim.keymap.set({ "x", "o" }, "ia", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
		end)

		-- Closure textobjects
		vim.keymap.set({ "x", "o" }, "aC", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@closure.outer", "textobjects")
		end)
		vim.keymap.set({ "x", "o" }, "iC", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@closure.inner", "textobjects")
		end)

		-- Move between textobjects
		vim.keymap.set("n", "]f", function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
		end)
		vim.keymap.set("n", "[f", function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
		end)

		vim.keymap.set("n", "]a", function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
		end)
		vim.keymap.set("n", "[a", function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
		end)
	end,
}
