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

  -- **Updated `indent-blankline` for v3**
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
    event = "VeryLazy",  -- Load after other keymaps are set
    opts = {
      plugins = {
        marks = true,
        registers = true,
        spelling = { enabled = true, suggestions = 20 },
        presets = { operators = false, motions = true, text_objects = true },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      layout = { spacing = 3 },
      win = { no_overlap = true, border = "rounded" },
    },
    keys = {
      -- Core Mappings
      { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha" },
      { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers" },
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
      { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
      { "<leader>q", "<cmd>q!<CR>", desc = "Quit" },
      { "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },
      { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
      { "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find Files" },
      { "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
      { "<leader>P", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
      -- Git Mappings
      { "<leader>g", desc = "Git", group = true },
      { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
      { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
      -- LSP Mappings
      { "<leader>l", desc = "LSP", group = true },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
      { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Diagnostics" },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
      -- Packer Mappings
      { "<leader>p", desc = "Packer", group = true },
      { "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install" },
      { "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync" },
      { "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update" },
      -- Search Mappings
      { "<leader>s", desc = "Search", group = true },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
      -- Terminal Mappings
      { "<leader>t", desc = "Terminal", group = true },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating Terminal" },
      { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal Terminal" },
      { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical Terminal" },
    },
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
    dependencies = {
      "williamboman/mason-lspconfig.nvim", -- Ensure it's loaded after mason
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
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
    lazy = false,
    config = function()
      require("which-key").setup({})
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
      })
    end,
  },
  -- Fast load times, caches instead of compiling
  {
  "lewis6991/impatient.nvim",
  config = function()
    require("impatient")
  end,
  },
}
