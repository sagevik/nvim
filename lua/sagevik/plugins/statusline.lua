-- If the plugin is disabled, return an empty table
if not vim.g.enabled_plugins["statusline"] then
	return {}
end

return {
	"echasnovski/mini.statusline",
	version = false,
	opts = {},
}
