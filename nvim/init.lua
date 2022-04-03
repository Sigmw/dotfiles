local vim = vim

-- plugins
require "paq" {
	-- paq
	"savq/paq-nvim",

	-- colors
	"norcalli/nvim-colorizer.lua",
	"nonamescm/notheme.nvim",

	-- git integration
	"lewis6991/gitsigns.nvim",
	"nvim-lua/plenary.nvim",

	-- lsp
	"neovim/nvim-lspconfig",
	"nvim-treesitter/nvim-treesitter",
	"onsails/lspkind-nvim",
	"L3MON4D3/LuaSnip",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",

	-- tabline/statusline
	"akinsho/nvim-bufferline.lua",
	"kyazdani42/nvim-web-devicons",
	"nonamescm/galaxyline.nvim",

	-- others
	"windwp/nvim-autopairs", -- auto open and close pairs
	"kyazdani42/nvim-tree.lua", -- file manager
	"lukas-reineke/indent-blankline.nvim", -- ident guides
	"andweeb/presence.nvim", -- Rich presence
	"glepnir/dashboard-nvim", -- dashboard screen
}

-- Disable Default Vim Plugins
vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_spec = 0
vim.g.loaded_syncolor = 0

-- options
vim.g.markdown_fenced_languages = {
	"js=javascript",
	"py=python",
	"rs=rust"
}

local opt, bopt, wopt = vim.o, vim.bo, vim.wo
vim.o.foldenable = false
opt.background = "light"
opt.splitbelow = true
opt.wrap, wopt.wrap = false, false
opt.number, wopt.number = true, true
opt.cursorline, wopt.cursorline = true, true
opt.relativenumber, wopt.relativenumber = true, true
opt.mouse = "a"
opt.tabstop, bopt.tabstop = 4, 4
opt.shiftwidth, bopt.shiftwidth = 4, 4
opt.expandtab = false
opt.showtabline = 2
opt.termguicolors = true
opt.guicursor = "v-c-sm:block,c-i-ci-ve:ver25,r-cr-o:hor20"

-- plugins that doesn"t need configuration requires
require("colorizer").setup()
vim.cmd("colorscheme notheme")
require("gitsigns").setup()

vim.cmd("command! Term split|term")
vim.cmd("command! VTerm belowright vsplit|term")