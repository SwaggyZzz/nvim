-- local gl = require('galaxyline')
-- -- local colors = require('galaxyline.theme').default
-- local condition = require('galaxyline.condition')
-- local gls = gl.section
-- gl.short_line_list = { 'NvimTree' }

-- local colors = {
--   bg = '#202328',
--   fg = '#f8f8f2',
--   section_bg = '#38393f',
--   yellow = '#f1fa8c',
--   cyan = '#8be9fd',
--   green = '#50fa7b',
--   orange = '#ffb86c',
--   magenta = '#ff79c6',
--   blue = '#8be9fd',
--   red = '#ff5555',
--   violet = '#a9a1e1',
-- }

-- local mode_color = function()
--   local mode_colors = {
--     n = colors.cyan,
--     i = colors.green,
--     c = colors.orange,
--     V = colors.magenta,
--     [''] = colors.magenta,
--     v = colors.magenta,
--     R = colors.red,
--   }

--   local color = mode_colors[vim.fn.mode()]

--   if color == nil then
--     color = colors.red
--   end

--   return color
-- end

-- gls.left[1] = {
--   RainbowRed = {
--     provider = function() return '▊ ' end,
--     highlight = {colors.blue,colors.bg}
--   },
-- }
-- gls.left[2] = {
--   ViMode = {
--     provider = function()
--       local alias = {
--         n = 'NORMAL',
--         i = 'INSERT',
--         c = 'COMMAND',
--         V = 'VISUAL',
--         [''] = 'VISUAL',
--         v = 'VISUAL',
--         R = 'REPLACE',
--       }
--       vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color())
--       local alias_mode = alias[vim.fn.mode()]
--       if alias_mode == nil then
--         alias_mode = vim.fn.mode()
--       end
--       return alias_mode..' '
--     end,
--     highlight = { colors.bg, colors.bg, 'bold' },
--     separator = "  ",
--     separator_highlight = {colors.bg, colors.section_bg},
--   },
-- }
-- gls.left[3] ={
--   FileIcon = {
--     provider = 'FileIcon',
--     condition = condition.buffer_not_empty,
--     highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
--   },
-- }
-- gls.left[4] = {
--   FileName = {
--     provider = 'FileName',
--     condition = condition.buffer_not_empty,
--     highlight = { colors.fg, colors.section_bg },
--     separator = " ",
--     separator_highlight = {colors.section_bg, colors.bg},
--   }
-- }
-- gls.left[5] = {
--   GitIcon = {
--     provider = function() return '  ' end,
--     condition = condition.check_git_workspace,
--     -- separator = ' ',
--     -- separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.violet,colors.bg,'bold'},
--   }
-- }
-- gls.left[6] = {
--   GitBranch = {
--     provider = 'GitBranch',
--     condition = condition.check_git_workspace,
--     highlight = {colors.violet,colors.bg,'bold'},
--   }
-- }
-- gls.left[7] = {
--   DiffAdd = {
--     provider = 'DiffAdd',
--     condition = condition.hide_in_width,
--     icon = '  ',
--     highlight = {colors.green,colors.bg},
--   }
-- }
-- gls.left[8] = {
--   DiffModified = {
--     provider = 'DiffModified',
--     condition = condition.hide_in_width,
--     icon = ' 柳',
--     highlight = {colors.orange,colors.bg},
--   }
-- }
-- gls.left[9] = {
--   DiffRemove = {
--     provider = 'DiffRemove',
--     condition = condition.hide_in_width,
--     icon = '  ',
--     highlight = {colors.red,colors.bg},
--   }
-- }
-- gls.left[10] = {
--   LeftEnd = {
--     provider = function() return ' ' end,
--     condition = condition.buffer_not_empty,
--     highlight = {colors.section_bg,colors.bg}
--   }
-- }
-- gls.left[11] = {
--   DiagnosticError = {
--     provider = 'DiagnosticError',
--     icon = '  ',
--     highlight = {colors.red,colors.section_bg}
--   }
-- }
-- gls.left[13] = {
--   DiagnosticWarn = {
--     provider = 'DiagnosticWarn',
--     icon = '  ',
--     highlight = {colors.orange,colors.section_bg},
--   }
-- }
-- gls.left[14] = {
--   DiagnosticHint = {
--     provider = 'DiagnosticHint',
--     icon = '  ',
--     highlight = {colors.cyan,colors.bg},
--   }
-- }
-- gls.left[15] = {
--   DiagnosticInfo = {
--     provider = 'DiagnosticInfo',
--     icon = '  ',
--     highlight = {colors.blue,colors.section_bg},
--     separator = ' ',
--     separator_highlight = { colors.section_bg, colors.bg },
--   }
-- }

-- gls.short_line_left[1] = {
--   BufferType = {
--     provider = 'FileTypeName',
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.blue,colors.bg,'bold'}
--   }
-- }

-- gls.short_line_left[2] = {
--   SFileName = {
--     provider =  'SFileName',
--     condition = condition.buffer_not_empty,
--     highlight = {colors.fg,colors.bg,'bold'}
--   }
-- }

-- gls.short_line_right[1] = {
--   BufferIcon = {
--     provider= 'BufferIcon',
--     highlight = {colors.fg,colors.bg}
--   }
-- }

local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

local mode_color = function()
  local mode_colors = {
    n = colors.cyan,
    i = colors.green,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }

  local color = mode_colors[vim.fn.mode()]

  if color == nil then
    color = colors.red
  end

  return color
end

gls.left[1] = {
  RainbowRed = {
    provider = function() return '▊ ' end,
    highlight = {colors.blue,colors.bg}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local mode_color = {
        n = colors.red, i = colors.green,v=colors.blue,
        [''] = colors.blue,V=colors.blue,
        c = colors.magenta,no = colors.red,s = colors.orange,
        S=colors.orange,[''] = colors.orange,
        ic = colors.yellow,R = colors.violet,Rv = colors.violet,
        cv = colors.red,ce=colors.red, r = colors.cyan,
        rm = colors.cyan, ['r?'] = colors.cyan,
        ['!']  = colors.red,t = colors.red}
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        R = 'REPLACE',
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      local alias_mode = alias[vim.fn.mode()]
      if alias_mode == nil then
        alias_mode = vim.fn.mode()
      end
      return alias_mode..' '
    end,
    highlight = {colors.red,colors.bg,'bold'},
  },
}
gls.left[3] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg}
  }
}
gls.left[4] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}

gls.left[5] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta,colors.bg,'bold'}
  }
}

gls.left[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
}

gls.left[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
}

gls.left[8] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[9] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.left[10] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan,colors.bg},
  }
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}

gls.mid[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' LSP:',
    highlight = {colors.cyan,colors.bg,'bold'}
  }
}

gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[3] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,colors.bg},
  }
}
gls.right[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.orange,colors.bg},
  }
}
gls.right[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,colors.bg},
  }
}

gls.right[8] = {
  RainbowBlue = {
    provider = function() return ' ▊' end,
    highlight = {colors.blue,colors.bg}
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
