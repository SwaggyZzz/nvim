local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local status_ok = pcall(require, "plugins.keymaps")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 6000, -- seconds
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use ({
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  })
  -- Autopairs, integrates with both cmp and treesitter
  use ({
    "windwp/nvim-autopairs",
    config = function()
      require "plugins.configs.autopairs"
    end
  })
  -- Easily comment stuff
  use ({
    "numToStr/Comment.nvim",
    config = function()
      require "plugins.configs.comment"
    end
  })
  use "kyazdani42/nvim-web-devicons"
  use ({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "plugins.configs.nvim-tree"
    end
  })
  use ({
    "akinsho/bufferline.nvim",
    config = function()
      require "plugins.configs.bufferline"
    end
  })
  use "moll/vim-bbye"
  use ({
    "nvim-lualine/lualine.nvim",
    config = function()
      require "plugins.configs.lualine"
    end
  })
  use ({
    "akinsho/toggleterm.nvim",
    config = function()
      require "plugins.configs.toggleterm"
    end
  })
  use ({
    "ahmedkhalf/project.nvim",
    config = function()
      require "plugins.configs.project"
    end
  })
  use ({
    "lewis6991/impatient.nvim",
    config = function()
      require "plugins.configs.impatient"
    end
  })
  use ({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins.configs.indentline"
    end
  })
  use ({
    "goolord/alpha-nvim",
    config = function()
      require "plugins.configs.alpha"
    end
  })
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  -- use ({
  --   "folke/which-key.nvim",
  --   config = function()
  --     require "plugins.configs.whichkey"
  --   end
  -- })

  -- Colorschemes
  -- use "lunarvim/darkplus.nvim"
  -- use "joshdick/onedark.vim"
  -- use "sainnhe/gruvbox-material"
  use "LunarVim/onedarker.nvim"

  -- cmp plugins
  use ({
    "hrsh7th/nvim-cmp",
    config = function()
      require "plugins.configs.cmp"
    end
  }) -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use ({
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lsp"
    end
  }) -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use ({
    "nvim-telescope/telescope.nvim",
    config = function()
      require "plugins.configs.telescope"
    end
  })

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins.configs.treesitter"
    end,
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use ({
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.configs.gitsigns"
    end
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
