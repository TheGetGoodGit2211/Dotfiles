return {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				-- Let lazydev handle the global 'vim' variables dynamically
			},
			workspace = {
				-- LEAVE THIS EMPTY OR REMOVE IT entirely.
				-- Lazydev injects the paths automatically when you open a file!
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
}
