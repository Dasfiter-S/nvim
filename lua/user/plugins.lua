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
   event = "VeryLazy",
   opts = {
     layout = { spacing = 3 },
     win = { no_overlap = true, border = "rounded" },
   },
   config = function()
     local wk = require("which-key")
     wk.add({
       { "<leader>g", group = "Git" },
       { "<leader>l", group = "LSP" },
       { "<leader>p", group = "Lazy" },
       { "<leader>s", group = "Search" },
       { "<leader>t", group = "Terminal" },
       -- Individual Key Mappings
       { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha" },
       { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
       { "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },
       { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
       { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
       { "<leader>F", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
       { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
       { "<leader>q", "<cmd>q!<CR>", desc = "Quit" },
       { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
       -- Git Group (Nested with `expand = function()`)
       { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
       { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
       { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
       { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
       { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
       -- LSP Group
       { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
       { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Diagnostics" },
       { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
       { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
       { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
       -- Lazy Group
       { "<leader>pl", "<cmd>Lazy<cr>", desc = "Lazy Menu" },
       { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install Plugins" },
       { "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync Plugins" },
       { "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update Plugins" },
       { "<leader>pc", "<cmd>Lazy check<cr>", desc = "Check for Updates" },
       -- Search Group
       { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
       { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
       { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
       -- Terminal Group
       { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating Terminal" },
       { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal Terminal" },
       { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical Terminal" },
     })
   end,
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
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local handlers = require("user.handlers")
      handlers.setup() -- ← run your diagnostic and handler setup
      local servers = { "lua_ls", "pyright", "jsonls" } -- Add others as needed
      for _, server in ipairs(servers) do
        server = vim.split(server, "@")[1]
        if server ~= "null-ls" then -- ✅ prevent accidental null-ls registration
          lspconfig[server].setup({
            on_attach = handlers.on_attach,
            capabilities = handlers.capabilities,
          })
        end
      end
    end,
  },
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
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = nil, -- or set a list like { "stylua", "eslint_d" }
        automatic_installation = false, -- true = auto-install missing packages
        handlers = {}, -- can map individual tools to custom options
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        debug = false,
        -- 👇 NO sources here — mason-null-ls will handle them
        on_attach = function(_, bufnr)
          vim.notify("✅ none-ls safe on_attach", vim.log.levels.INFO)
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>nf", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
        end,
      })
    end,
  },
  {
  "RRethy/vim-illuminate",
  event = "LspAttach",
  config = function()
    require("illuminate").configure({
      providers = { "lsp", "treesitter", "regex" },
      delay = 200,
      filetypes_denylist = { "alpha", "NvimTree", "TelescopePrompt" },
      under_cursor = true,
      auto_attach = false,
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
    config = function()
      local ok, gitsigns = pcall(require, "gitsigns")
      if not ok then
        vim.notify("Failed to load gitsigns", vim.log.levels.WARN)
        return
      end
      gitsigns.setup()
    end,
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
