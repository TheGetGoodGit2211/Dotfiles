return {
	root_markers = { ".luarc.json", "init.lua", ".luacheckrc" },

	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {},
			workspace = {
				checkThirdParty = false,
				ignoreDir = {
					".git",
					"node_modules",
					"target",
					"build",
					"dist",
					"downloads",
				},
				maxPreload = 1000,
				preloadFileSize = 1000,
			},
			telemetry = { enable = false },
		},
	},
}
