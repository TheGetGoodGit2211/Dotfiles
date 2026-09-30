-- helper to return a list of mason packages
function mason_pkgs()
	local ok, registry = pcall(require, "mason-registry")
	if not ok then
		return {}
	end
	local names = {}
	for _, pkg in ipairs(registry.get_all_packages()) do
		names[#names + 1] = pkg.name
	end
	return names
end
