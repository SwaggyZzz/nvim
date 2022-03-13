local M = {
  packer = {
    packer_sync = "<leader>ps",
    packer_update = "<leader>pu",
    packer_install = "<leader>pi",
    packer_clean = "<leader>pc",
    packer_status = "<leader>pt",
  },
  bufferline = {
    next_buffer = "<TAB>",
    prev_buffer = "<S-Tab>",
  },
  comment = {
    toggle = "<leader>/",
    -- toggle = "÷", -- <A-/>
  },

  -- map to <ESC> with no lag
  better_escape = { -- <ESC> will still work
    esc_insertmode = { "jk" }, -- multiple mappings allowed
  },

  lspconfig = {
    declaration = "gD",
    definition = "gd",
    hover = "K",
    implementation = "gi",
    signature_help = "gk",
    type_definition = "<leader>D",
    rename = "<leader>ra",
    code_action = "<leader>ca",
    references = "gr",
    float_diagnostics = "gl",
    goto_prev = "[d",
    goto_next = "]d",
    set_loclist = "<leader>q",
    formatting = "Ï",
  },

  nvimtree = {
    toggle = "<C-n>",
    find_file = "<leader>n",
  },

  telescope = {
    buffers = "<leader>fb",
    find_files = "<leader>ff",
    find_hiddenfiles = "<leader>fa",
    git_commits = "<leader>cm",
    git_status = "<leader>gt",
    help_tags = "<leader>fh",
    live_grep = "<leader>fw",
    oldfiles = "<leader>fo",
    themes = "<leader>th", -- NvChad theme picker
  },

  hop = {
    find_word = "<leader>w",
    find_linej = "<leader>j",
    find_linek = "<leader>k",
    find_char1 = "<leader>c",
    find_char2 = "<leader>cc",
  }
}

return M
