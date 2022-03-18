local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local plugin_maps = require "plugins.keymaps.mappings"
local im = plugin_maps.telescope.insert
local nm = plugin_maps.telescope.normal

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        [im.cycle_history_next] = actions.cycle_history_next,
        [im.cycle_history_prev] = actions.cycle_history_prev,

        [im.move_selection_next]= actions.move_selection_next,
        [im.move_selection_previous]= actions.move_selection_previous,

        [im.move_selection_next_down]= actions.move_selection_next,
        [im.move_selection_previous_up]= actions.move_selection_previous,

        [im.close]= actions.close,


        [im.select_default]= actions.select_default,
        [im.select_horizontal]= actions.select_horizontal,
        [im.select_vertical]= actions.select_vertical,
        [im.select_tab]= actions.select_tab,

        [im.preview_scrolling_up]= actions.preview_scrolling_up,
        [im.preview_scrolling_down]= actions.preview_scrolling_down,

        [im.results_scrolling_up]= actions.results_scrolling_up,
        [im.results_scrolling_down]= actions.results_scrolling_down,

        [im.toggle_selection_move_selection_worse]= actions.toggle_selection + actions.move_selection_worse,
        [im.toggle_selection_move_selection_better]= actions.toggle_selection + actions.move_selection_better,
        [im.send_to_qflist_open_qflist]= actions.send_to_qflist + actions.open_qflist,
        [im.send_selected_to_qflist_open_qflist]= actions.send_selected_to_qflist + actions.open_qflist,
        [im.complete_tag]= actions.complete_tag,
        [im.which_key]= actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        [nm.close] = actions.close,
        [nm.select_default] = actions.select_default,
        [nm.select_horizontal] = actions.select_horizontal,
        [nm.select_vertical] = actions.select_vertical,
        [nm.select_tab] = actions.select_tab,

        [nm.toggle_selection_move_selection_worse] = actions.toggle_selection + actions.move_selection_worse,
        [nm.toggle_selection_move_selection_better] = actions.toggle_selection + actions.move_selection_better,
        [nm.send_to_qflist_open_qflist] = actions.send_to_qflist + actions.open_qflist,
        [nm.send_selected_to_qflist_open_qflist] = actions.send_selected_to_qflist + actions.open_qflist,

        [nm.move_selection_next] = actions.move_selection_next,
        [nm.move_selection_previous] = actions.move_selection_previous,
        [nm.move_to_top] = actions.move_to_top,
        [nm.move_to_middle] = actions.move_to_middle,
        [nm.move_to_bottom] = actions.move_to_bottom,

        [nm.move_selection_next_down] = actions.move_selection_next,
        [nm.move_selection_previous_up] = actions.move_selection_previous,
        [nm.move_to_top_gg] = actions.move_to_top,
        [nm.move_to_bottom_G] = actions.move_to_bottom,

        [nm.preview_scrolling_up] = actions.preview_scrolling_up,
        [nm.preview_scrolling_down] = actions.preview_scrolling_down,

        [nm.results_scrolling_up] = actions.results_scrolling_up,
        [nm.results_scrolling_down] = actions.results_scrolling_down,

        -- [nm.cycle_history_next] = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}
