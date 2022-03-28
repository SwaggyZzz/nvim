local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local setup_auto_format = require("core.utils").setup_auto_format

local servers = {
  "clangd",
  "rust_analyzer",
  "pyright",
  "gopls",
  "sumneko_lua",
  "yamlls", "dockerls",
  "tsserver", "cssls", "html", "tailwindcss",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end


local auto_format_file_type = {
  rust_analyzer = {
    "rs"
  },
  tsserver = {
    "js",
    "jsx",
    "ts",
    "tsx",
    "css"
  }
}


-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)

  local format_files = auto_format_file_type[server.name]
  if format_files then
    for _, file in pairs(format_files) do
      setup_auto_format(file)
    end
  end

	local opts = {
		on_attach = require("plugins.configs.lsp.handlers").on_attach,
		capabilities = require("plugins.configs.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("plugins.configs.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("plugins.configs.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "tsserver" then
		local sumneko_opts = require("plugins.configs.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "tsserver" then
		local ts_opts = require("plugins.configs.lsp.settings.tsserver")
		opts = ts_opts
	end

	if server.name == "rust_analyzer" then
		local rust_opts = require("plugins.configs.lsp.settings.rust_analyzer")
		opts = vim.tbl_deep_extend("force", rust_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

