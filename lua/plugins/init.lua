local fn = vim.fn

-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
-- 自动安装 Packer.nvim
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.notify("Pakcer.nvim 安装完毕")
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins/init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins/init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local keymaps_status_ok = pcall(require, "plugins.keymaps")
if not keymaps_status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  max_jobs = 20,
  git = {
    clone_timeout = 6000, -- seconds
    -- 自定义源
    -- default_url_format = "https://hub.fastgit.xyz/%s",
    -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
    -- default_url_format = "https://gitcode.net/mirrors/%s",
    -- default_url_format = "https://gitclone.com/github.com/%s",
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  ---------------------------- plugins ----------------------------
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- JK Esc
  use ({
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  })
  -- Icons
  use "kyazdani42/nvim-web-devicons"
  -- Nvim-tree
  use ({
    "kyazdani42/nvim-tree.lua",
    opt = true,
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = function()
      require "plugins.configs.nvim-tree"
    end
  })
  -- Bufferline
  use ({
    "akinsho/bufferline.nvim",
    config = function()
      require "plugins.configs.bufferline"
    end
  })
  -- Lualine
  use ({
    'arkav/lualine-lsp-progress',
    after = "nvim-gps"
  })
  use ({
    "nvim-lualine/lualine.nvim",
    after = "lualine-lsp-progress",
    config = function()
      require "plugins.configs.lualine"
    end
  })
  -- Telescope
  use ({
    "nvim-telescope/telescope.nvim",
    config = function()
      require "plugins.configs.telescope"
    end
  })
  -- Dashboard
  use ({
    "goolord/alpha-nvim",
    config = function()
      require "plugins.configs.alpha"
    end
  })
  -- Project
  use ({
    "ahmedkhalf/project.nvim",
    config = function()
      require "plugins.configs.project"
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
  use ({
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  })
  use ({
    "SmiteshP/nvim-gps",
    after = "nvim-treesitter",
  })
  -- Autopairs
  use ({
    "windwp/nvim-autopairs",
    config = function()
      require "plugins.configs.autopairs"
    end
  })
  -- Comment
  use ({
    "numToStr/Comment.nvim",
    config = function()
      require "plugins.configs.comment"
    end
  })
  -- Buffer 优雅退出
  use "moll/vim-bbye"
  -- Impatient 启动加速缓存
  use ({
    "lewis6991/impatient.nvim",
    config = function()
      require "plugins.configs.impatient"
    end
  })
  -- Indent 缩进
  use ({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins.configs.indentline"
    end
  })
  -- Git
  use ({
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.configs.gitsigns"
    end
  })
  -- Colorizer
  use ({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "plugins.configs.colorizer"
    end
  })
  ---------------------------- LSP ----------------------------
  -- Lsp-config
  use ({
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lsp"
    end
  })
  use "williamboman/nvim-lsp-installer"
  use "ray-x/lsp_signature.nvim"
  -- Null-ls formatters and linters
  use "jose-elias-alvarez/null-ls.nvim"
  use "b0o/schemastore.nvim" -- json schema
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use ({
    "simrat39/rust-tools.nvim",
    config = function()
      require "plugins.configs.lsp.rust-tools"
    end
  })
  -- Renamer
  use ({
    "filipdutescu/renamer.nvim",
    config = function()
      require "plugins.configs.renamer"
    end
  })
  -- 补全引擎
  use ({
    "hrsh7th/nvim-cmp",
    config = function()
      require "plugins.configs.cmp"
    end
  })
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippet 引擎
  use "L3MON4D3/LuaSnip"
  -- 常见编程语言代码段
  use "rafamadriz/friendly-snippets"
  -- other
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  ---------------------------- Colorschemes ----------------------------
  use "folke/tokyonight.nvim"
  -- use "SwaggyZzz/gruvbox-baby"
  -- use "sainnhe/gruvbox-material"
  -- use "mhartington/oceanic-next"
  -- use ({
    -- "catppuccin/nvim",
    -- as = "catppuccin",
    -- config = function()
    --   require "plugins.configs.catppuccin"
    -- end
  -- })
  ---------------------------- Editor ----------------------------
  -- 跳转到单词
  use ({
    "unblevable/quick-scope",
    config = function()
      require "plugins.configs.quick-scope"
    end
  })
  -- 快速查找跳转
  use ({
    "phaazon/hop.nvim",
    opt = true,
    branch = 'v1',
    cmd = {
      "HopLine",
      "HopLineStart",
      "HopWord",
      "HopPattern",
      "HopChar1",
      "HopChar2",
    },
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  })
  -- Peeking the buffer while entering command :{number}
  use ({
    "nacro90/numb.nvim",
    config = function()
      require "plugins.configs.numb"
    end,
  })
  -- surround
use ({
  "Mephistophiles/surround.nvim",
  config = function()
    require "plugins.configs.surround"
  end,
})
  ---------------------------- Term ----------------------------
  use ({
    "akinsho/toggleterm.nvim",
    config = function()
      require "plugins.configs.toggleterm"
    end
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
