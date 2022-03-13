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
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Resize with arrows
nmap("<S-Up>", ":resize -2<CR>")
nmap("<S-Down>", ":resize +2<CR>")
nmap("<S-Left>", ":vertical resize -2<CR>")
nmap("<S-Right>", ":vertical resize +2<CR>")

-- Close Buffer
nmap("<leader>x", "<cmd>Bdelete!<CR>")
-- Copy whole file content
nmap("<C-a>", ":%y+ <CR>")

-- Navigate buffers
-- nmap("<S-l>", ":bnext<CR>")
-- nmap("<S-h>", ":bprevious<CR>")

-- Move text up and down
nmap("∆", "<Esc>:m .+1<CR>==gi") -- <A-j>
nmap("˚", "<Esc>:m .-2<CR>==gi") -- <A-k>

-- use ESC to turn off search highlighting
nmap("<Esc>", ":noh <CR>")
-- yank from current cursor to end of line
nmap("Y", "yg$")

nmap("<C-w>", ":w! <CR>")
nmap("<C-q>", ":q! <CR>")

-- Insert --
-- navigation within insert mode
imap("<C-h>", "<Left>")
imap("<C-l>", "<Right>")
imap("<C-k>", "<Up>")
imap("<C-j>", "<Down>")
imap("<C-e>", "<End>")
imap("<C-a>", "<ESC>^i")

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


-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

