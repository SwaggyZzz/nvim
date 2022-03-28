local status_ok, tabout = pcall(require, "tabout")

if not status_ok then
  return
end

tabout.setup({
  tabkey = "<TAB>",
  backwards_tabkey = "<S-TAB>",
  ignore_beginning = false,
  act_as_tab = true,
  enable_backward = true,
  completion = true,
  tabouts = {
    { open = "'", close = "'" },
    { open = '"', close = '"' },
    { open = "`", close = "`" },
    { open = "(", close = ")" },
    { open = "[", close = "]" },
    { open = "{", close = "}" },
  },
  exclude = {},
})
