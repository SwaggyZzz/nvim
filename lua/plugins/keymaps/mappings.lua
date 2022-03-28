local M = {
  -- Packer
  packer = {
    packer_sync = "<leader>ps",
    packer_update = "<leader>pu",
    packer_install = "<leader>pi",
    packer_clean = "<leader>pc",
    packer_status = "<leader>pt",
  },
  -- Bufferline
  bufferline = {
    next_buffer = "<C-l>",
    prev_buffer = "<C-h>",
  },
  -- Comment
  comment = {
    toggle = "<A-/>",
    -- toggle = "÷", -- <A-/>
  },

  -- map to <ESC> with no lag
  better_escape = { -- <ESC> will still work
    esc_insertmode = { "jk" }, -- multiple mappings allowed
  },
  -- LspConfig
  lspconfig = {
    declaration = "gD",
    definition = "gd",
    hover = "gh",
    implementation = "gi",
    signature_help = "gk",
    type_definition = "<leader>D",
    rename = "<leader>ra",
    code_action = "<leader>ca",
    references = "gr",
    float_diagnostics = "gl",
    goto_prev = "[d",
    goto_next = "]d",
    -- set_loclist = "<leader>q",
    set_loclist = "gsl",
    formatting = "<A-S-f>",
  },
  -- Renamer
  renamer = {
    rename = "<leader>rn"
  },
  -- NvimTree
  nvimtree = {
    toggle = "<C-n>",
    find_file = "<leader>n",
  },
  -- Telescope
  telescope = {
    buffers = "<leader>fb",
    find_files = "<leader>ff",
    find_hiddenfiles = "<leader>fa",
    git_commits = "<leader>cm",
    git_status = "<leader>gt",
    help_tags = "<leader>fh",
    live_grep = "<leader>fw",
    oldfiles = "<leader>fo",

    insert = {
      -- 历史记录
      cycle_history_next = "<C-n>",
      cycle_history_prev = "<C-p>",
      -- 上下移动
      move_selection_next = "<C-j>",
      move_selection_next_down = "<Down>",
      move_selection_previous = "<C-k>",
      move_selection_previous_up = "<Up>",

      close = "<C-c>",
      select_default = "<CR>",
      select_horizontal = "<C-x>",
      select_vertical = "<C-v>",
      select_tab = "<C-t>",

      preview_scrolling_up = "<C-u>",
      preview_scrolling_down = "<C-d>",

      results_scrolling_up = "<PageUp>",
      results_scrolling_down = "<PageDown>",

      toggle_selection_move_selection_worse = "<Tab>",
      toggle_selection_move_selection_better = "<S-Tab>",
      send_to_qflist_open_qflist = "<C-q>",
      send_selected_to_qflist_open_qflist = "<M-q>",
      complete_tag = "<C-l>",
      which_key = "<C-_>", -- keys from pressing <C-/>
    },
    normal = {
      close = "<esc>",
      select_default = "<CR>",
      select_horizontal = "<C-x>",
      select_vertical = "<C-v>",
      select_tab = "<C-t>",

      toggle_selection_move_selection_worse = "<Tab>",
      toggle_selection_move_selection_better = "<S-Tab>",
      send_to_qflist_open_qflist = "<C-q>",
      send_selected_to_qflist_open_qflist = "<M-q>",

      move_selection_next = "j",
      move_selection_previous = "k",
      move_to_top = "H",
      move_to_middle = "M",
      move_to_bottom = "L",

      move_selection_next_down = "<Down>",
      move_selection_previous_up = "<Up>",
      move_to_top_gg = "gg",
      move_to_bottom_G = "G",

      preview_scrolling_up = "<C-u>",
      preview_scrolling_down = "<C-d>",

      results_scrolling_up = "<PageUp>",
      results_scrolling_down = "<PageDown>",
    }
  },
  -- Hop
  hop = {
    find_word = "<leader>w",
    find_linej = "<leader>j",
    find_linek = "<leader>k",
    find_char1 = "<leader>c",
    find_char2 = "<leader>cc",
  },
  -- Cmp
  cmp = {
    select_prev_item  = "<C-k>",
    select_next_item  = "<C-j>",
    scroll_docs_up  = "<C-b>",
    scroll_docs_down  = "<C-f>",
    show_complete = "<C-Space>",
    disbale = "<C-y>",
    close = "<C-e>",
    select = "<CR>",
  },
  -- Aerial
  aerial = {
    toggle = "<leader>a",
    prev = "{",
    next = "}",
    prevUp = "[[",
    nextUp = "]]",
  },
  -- ToggleTerm
  term = {
    close  = "<esc>",
    quit_insert = "jk",
    up  = "<C-k>",
    down  = "<C-j>",
    left  = "<C-h>",
    right  = "<C-l>",
  },
  -- Tabout
  tabout = {
    tabkey = "<A-l>",
    backwards_tabkey = "<A-h>",
  },
  -- Nvim-treesitter
  nvim_treesitter = {
    all_indent_format = "<A-S-i>",
  }
}

return M
