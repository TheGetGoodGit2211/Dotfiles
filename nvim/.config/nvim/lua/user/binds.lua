-- file handling
vim.keymap.set("n", "<leader>ffq", ":q!<CR>") -- [F]ile [F]orce  [Q]uit
vim.keymap.set("n", "<leader>fq", ":q<CR>") -- [F]ile [Q]uit
vim.keymap.set("n", "<leader>fs", ":source %<CR>") -- [F]ile [S]ource
vim.keymap.set("n", "<leader>fw", ":w<CR>") -- [F]ile [W]rite
vim.keymap.set("n", "<leader>fwq", ":wq<CR>") -- [F]ile [W]rite and [Q]uit

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>tbb", telescope.buffers, {}) -- [T]elescope [B]rowse  [B]uffers
vim.keymap.set("n", "<leader>tbf", ":Telescope file_browser<CR>") -- [T]elescope [B]rowse  [F]iles
vim.keymap.set("n", "<leader>tbg", telescope.git_files, {}) -- [T]elescope [B]rowse  [G]it
vim.keymap.set("n", "<leader>tgd", telescope.lsp_definitions, {}) -- [T]elescope [G]oto    [D]efinitions
vim.keymap.set("n", "<leader>tgi", telescope.lsp_implementations, {}) -- [T]elescope [G]oto    [I]mplementations
vim.keymap.set("n", "<leader>tgr", telescope.lsp_references, {}) -- [T]elescope [G]oto    [R]eferences
vim.keymap.set("n", "<leader>tld", telescope.diagnostics, {}) -- [T]elescope [L]ist    [D]iagnostics
vim.keymap.set("n", "<leader>tlf", telescope.find_files, {}) -- [T]elescope [L]ist    [F]iles
vim.keymap.set("n", "<leader>tlg", telescope.live_grep, {}) -- [T]elescope [L]ist by [G]rep

-- mason
vim.keymap.set("n", "<leader>ms", ":Mason<CR>")

-- git
vim.keymap.set("n", "<leader>gaa", ":Git add .<CR>")
vim.keymap.set("n", "<leader>gc", function()
	vim.ui.input({ prompt = "Commit Message: " }, function(msg)
		if msg and msg ~= "" then
			vim.cmd("Git commit -m " .. vim.fn.shellescape(msg))
		end
	end)
end)
vim.keymap.set("n", "<leader>gp", ":Git push<CR>")

-- other
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" }) -- [D]iagnostics
