-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
}

  use({ 
	'rose-pine/neovim', 
	as = 'rose-pine',
	config = function()
		vim.cmd('colorscheme rose-pine')
	end
  })

  -- from treesitter wiki ":TSUpdate will cause Packer to fail upon the first installation.
  -- It will run correctly when updating. To avoid this,
  -- call `nvim-treesitter.install.update()` directly.

  use { 
	'nvim-treesitter/nvim-treesitter',
	run = function()
		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		ts_update()
	end,
  }

  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  -- lsp-zero & depenencies
  use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/cmp-nvim-lsp'})
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use('L3MON4D3/LuaSnip')
  use {
    'hrsh7th/nvim-cmp',
    config = function ()
      require'cmp'.setup {
      snippet = {
        expand = function(args)
          require'luasnip'.lsp_expand(args.body)
        end
      },

        sources = {
          { name = 'luasnip' },
          -- more sources
        },
      }
      end
    }
    use('saadparwaiz1/cmp_luasnip')
    use('hrsh7th/cmp-buffer')

end)
