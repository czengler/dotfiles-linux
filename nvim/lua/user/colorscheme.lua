-- Tokyo night configuration
local colorscheme = "tokyonight-night" -- storm, moon, night, day
vim.g.tokyonight_transparent_sidebar = false
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_transparent = false

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. "not found!")
	return
end
