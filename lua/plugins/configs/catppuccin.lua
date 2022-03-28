local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
  return
end

catppuccin.setup({
  transparent_background = false,
  term_colors = true,
  styles = {
    comments = "italic",
    functions = "NONE",
    -- functions = "bold",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "NONE",
        hints = "NONE",
        warnings = "NONE",
        information = "NONE",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    lsp_trouble = true,
    lsp_saga = true,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = { enabled = true, show_root = true },
    which_key = true,
    indent_blankline = { enabled = true, colored_indent_levels = false },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = true,
    hop = true,
  },
})

vim.cmd[[colorscheme catppuccin]]
