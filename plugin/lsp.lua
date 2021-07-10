local nvim_lsp = require('lspconfig')

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.colorProvider = { dynamicRegistration = false }
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
  }
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    -- on_attach = on_attach,
    on_attach = function()
        require"lsp_signature".on_attach({
            bind = true,
            use_lspsaga = false,
            floating_window = true,
            fix_pos = true,
            hint_enable = true,
            hi_parameter = "Search",
            handler_opts = {"double"}
        })
    end
  }
end

-- local servers = {"pyright", "rust_analyzer", "tsserver", "gopls", "clangd"}
-- for _, lsp in ipairs(servers) do
--     nvim_lsp[lsp].setup {
--         capabilities = capabilities,
--         on_attach = function()
--             require"lsp_signature".on_attach({
--                 bind = true,
--                 use_lspsaga = false,
--                 floating_window = true,
--                 fix_pos = true,
--                 hint_enable = true,
--                 hi_parameter = "Search",
--                 handler_opts = {"double"}
--             })
--         end
--     }
-- end

-- lsp-install
local function setup_servers()
  require"lspinstall".setup()

  -- get all installed servers
  local servers = require"lspinstall".installed_servers()
  -- ... and add manually installed servers
--   table.insert(servers, "sourcekit")
--   table.insert(servers, "hls")

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
      config.root_dir = function(fname)
        if fname:match("lush_theme") ~= nil then return nil end
        local util = require "lspconfig/util"
        return util.find_git_ancestor(fname) or util.path.dirname(fname)
      end
    end
    if server == "sourcekit" then
      config.filetypes = { "swift", "objective-c", "objective-cpp" } -- we don't want c and cpp!
    end
    if server == "clangd" then
      config.filetypes = { "c", "cpp" } -- we don't want objective-c and objective-cpp!
    end
    if server == "efm" then config = vim.tbl_extend("force", config, require "efm") end
    if server == "diagnosticls" then
      config = vim.tbl_extend("force", config, require "diagnosticls")
    end
    if server == "tailwindcss" then
      config.settings = {
        tailwindCSS = {
          -- NOTE: values for `validate` and `lint.cssConflict` are required by the server
          validate = true,
          lint = { cssConflict = "warning" },
        },
      }
      config.on_new_config = function(new_config)
        new_config.settings.editor = {
          -- optional, for hover code indentation
          tabSize = vim.lsp.util.get_effective_tabstop(),
        }
      end
    end
    if server == "vim" then config.init_options = { isNeovim = true } end
    if server == "hls" then
      config.root_dir = require"lspconfig/util".root_pattern("*.cabal", "stack.yaml",
                                                             "cabal.project", "package.yaml",
                                                             "hie.yaml", ".git");
    end

    nvim_lsp[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require"lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
