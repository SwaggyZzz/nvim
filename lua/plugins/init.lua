local present, packer = pcall(require, "plugins.packerInit")

if not present then
  return false
end

local plugins = {
  {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  },
  { "nvim-lua/plenary.nvim" },
  { "lewis6991/impatient.nvim" },
  { "moll/vim-bbye" },
  { "nathom/filetype.nvim" },
  { "kyazdani42/nvim-web-devicons" },
  {
    "goolord/alpha-nvim",
    -- event = "BufWinEnter",
    config = function()
      require "plugins.configs.alpha"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    after = "nvim-web-devicons",
    -- after = "lualine-lsp-progress",
    config = function()
      require "plugins.configs.lualine"
    end,
  },
  -- {
  --    'arkav/lualine-lsp-progress',
  --    after = "nvim-gps"
  -- },
  {
    "akinsho/bufferline.nvim",
    event = "BufRead",
    config = function()
      require "plugins.configs.bufferline"
    end,
    setup = function()
      require("core.keymaps").bufferline_setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- event = "BufRead",
    config = function()
      require "plugins.configs.indentline"
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require "plugins.configs.colorizer"
    end,
  },
  -- StartupTime
  {
    "dstein64/vim-startuptime",
    opt = true,
    cmd = { "StartupTime" },
  },
  -- 取消搜索高亮
  {
    "romainl/vim-cool",
    opt = true,
    event = { "CursorMoved", "InsertEnter" },
  },
  {
    "jdhao/better-escape.vim",
    opt = true,
    event = "InsertEnter",
  },
  {
    "lewis6991/gitsigns.nvim",
    opt = true,
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "plugins.configs.gitsigns"
    end,
    setup = function()
      require("core.utils").packer_lazy_load "gitsigns.nvim"
    end,
  },
  {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require "plugins.configs.autopairs"
    end,
  },
  {
    "numToStr/Comment.nvim",
    module = "Comment",
    keys = { "gcc" },
    config = function()
      require "plugins.configs.comment"
    end,
    setup = function()
      require("core.keymaps").comment_setup()
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require "plugins.configs.nvim-tree"
    end,
    setup = function()
      require("core.keymaps").nvimtree_setup()
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    event = "BufRead",
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "echasnovski/mini.nvim",
    branch = "stable",
    event = "BufRead",
    config = function()
      require("mini.surround").setup {}
    end,
  },
  { "sindrets/diffview.nvim", opt = true, cmd = "DiffviewOpen" },
  ------------------------------- colorschemes -----------------------------------
  { "folke/tokyonight.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "sainnhe/gruvbox-material" },
  { "mhartington/oceanic-next" },
  -- { "lunarvim/onedarker.nvim" },
  { "rmehri01/onenord.nvim" },
  { "shaunsingh/nord.nvim" },

  ------------------------------- Treesitter ---------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    -- event = { "BufRead", "BufNewFile" },
    run = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
    setup = function()
      require("core.keymaps").treesitter_setup()
    end,
  },
  -- {
  --    "SmiteshP/nvim-gps",
  --    after = "nvim-treesitter",
  -- },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
  },
  {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "xml",
    },
  },
  {
    "stevearc/aerial.nvim",
    setup = function()
      require("core.keymaps").aerial_setup()
    end,
    config = function()
      require "plugins.configs.aerial"
    end,
  },
  -- {
  --   "p00f/nvim-ts-rainbow",
  --   after = "nvim-treesitter",
  --   event = "BufRead",
  -- },
  ------------------------------- Treesitter End ---------------------------------
  --
  -------------------------------- Lsp Config ------------------------------------
  {
    "neovim/nvim-lspconfig",
    module = "lspconfig",
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "nvim-lspconfig"
      -- reload the current file so lsp actually starts for it
      vim.defer_fn(function()
        vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
      end, 0)
    end,
    config = function()
      require "plugins.configs.lsp"
    end,
  },
  {
    "williamboman/nvim-lsp-installer",
    after = "nvim-lspconfig",
    setup = function()
      vim.cmd [[packadd nvim-lsp-installer]]
      require("core.utils").packer_lazy_load "nvim-lsp-installer"
    end,
  },
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    -- after = "nvim-lspconfig",
    -- setup = function()
    --    vim.cmd [[packadd null-ls.nvim]]
    --    require("core.utils").packer_lazy_load "null-ls.nvim"
    -- end,
    -- config = function()
    --    require("plugins.configs.lsp.null-ls")
    -- end
  },
  { "simrat39/rust-tools.nvim" },
  { "folke/lua-dev.nvim" },
  {
    "b0o/schemastore.nvim",
  },
  {
    "ray-x/lsp_signature.nvim",
    -- event = "BufRead",
    after = "nvim-lspconfig",
    config = function()
      require "plugins.configs.lsp.lsp_signature"
    end,
  },
  { "antoinemadec/FixCursorHold.nvim" }, -- This is needed to fix lsp doc highlight
  {
    "folke/trouble.nvim",
    config = function()
      require "plugins.configs.trouble"
    end,
    setup = function()
      require("core.keymaps").trouble_setup()
    end,
  },
  -- {
  --    "filipdutescu/renamer.nvim",
  --    event = "InsertEnter",
  --    setup = function()
  --       require("core.keymaps").renamer_setup()
  --    end,
  --    config = function()
  --       require "plugins.configs.renamer"
  --    end
  -- },
  -------------------------------- Lsp Config End ------------------------------------
  --
  ------------------------------- Cmp ------------------------------------
  {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  },
  {
    "hrsh7th/nvim-cmp",
    commit = "4f1358e659d51c69055ac935e618b684cf4f1429",
    after = "friendly-snippets",
    config = function()
      require "plugins.configs.cmp"
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    after = "nvim-cmp",
    config = function()
      require "plugins.configs.lua_snip"
    end,
  },
  {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip",
  },
  {
    "hrsh7th/cmp-nvim-lua",
    after = "cmp_luasnip",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    after = "cmp-nvim-lua",
    setup = function()
      vim.cmd [[packadd cmp-nvim-lsp]]
    end,
  },
  {
    "hrsh7th/cmp-cmdline",
    after = "nvim-cmp",
  },
  {
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lsp",
  },
  {
    "hrsh7th/cmp-path",
    after = "cmp-buffer",
  },
  ------------------------------- Cmp End ------------------------------------
  --
  ------------------------ Telescope ------------------------------
  {
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    config = function()
      require "plugins.configs.telescope"
    end,
    setup = function()
      require("core.keymaps").telescope_setup()
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    after = "telescope.nvim",
    -- event = "BufRead",
    run = "make",
    setup = function()
      vim.cmd [[packadd telescope-fzf-native.nvim]]
    end,
  },
  -- {
  --   "nvim-telescope/telescope-project.nvim",
  --   opt = true,
  --   after = "telescope-fzf-native.nvim",
  --   -- event = "BufWinEnter",
  --   setup = function()
  --     vim.cmd [[packadd telescope-project.nvim]]
  --   end,
  -- },
  { "ahmedkhalf/project.nvim" },
  ------------------------ Telescope End ------------------------------
  --
  ------------------------ Navigation -----------------------------
  {
    "phaazon/hop.nvim",
    cmd = {
      "HopLine",
      "HopLineStart",
      "HopWord",
      "HopPattern",
      "HopChar1",
      "HopChar2",
    },
    setup = function()
      require("core.keymaps").hop_setup()
    end,
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  -- {
  --    "ggandor/lightspeed.nvim",
  --    event = "BufRead",
  --    config = function()
  --       require "plugins.configs.lightspeed"
  --    end
  -- },
  {
    "andymass/vim-matchup",
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "vim-matchup"
    end,
  },
  ------------------------ Navigation End -----------------------------
  --
  ------------------------ Terminal ----------------------------------
  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    config = function()
      require "plugins.configs.toggleterm"
    end,
  },
  ------------------------ Terminal End -----------------------------
}

return packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
end)
