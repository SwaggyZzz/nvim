if not vim.g.vscode then
  local present, impatient = pcall(require, "impatient")

  if present then
    impatient.enable_profile()
  end

  local core_modules = {
    "core.options",
    "core.autocmds",
    "core.colorscheme",
  }

  for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
    end
  end
end

-- non plugin mappings
require("core.keymaps").init()
