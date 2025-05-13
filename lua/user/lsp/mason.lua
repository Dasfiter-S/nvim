local servers = {
	"lua_ls",
	-- "cssls",
	-- "html",
	-- "tsserver",
	"pyright",
	-- "bashls",
	"jsonls",
	-- "yamlls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = function(client, bufnr)
      -- If it's null-ls, don't use full handlers
      if client.name == "null-ls" then
        local ok, handlers = pcall(require, "user.handlers")
        if ok and handlers.lsp_keymaps then
          handlers.lsp_keymaps(bufnr)
        end
      else
        require("user.lsp.handlers").on_attach(client, bufnr)
      end
    end,
    capabilities = require("user.lsp.handlers").capabilities,
  }


	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
