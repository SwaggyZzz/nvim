local M = {}

M.map = function(mode, keys, command, opt)
  local options = { noremap = true, silent = true }
  if opt then
    options = vim.tbl_extend("force", options, opt)
  end

  -- all valid modes allowed for mappings
  -- :h map-modes
  local valid_modes = {
    [""] = true,
    ["n"] = true,
    ["v"] = true,
    ["s"] = true,
    ["x"] = true,
    ["o"] = true,
    ["!"] = true,
    ["i"] = true,
    ["l"] = true,
    ["c"] = true,
    ["t"] = true,
  }

  -- helper function for M.map
  -- can gives multiple modes and keys
  local function map_wrapper(sub_mode, lhs, rhs, sub_options)
    if type(lhs) == "table" then
      for _, key in ipairs(lhs) do
        map_wrapper(sub_mode, key, rhs, sub_options)
      end
    else
      if type(sub_mode) == "table" then
        for _, m in ipairs(sub_mode) do
          map_wrapper(m, lhs, rhs, sub_options)
        end
      else
        if valid_modes[sub_mode] and lhs and rhs then
          vim.api.nvim_set_keymap(sub_mode, lhs, rhs, sub_options)
        else
          sub_mode, lhs, rhs = sub_mode or "", lhs or "", rhs or ""
          print(
            "Cannot set mapping [ mode = '" .. sub_mode .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]"
          )
        end
      end
    end
  end

  map_wrapper(mode, keys, command, options)
end
M.nmap = function(keys, command, opt)
  M.map("n", keys, command, opt)
end
M.imap = function(keys, command, opt)
  M.map("i", keys, command, opt)
end

-- Highlights functions

-- Define bg color
-- @param group Group
-- @param color Color

M.bg = function(group, col)
  vim.cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, col)
  vim.cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
  vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

---@param ft string
---@param command string
function M.setup_auto_format(ft, command)
  -- setup_auto_format("dart")
  -- setup_auto_format("rs")

  -- setup_auto_format("cpp")
  -- setup_auto_format("cc")
  -- setup_auto_format("h")

  -- setup_auto_format("js")
  -- setup_auto_format("css")
  -- setup_auto_format("tsx")
  -- setup_auto_format("svelte")
  -- setup_auto_format("ts")
  -- setup_auto_format("py")
  -- setup_auto_format("dart")
  -- setup_auto_format("lua", "lua require('stylua-nvim').format_file()")
  if not command then
    command = "lua vim.lsp.buf.formatting_sync()"
  end
  vim.cmd(string.format("autocmd BufWritePre *.%s %s", ft, command))
end

return M
