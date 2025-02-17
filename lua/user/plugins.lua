return {
  -- Lazy.nvim itself
  { "folke/lazy.nvim" },

  -- Core Dependencies
  { "nvim-lua/plenary.nvim" },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function() require("nvim-autopairs").setup() end
  },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function() require("Comment").setup() end
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },

  -- File Explorer (NvimTree)
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function() require("nvim-tree").setup() end
  },

  -- Bufferline
  { "akinsho/bufferline.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
  { "moll/vim-bbye" },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "BufRead",
    config = function() require("lualine").setup() end
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    config = function() require("toggleterm").setup() end
  },

  -- Project Management
  {
    "ahmedkhalf/project.nvim",
    config = function() require("project_nvim").setup({}) end
  },

  -- **✅ Fixed: Updated `indent-blankline` for v3**
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufRead",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = true },
      })
    end
  },

  -- Startup Dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function() require("alpha").setup(require("alpha.themes.startify").config) end
  },

  -- Keybind Helper
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function() require("which-key").setup() end
  },

  -- Colorschemes
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "lunarvim/darkplus.nvim" },
  { "morhetz/gruvbox" },

  -- CMP (Completion)
  { "hrsh7th/nvim-cmp", event = "InsertEnter" },
  { "hrsh7th/cmp-buffer", event = "InsertEnter" },
  { "hrsh7th/cmp-path", event = "InsertEnter" },
  { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
  { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
  { "hrsh7th/cmp-nvim-lua", event = "InsertEnter" },

  -- Snippets
  { "L3MON4D3/LuaSnip", event = "InsertEnter" },
  { "rafamadriz/friendly-snippets", event = "InsertEnter" },

  -- LSP Setup
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end
  },
  {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "jsonls",
      }
    })
  end,
  },
  { "jose-elias-alvarez/null-ls.nvim" },
  {
  "RRethy/vim-illuminate",
  event = "BufRead",
  config = function()
    require("illuminate").configure({
      providers = { "lsp", "treesitter", "regex" },
      delay = 200,
      filetypes_denylist = { "alpha", "NvimTree", "TelescopePrompt" },
      under_cursor = true,
    })
  end,
  },


  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufRead"
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope"
  },

  -- Git Integration
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function() require("gitsigns").setup() end
  },

  -- Icons
  { "echasnovski/mini.icons" },

  -- Noice.nvim (Better UI)
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    config = function() require("noice").setup() end
  },
}
