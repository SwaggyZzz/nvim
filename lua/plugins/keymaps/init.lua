local utils = require "core.utils"
local plugin_maps = require "plugins.keymaps.mappings"

local map = utils.map
local nmap = utils.nmap

local M = {
  -- Packer
  packer = function ()
    local m = plugin_maps.packer
    nmap(m.packer_sync, "<cmd>PackerSync<cr>")
    nmap(m.packer_update, "<cmd>PackerUpdate<cr>")
    nmap(m.packer_install, "<cmd>PackerInstall<cr>")
    nmap(m.packer_clean, "<cmd>PackerClean<cr>")
    nmap(m.packer_status, "<cmd>PackerStatus<cr>")
  end,
  -- Bufferline
  bufferline = function()
    local m = plugin_maps.bufferline
    nmap(m.next_buffer, ":BufferLineCycleNext <CR>")
    nmap(m.prev_buffer, ":BufferLineCyclePrev <CR>")
  end,
  -- Comment
  comment = function()
    local m = plugin_maps.comment
    nmap(m.toggle, ":lua require('Comment.api').toggle_current_linewise()<CR>")
    map("v", m.toggle, ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")
  end,
  -- LspConfig
  lspconfig = function()
    local m = plugin_maps.lspconfig
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    nmap(m.declaration, "<cmd>lua vim.lsp.buf.declaration()<CR>")
    nmap(m.definition, "<cmd>lua vim.lsp.buf.definition()<CR>")
    nmap(m.hover, "<cmd>lua vim.lsp.buf.hover()<CR>")
    nmap(m.implementation, "<cmd>lua vim.lsp.buf.implementation()<CR>")
    nmap(m.signature_help, "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    nmap(m.type_definition, "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    nmap(m.rename, "<cmd>lua vim.lsp.buf.rename()<CR>")
    -- nmap(m.code_action, "<cmd>lua vim.lsp.buf.code_action()<CR>")
    nmap(m.references, "<cmd>lua vim.lsp.buf.references()<CR>")
    nmap(m.float_diagnostics, '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>')
    nmap(m.goto_prev, "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    nmap(m.goto_next, "<cmd>lua vim.diagnostic.goto_next()<CR>")
    nmap(m.set_loclist, "<cmd>lua vim.diagnostic.setloclist()<CR>")
    nmap(m.formatting, "<cmd>lua vim.lsp.buf.formatting()<CR>")
  end,
  -- NvimTree
  nvimtree = function()
    local m = plugin_maps.nvimtree
    nmap(m.toggle, ":NvimTreeToggle <CR>")
    nmap(m.find_file, ":NvimTreeFindFile <CR>")
  end,
  -- Telescope
  telescope = function()
    local m = plugin_maps.telescope
    nmap(m.buffers, ":Telescope buffers <CR>")
    nmap(m.find_files, ":Telescope find_files <CR>")
    nmap(m.find_hiddenfiles, ":Telescope find_files follow=true no_ignore=true hidden=true <CR>")
    nmap(m.git_commits, ":Telescope git_commits <CR>")
    nmap(m.git_status, ":Telescope git_status <CR>")
    nmap(m.help_tags, ":Telescope help_tags <CR>")
    nmap(m.live_grep, ":Telescope live_grep <CR>")
    nmap(m.oldfiles, ":Telescope oldfiles <CR>")
  end,
  -- Hop
  hop = function ()
    local m = plugin_maps.hop
    nmap(m.find_word, ":<C-u>HopWord<CR>")
    nmap(m.find_linej, ":<C-u>HopLine<CR>")
    nmap(m.find_linek, ":<C-u>HopLine<CR>")
    nmap(m.find_char1, ":<C-u>HopChar1<CR>")
    nmap(m.find_char2, ":<C-u>HopChar2<CR>")
  end
}

for _, fn in pairs(M) do
  fn()
end
