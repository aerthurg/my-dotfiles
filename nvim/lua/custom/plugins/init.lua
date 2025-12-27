-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

	-- Adding vim-python-docstring for automated docstring
	{
		"pixelneo/vim-python-docstring",
		config = function()
			vim.g.python_style = "google"
		end,
	},

	-- Adding Lazygit for a better integrated Git experience
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},

	-- Adding Noice.nvim for a better UI experience
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- Adding nvim-dbee for querying databases in neovim
	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup(--[[optional config]])
		end,
	},

	-- Adding Oil for a better file management experience
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
	},

	-- Adding render-markdown for beautifying .md files render
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			file_types = { "markdown", "vimwiki" },
			render_modes = true,
			anti_conceal = { enabled = false },
			latex = {
				enabled = true,
				render_modes = false,
				converter = { "latex2text" },
				highlight = "RenderMarkdownMath",
				position = "center",
			},
			math = { enabled = true, engine = "pylatexenc" },
			max_file_size = 15.0,
		},
	},

	-- Adding solarized-osaka as the theme
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				sidebars = "dark",
				floats = "dark",
			},
		},
	},
}
