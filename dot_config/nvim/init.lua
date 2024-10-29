vim.g.mapleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Detects and responds to OS color scheme changes.
	{ "f-person/auto-dark-mode.nvim" },

	-- File explorer for nvim
	{ "echasnovski/mini.files", version = "*" },

	-- Nice theme, mostly so mini.files look better.
	{ "catppuccin/nvim", name = "catppuccin", priority = 500 },

	-- Better indentation experience
	{ "NMAC427/guess-indent.nvim", version = "*" },

	-- Better and faster jumps in text
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
			case_insensitive = false,
		},
	},

	-- Autocomplete vim keys
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},

	-- Hex editing plugin
	{
		"RaafatTurki/hex.nvim",
	},

	-- Obsidian
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "brain",
					path = "G:\\My Drive\\Brain",
				},
			},
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
	},

	-- Autocomplete
	{
		"hrsh7th/nvim-cmp",
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Transparent Nvim
	{
		"xiyaowong/transparent.nvim",
	},

	-- Neoformat
	{
		"sbdchd/neoformat",
	},

	-- Rename files like editing text normally
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
})

-- mini.files
require("mini.files").setup()

-- guess-indent
require("guess-indent").setup()

-- catppuccin-mocha
--vim.cmd.colorscheme "catppuccin-mocha"

-- auto-dark-mode
local auto_dark_mode = require("auto-dark-mode")

auto_dark_mode.setup({
	update_interval = 5000,
	set_dark_mode = function()
		vim.api.nvim_set_option("background", "dark")
		vim.cmd("colorscheme catppuccin-mocha")
	end,
	set_light_mode = function()
		vim.api.nvim_set_option("background", "light")
		vim.cmd("colorscheme catppuccin-latte")
	end,
})

-- hop.nvim

--- From https://github.com/smoka7/hop.nvim
--- See also `:h hop-lua-api`
local hop = require("hop")
local directions = require("hop.hint").HintDirection
--vim.keymap.set('', 'f', function()
--  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
--end, {remap=true})
--vim.keymap.set('', 'F', function()
--  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
--end, {remap=true})
--vim.keymap.set('', 't', function()
--  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
--end, {remap=true})
--vim.keymap.set('', 'T', function()
--  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
--end, {remap=true})

-- hex.nvim
--require 'hex'.setup {
--  -- function that runs on BufReadPre to determine if it's binary or not
--  is_buf_binary_pre_read = function()
--    return false
--  end,
--
--  -- function that runs on BufReadPost to determine if it's binary or not
--  is_buf_binary_post_read = function()
--    return false
--  end,
--}

-- Obsidian
vim.opt.conceallevel = 1

-- Autocomplete
local cmp = require("cmp")
cmp.setup()

-- Transparent Nvim
require("transparent").setup()

-- oil.nvim
-- https://github.com/stevearc/oil.nvim?tab=readme-ov-file#quick-start
require("oil").setup({
	delete_to_trash = true,
})

-- Personal
vim.keymap.set("", "<leader>w", function()
	hop.hint_words()
end)
vim.api.nvim_set_keymap("v", "<C-v>", "<C-v>", { noremap = true, silent = true })

if not vim.fn.has('macunix') then
  vim.opt.backupdir = vim.env.HOME .. "\\AppData\\Local\\nvim-data\\backup\\\\"
  vim.opt.backup = true
  vim.opt.writebackup = true
  vim.opt.undofile = true
end

vim.opt.tabstop = 4

