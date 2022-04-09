local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require("packer").startup(function()
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('setup/nvim-treesiter') end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require('setup/nvim-tree') end
  }

  use 'folke/tokyonight.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('setup/lualine') end
  }

  use {'neovim/nvim-lspconfig',
    config = function() require('setup/nvim-lspconfig') end
  }

  use {'hrsh7th/nvim-cmp',
    config = function() require("setup/nvim-cmp") end
  }

  use 'hrsh7th/cmp-nvim-lsp'

  use {'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require("setup/null-ls") end
  }

  use {'L3MON4D3/LuaSnip',
    config = function() require("setup/luasnip") end
  }

  use 'rafamadriz/friendly-snippets'

  use 'saadparwaiz1/cmp_luasnip'

  use { 'alvarosevilla95/luatab.nvim', 
    requires='kyazdani42/nvim-web-devicons',
    config = function() require("setup/luatab") end
  }

  use {'molleweide/LuaSnip-snippets.nvim',
    config = function() require("setup/snippets") end
  }

  if packer_bootstrap then
    require('packer').sync()
  end

end)

