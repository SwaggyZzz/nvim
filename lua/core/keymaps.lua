local utils = require "core.utils"

local map = utils.map
local nmap = utils.nmap
local imap = utils.imap

local cmd = vim.cmd

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local M = {}

M.init = function()
   ---------------------- Leader ---------------------------

   map("", "<Space>", "<Nop>")
   vim.g.mapleader = " "
   vim.g.maplocalleader = " "

   -----------------------------------------------------------
   -- Don't copy the replaced text after pasting in visual mode
   map("v", "p", "p:let @+=@0<CR>")

   -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
   -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
   -- empty mode is same as using :map
   -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
   map({"n", "x", "o"}, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
   map({"n", "x", "o"}, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
   map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
   map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

   -- use ESC to turn off search highlighting
   -- map("n", "<Esc>", ":noh <CR>")

   -- yank from current cursor to end of line
   map("n", "Y", "yg$")

   -- don't yank text on cut ( x )
   map({ "n", "v" }, "x", '"_x')

   -- don't yank text on delete ( dd )
   map({ "n", "v" }, "d", '"_d')

   -------------------- Editor -----------------------
   nmap("H", "^")
   nmap("L", "$")

   -- 上下滚动浏览
   nmap("J", "5j")
   nmap("K", "5k")
   -- ctrl u / ctrl + d  只移动9行，默认移动半屏
   nmap("<C-u>", "10k")
   nmap("<C-d>", "10j")

   nmap("<A-s>", ":w! <CR>")
   imap("<A-s>", "<ESC>:w! <CR>")
   nmap("<A-q>", ":q <CR>")
   -- Close Buffer
   nmap("<A-w>", "<cmd>Bdelete!<CR>")
   -- Copy whole file content
   nmap("<C-y>", ":%y+ <CR>")
   -- Move text up and down
   map("v", "<A-j>", ":m .+1<CR>==")
   map("v", "<A-k>", ":m .-2<CR>==")
   map("x", "<A-j>", ":move '>+1<CR>gv-gv")
   map("x", "<A-k>", ":move '<-2<CR>gv-gv")
   -- 缩进
   map("v", "<", "<gv")
   map("v", ">", ">gv")


   -- map("v", "p", '"_dP')
   -- 命令行下 Ctrl+j/k  上一个下一个
   -- map("c", "<C-j>", "<C-n>")
   -- map("c", "<C-k>", "<C-p>")

   ----------------- Navigation ----------------------------
   -- navigation within insert mode
   imap("<A-h>", "<Left>")
   imap("<A-l>", "<Right>")
   imap("<A-k>", "<Up>")
   imap("<A-j>", "<Down>")
   imap("<A-S-l>", "<End>")
   imap("<A-S-h>", "<ESC>^i")

   -- easier navigation between windows
   nmap("<A-h>", "<C-w>h")
   nmap("<A-j>", "<C-w>j")
   nmap("<A-k>", "<C-w>k")
   nmap("<A-l>", "<C-w>l")

   ------------ Windows ----------------------------
   -- 分屏
   nmap("sv", ":vsp<CR>")
   nmap("sh", ":sp<CR>")
   -- 关闭当前
   nmap("sc", "<C-w>c")
   -- 关闭其他
   nmap("so", "<C-w>o") -- close others
   -- 相等比例
   nmap("s=", "<C-w>=")
   -- Resize with arrows
   nmap("<S-Up>", ":resize -2<CR>")
   nmap("<S-Down>", ":resize +2<CR>")
   nmap("<S-Left>", ":vertical resize -2<CR>")
   nmap("<S-Right>", ":vertical resize +2<CR>")

   ----------------------- Packer  -----------------
   nmap("<leader>ps", ":PackerSync <CR>")
   nmap("<leader>pc", ":PackerCompile <CR>")
   nmap("<leader>pi", ":PackerInstall <CR>")
   -- Add Packer commands because we are not loading it at startup
   cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
   cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
   cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
   cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
   cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
   cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"
end

------------------------ Plugins Keymaps --------------------------------------------

M.bufferline_setup = function()
   nmap("<C-l>", ":BufferLineCycleNext <CR>")
   nmap("<C-h>", ":BufferLineCyclePrev <CR>")
end

M.comment_setup = function()
   nmap("<A-/>", ":lua require('Comment.api').toggle_current_linewise()<CR>")
   map("v", "<A-/>", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")
end

M.lspconfig_setup = function()
   nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
   nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
   nmap("gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
   nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
   nmap("gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
   nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
   nmap("<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
   nmap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
   nmap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
   nmap("gf", "<cmd>lua vim.diagnostic.open_float()<CR>")
   nmap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
   nmap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
   nmap("gsl", "<cmd>lua vim.diagnostic.setloclist()<CR>")
   nmap("<A-S-f>", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

M.nvimtree_setup = function()
   nmap("<C-n>", ":NvimTreeToggle <CR>")
end

M.telescope_setup = function()
   nmap("<leader>fb", ":Telescope buffers <CR>")
   nmap("<leader>ff", ":Telescope find_files <CR>")
   nmap("<leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true <CR>")
   nmap("<leader>gm", ":Telescope git_commits <CR>")
   nmap("<leader>gs", ":Telescope git_status <CR>")
   nmap("<leader>fh", ":Telescope help_tags <CR>")
   nmap("<leader>fw", ":Telescope live_grep <CR>")
   nmap("<leader>fo", ":Telescope oldfiles <CR>")
end
M.telescope = {
   -- 历史记录
   cycle_history_next = "<C-j>",
   cycle_history_prev = "<C-k>",
   -- 上下移动
   move_selection_next = "<C-n>",
   move_selection_previous = "<C-p>",

   close = "<C-c>",
   n_close = "<esc>",

   select_default = "<CR>",
   select_horizontal = "<C-x>",
   select_vertical = "<C-v>",

   preview_scrolling_up = "<C-u>",
   preview_scrolling_down = "<C-d>",

   move_to_top = "H",
   move_to_middle = "M",
   move_to_bottom = "L",

   move_to_top_gg = "gg",
   move_to_bottom_G = "G",
}
M.cmp = {
   select_prev_item  = "<C-k>",
   select_next_item  = "<C-j>",
   scroll_docs_up  = "<C-b>",
   scroll_docs_down  = "<C-f>",
   show_complete = "<C-Space>",
   disbale = "<C-y>",
   close = "<C-e>",
   select = "<CR>",
}
M.hop_setup = function()
   nmap("<leader>w", ":<C-u>HopWord<CR>")
   nmap("<leader>l", ":<C-u>HopLine<CR>")
   nmap("<leader>c", ":<C-u>HopChar1<CR>")
   nmap("<leader>ccs", ":<C-u>HopChar2<CR>")
end
M.terminal = {
   toggle = [[<c-\>]],
   close  = "<esc>",
   quit_insert = "jk",
   up  = "<C-k>",
   down  = "<C-j>",
   left  = "<C-h>",
   right  = "<C-l>",
}
M.renamer_setup = function()
   nmap("<leader>rn", '<cmd>lua require("renamer").rename()<cr>')
   map("v", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>')
end

return M
