local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local m = require "core.keymaps".telescope

local previewers = require "telescope.previewers"
local sorters = require "telescope.sorters"
local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    file_sorter = sorters.get_fuzzy_file,
    generic_sorter = sorters.get_generic_fuzzy_sorter,
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.75,
      preview_cutoff = 120,
      horizontal = {
        preview_width = function(_, cols, _)
          if cols < 120 then
            return math.floor(cols * 0.5)
          end
          return math.floor(cols * 0.6)
        end,
        mirror = false,
      },
      vertical = { mirror = false },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
    mappings = {
      i = {
        [m.cycle_history_next] = actions.cycle_history_next,
        [m.cycle_history_prev] = actions.cycle_history_prev,

        [m.move_selection_next]= actions.move_selection_next,
        [m.move_selection_previous]= actions.move_selection_previous,

        [m.close]= actions.close,

        [m.select_default]= actions.select_default,
        [m.select_horizontal]= actions.select_horizontal,
        [m.select_vertical]= actions.select_vertical,

        [m.preview_scrolling_up]= actions.preview_scrolling_up,
        [m.preview_scrolling_down]= actions.preview_scrolling_down,

        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },

      n = {
        [m.select_default] = actions.select_default,
        [m.select_horizontal] = actions.select_horizontal,
        [m.select_vertical] = actions.select_vertical,

        [m.n_close] = actions.close,

        [m.move_selection_next] = actions.move_selection_next,
        [m.move_selection_previous] = actions.move_selection_previous,

        [m.preview_scrolling_up] = actions.preview_scrolling_up,
        [m.preview_scrolling_down] = actions.preview_scrolling_down,

        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

        -- [m.move_to_top] = actions.move_to_top,
        -- [m.move_to_middle] = actions.move_to_middle,
        -- [m.move_to_bottom] = actions.move_to_bottom,
        -- [m.move_to_top_gg] = actions.move_to_top,
        -- [m.move_to_bottom_G] = actions.move_to_bottom,
      },
    },
    file_ignore_patterns = {},
    path_display = { shorten = 5 },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    pickers = {
      find_files = {
        find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
      },
      live_grep = {
        --@usage don't include the filename in the search results
        only_sort_text = true,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
}

telescope.load_extension('fzf')
telescope.load_extension("project")
