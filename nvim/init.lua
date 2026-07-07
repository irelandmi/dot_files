-- ==========================================
-- ALT KEYBINDINGS (Left Thumb on Kinesis)
-- ==========================================

-- Normal Mode: Move current line down or up
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = "Move line down", silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = "Move line up", silent = true })

-- Visual Mode: Move highlighted text block down or up
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = "Move block down", silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = "Move block up", silent = true })

-- Insert Mode: Move current line down or up (optional, but handy)
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { desc = "Move line down", silent = true })
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { desc = "Move line up", silent = true })

-- Set <space> as the leader key (must happen before plugins are loaded)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line numbers
vim.opt.number = true         -- Show absolute line number
vim.opt.relativenumber = true -- Show relative numbers (great for jumping with j/k)
-- This creates a custom margin: [Absolute] [Relative]
vim.opt.statuscolumn = "%=%l %r "

-- Search
vim.opt.ignorecase = true     -- Ignore case when searching...
vim.opt.smartcase = true      -- ...unless you type a capital letter
vim.opt.hlsearch = false      -- Don't keep search terms highlighted forever

-- Indentation (Standard 4 spaces, adjust to 2 if you prefer)
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.shiftwidth = 4        -- The number of spaces inserted for each indentation
vim.opt.tabstop = 4           -- Insert 4 spaces for a tab

-- Quality of Life
vim.opt.clipboard = 'unnamedplus' -- Sync Neovim clipboard with macOS/Linux system clipboard
vim.opt.undofile = true           -- Save undo history even after closing a file
vim.opt.scrolloff = 8             -- Keep 8 lines of context above/below the cursor
vim.opt.updatetime = 250          -- Decrease update time for faster completion/UI updates
vim.opt.termguicolors = true      -- Enable 24-bit RGB colors


