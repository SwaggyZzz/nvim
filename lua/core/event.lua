local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command("augroup END")
	end
end

function autocmd.load_autocmds()
	local definitions = {
		packer = {},
		bufs = {},
		wins = {
			-- Highlight current line only on focused window
			{
				"WinEnter,BufEnter,InsertLeave",
				"*",
				[[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]],
			},
		},
		ft = {},
		yank = {},
    line_number = {
      -- 当前窗口用相对行号，其他窗口绝对行号
      {
        "WinEnter",
        "*",
        [[if &number | execute("setlocal number relativenumber") | endif]]
      },
      {
        "WinLeave",
        "*",
        [[if &number | execute("setlocal number norelativenumber") | endif]]
      },
      -- 插入模式下用绝对行号, 普通模式下用相对行号
      {
        "InsertEnter",
        "*",
        [[:setlocal norelativenumber number]]
      },
      {
        "InsertLeave",
        "*",
        [[:setlocal relativenumber number]]
      }
    },
	}

	autocmd.nvim_create_augroups(definitions)
end

vim.api.nvim_command("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

autocmd.load_autocmds()

