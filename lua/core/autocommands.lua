vim.cmd [[
  augroup _line_number
    " 当前窗口用相对行号，其他窗口绝对行号
    autocmd WinEnter * if &number | execute("setlocal number relativenumber") | endif
    autocmd WinLeave * if &number | execute("setlocal number norelativenumber") | endif
    " 插入模式下用绝对行号, 普通模式下用相对
    autocmd InsertEnter * :setlocal norelativenumber number
    autocmd InsertLeave * :setlocal relativenumber number
  augroup
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
