-- General Vim Settings
vim.opt.shortmess:append({ I = true }) -- Disable Intro
vim.g.mapleader = " "

-- Tabsettings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Statuscolumn
vim.cmd("highlight LineNr ctermfg=grey")
vim.wo.relativenumber = true
vim.opt.statuscolumn = "   %r   "

-- Vim Keybindings for switching between splits
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", {})
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", {})
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", {})
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", {})

-- Buffer Commands
vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>", {})
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", {})
vim.keymap.set("n", "<C-b>", "<cmd>bdel<CR>", {})

-- Escape Terminal Mode
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", {})

-- LAZYNVIM
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load Plugins
require("lazy").setup("plugins")
