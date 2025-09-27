-- Colorscheme configuration
local colorscheme = "tokyonight"

-- Function to safely set colorscheme
local function set_colorscheme(name)
	local status_ok, _ = pcall(vim.cmd.colorscheme, name)
	if not status_ok then
		vim.notify("Colorscheme '" .. name .. "' not found! Using default.")
		vim.cmd.colorscheme("default")
	end
end

-- Set the colorscheme
set_colorscheme(colorscheme)
