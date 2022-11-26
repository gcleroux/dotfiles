local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

-- Default config
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
