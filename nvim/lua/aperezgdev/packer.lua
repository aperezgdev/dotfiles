-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.6',
	-- or                          , branch = '0.1.x',
  	requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})

  use {
  	'VonHeikemen/lsp-zero.nvim',
  	branch = 'v3.x',
	  requires = {
	    --- Uncomment the two plugins below if you want to manage the language servers from neovim
	    -- {'williamboman/mason.nvim'},
	    -- {'williamboman/mason-lspconfig.nvim'},

	    {'neovim/nvim-lspconfig'},
	    {'hrsh7th/nvim-cmp'},	    {'hrsh7th/cmp-nvim-lsp'},
	    {'L3MON4D3/LuaSnip'},
  	}
   }

   use {
    	"williamboman/mason.nvim",
    	"williamboman/mason-lspconfig.nvim",
    	"neovim/nvim-lspconfig",
   }

	use "folke/tokyonight.nvim"

	use {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp"
	}

	use {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	}

	use {"windwp/nvim-ts-autotag"}

	use "jose-elias-alvarez/null-ls.nvim"

	use 'nvim-tree/nvim-web-devicons'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use 'lewis6991/gitsigns.nvim'

	use 'andweeb/presence.nvim'

	use {
		"ray-x/lsp_signature.nvim"
	}

  end)
