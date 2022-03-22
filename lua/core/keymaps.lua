local utils = require "core.utils"

local map = utils.map
local nmap = utils.nmap
local imap = utils.imap

local term_opts = { silent = true }

--Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
nmap("˙", "<C-w>h")
nmap("∆", "<C-w>j")
nmap("˚", "<C-w>k")
nmap("¬", "<C-w>l")

-- windows 分屏快捷键
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

-- Close Buffer
nmap("<C-w>", "<cmd>Bdelete!<CR>")
-- Copy whole file content
nmap("<C-a>", ":%y+ <CR>")

-- Navigate buffers
-- nmap("<S-l>", ":bnext<CR>")
-- nmap("<S-h>", ":bprevious<CR>")

-- Move text up and down
-- nmap("∆", "<Esc>:m .+1<CR>==gi") -- <A-j>
-- nmap("˚", "<Esc>:m .-2<CR>==gi") -- <A-k>

-- use ESC to turn off search highlighting
nmap("<Esc>", ":noh <CR>")
-- yank from current cursor to end of line
nmap("Y", "yg$")

nmap("<C-s>", ":w! <CR>")
nmap("<C-q>", ":q <CR>")

nmap("H", "^")
nmap("L", "$")

-- 上下滚动浏览
nmap("J", "4j")
nmap("K", "4k")
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
nmap("<C-u>", "9k")
nmap("<C-d>", "9j")

-- Pakcer --
nmap("<leader>ps", ":PackerSync <CR>")
nmap("<leader>pc", ":PackerCompile <CR>")
nmap("<leader>pi", ":PackerInstall <CR>")

-- Insert --
-- navigation within insert mode
imap("<C-h>", "<Left>")
imap("<C-l>", "<Right>")
imap("<C-k>", "<Up>")
imap("<C-j>", "<Down>")
imap("<C-e>", "<End>")
imap("<C-a>", "<ESC>^i")

imap("<C-s>", "<ESC>:w! <CR>")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "∆", ":m .+1<CR>==") -- <A-j>
map("v", "˚", ":m .-2<CR>==") -- <A-k>
map("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "∆", ":move '>+1<CR>gv-gv") -- <A-j>
map("x", "˚", ":move '<-2<CR>gv-gv") -- <A-k>

-- Command --
-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>")
map("c", "<C-k>", "<C-p>")

