return {
	"ibhagwan/fzf-lua",
    enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			winopts = {
				height = 0.85,
				width = 0.80,
				row = 0.35,
				col = 0.50,
				border = "rounded",
				preview = {
					border = "border",
					wrap = "nowrap",
					hidden = "nohidden",
					vertical = "down:45%",
					horizontal = "right:50%",
					layout = "flex",
					flip_columns = 120,
					title = true,
					scrollbar = "float",
					delay = 100,
				},
			},
			fzf_opts = {
				["--layout"] = "reverse",
				["--info"] = "inline",
				["--bind"] = "ctrl-j:down,ctrl-k:up",
			},
		})
	end,
}
