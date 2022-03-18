local on_attach = require("plugins.configs.lsp.handlers").on_attach

return {
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门插件插件处理
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    on_attach(client, bufnr)
  end,
}
