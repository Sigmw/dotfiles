vim.cmd [[ packadd packer.nvim ]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v1.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
        }
    }
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'onsails/lspkind-nvim'
    use 'https://github.com/joshdick/onedark.vim'
    use 'L3MON4D3/LuaSnip'
    use 'windwp/nvim-autopairs'
    use "nvim-treesitter/nvim-treesitter"
    use 'nvim-lua/lsp_extensions.nvim' 
    use 'akinsho/toggleterm.nvim'
    use 'glepnir/dashboard-nvim'
end)
