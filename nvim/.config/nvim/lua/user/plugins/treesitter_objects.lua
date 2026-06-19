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

    -- stylua: ignore start
		-- Line textobjects
		vim.keymap.set({ "x", "o" }, "il", function()
			-- 1. Select from first non-blank to last non-blank
			vim.cmd("normal! ^vg_")

			-- 2. Check the character currently under the cursor
			local col = vim.fn.col(".")
			local line = vim.fn.getline(".")
			local char = line:sub(col, col)

			-- 3. If it's a comma, shrink the selection left by one character
			if char == "," then
				vim.cmd("normal! h")
			end
		end, { desc = "Inner line (no trailing comma)", silent = true })                                     -- [I]nner    [L]ine

		vim.keymap.set(
			{ "x", "o" },
			"wl",
			":<C-u>normal! ^vg_<CR>",
			{ desc = "Inner line + trailing comma", silent = true }
		)                                                                                                    -- [W]hole    [L]ine

		vim.keymap.set({ "x", "o" }, "al", ":<C-u>normal! 0v$<CR>", { desc = "Around line", silent = true }) -- [A]round   [L]ine

		-- Function textobjects
		vim.keymap.set({ "x", "o" }, "af", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
		end)                                                                                                 -- [A]round   [F]unction
		vim.keymap.set({ "x", "o" }, "if", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
		end)                                                                                                 -- [I]nner    [F]unction

		-- Class/struct/impl textobjects
		vim.keymap.set({ "x", "o" }, "ac", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
		end)                                                                                                 -- [A]round   [C]lass
		vim.keymap.set({ "x", "o" }, "ic", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
		end)                                                                                                 -- [I]nner    [C]lass

		-- Parameter/argument textobjects
		vim.keymap.set({ "x", "o" }, "aa", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
		end)                                                                                                 -- [A]round   [A]rgument
		vim.keymap.set({ "x", "o" }, "ia", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
		end)                                                                                                 -- [I]nner    [A]rgument

		-- Closure textobjects
		vim.keymap.set({ "x", "o" }, "aC", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@closure.outer", "textobjects")
		end)                                                                                                 -- [A]round   [C!]losure
		vim.keymap.set({ "x", "o" }, "iC", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@closure.inner", "textobjects")
		end)                                                                                                 -- [I]nner    [C!]losure

		-- Move between textobjects
		vim.keymap.set("n", "nf", function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
		end)                                                                                                 -- [N]ext     [F]unction
		vim.keymap.set("n", "pf", function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
		end)                                                                                                 -- [P]revious [F]unction

		vim.keymap.set("n", "na", function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
		end)                                                                                                 -- [N]ext     [A]rgument
		vim.keymap.set("n", "pa", function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
		end)                                                                                                 -- [P]revious [A]rgument
		-- stylua: ignore end
	end,
}
