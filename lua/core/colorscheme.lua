require("tokyonight").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = { italic = true },
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
}

local colorscheme = "tokyonight"

--[[ vim.g.material_style = "oceanic" ]]
--[[ local colorscheme = "material" ]]
--[[]]
--[[ require("material").setup { ]]
--[[]]
--[[   contrast = { ]]
--[[     sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree ) ]]
--[[     floating_windows = false, -- Enable contrast for floating windows ]]
--[[     line_numbers = false, -- Enable contrast background for line numbers ]]
--[[     sign_column = false, -- Enable contrast background for the sign column ]]
--[[     cursor_line = false, -- Enable darker background for the cursor line ]]
--[[     non_current_windows = false, -- Enable darker background for non-current windows ]]
--[[     popup_menu = false, -- Enable lighter background for the popup menu ]]
--[[   }, ]]
--[[]]
--[[   italics = { ]]
--[[     comments = true, -- Enable italic comments ]]
--[[     keywords = false, -- Enable italic keywords ]]
--[[     functions = true, -- Enable italic functions ]]
--[[     strings = false, -- Enable italic strings ]]
--[[     variables = false, -- Enable italic variables ]]
--[[   }, ]]
--[[]]
--[[   contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background ]]
--[[     "terminal", -- Darker terminal background ]]
--[[     "packer", -- Darker packer background ]]
--[[     "qf", -- Darker qf list background ]]
--[[   }, ]]
--[[]]
--[[   high_visibility = { ]]
--[[     lighter = false, -- Enable higher contrast text for lighter style ]]
--[[     darker = false, -- Enable higher contrast text for darker style ]]
--[[   }, ]]
--[[]]
--[[   disable = { ]]
--[[     colored_cursor = false, -- Disable the colored cursor ]]
--[[     borders = false, -- Disable borders between verticaly split windows ]]
--[[     background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background) ]]
--[[     term_colors = false, -- Prevent the theme from setting terminal colors ]]
--[[     eob_lines = false, -- Hide the end-of-buffer lines ]]
--[[   }, ]]
--[[]]
--[[   lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' ) ]]
--[[]]
--[[   async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default) ]]
--[[]]
--[[   custom_highlights = {}, -- Overwrite highlights with your own ]]
--[[]]
--[[   plugins = { -- Here, you can disable(set to false) plugins that you don't use or don't want to apply the theme to ]]
--[[     trouble = true, ]]
--[[     nvim_cmp = true, ]]
--[[     neogit = true, ]]
--[[     gitsigns = true, ]]
--[[     git_gutter = true, ]]
--[[     telescope = true, ]]
--[[     nvim_tree = true, ]]
--[[     sidebar_nvim = true, ]]
--[[     lsp_saga = true, ]]
--[[     nvim_dap = true, ]]
--[[     nvim_navic = true, ]]
--[[     which_key = true, ]]
--[[     sneak = true, ]]
--[[     hop = true, ]]
--[[     indent_blankline = true, ]]
--[[     nvim_illuminate = true, ]]
--[[     mini = true, ]]
--[[   }, ]]
--[[ } ]]

--[[ require("nightfox").setup { ]]
--[[   options = { ]]
--[[     -- Compiled file's destination location ]]
--[[     compile_path = vim.fn.stdpath "cache" .. "/nightfox", ]]
--[[     compile_file_suffix = "_compiled", -- Compiled file suffix ]]
--[[     transparent = false, -- Disable setting background ]]
--[[     terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal` ]]
--[[     dim_inactive = false, -- Non focused panes set to alternative background ]]
--[[     styles = { -- Style to be applied to different syntax groups ]]
--[[       comments = "NONE", -- Value is any valid attr-list value `:help attr-list` ]]
--[[       conditionals = "NONE", ]]
--[[       constants = "NONE", ]]
--[[       functions = "NONE", ]]
--[[       keywords = "NONE", ]]
--[[       numbers = "NONE", ]]
--[[       operators = "NONE", ]]
--[[       strings = "NONE", ]]
--[[       types = "NONE", ]]
--[[       variables = "NONE", ]]
--[[     }, ]]
--[[     inverse = { -- Inverse highlight for different types ]]
--[[       match_paren = false, ]]
--[[       visual = false, ]]
--[[       search = false, ]]
--[[     }, ]]
--[[     modules = { -- List of various plugins and additional options ]]
--[[       -- ... ]]
--[[     }, ]]
--[[   }, ]]
--[[   palettes = {}, ]]
--[[   specs = {}, ]]
--[[   groups = {}, ]]
--[[ } ]]

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
