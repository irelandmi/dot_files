vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

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
vim.opt.cursorline = true

-- This creates a custom margin: [Absolute] [Relative]
vim.opt.statuscolumn = "%s%=%l %r "

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

-----------------------------------
--- LSP config
-----------------------------------
-- native LSP config (Neovim 0.11+)
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".git" },
})
vim.lsp.enable("lua_ls")

-- turn on built-in completion when an LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })
    local buf = ev.buf
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = buf })
    vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { buffer = buf })
    vim.keymap.set("n", "grr", vim.lsp.buf.references, { buffer = buf })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf })
  end,
})

-- Plugins (Neovim 0.12 built-in manager)
vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/shortcuts/no-neck-pain.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" }
})

-- No Neck Pain
require("no-neck-pain").setup({
  width = 100,
  buffers = {
    scratchPad = {
      enabled = true,
      fileName = "notes",   -- saves to notes.md (or your chosen filetype)
    },
    bo = {
      filetype = "md",      -- treat the scratchpad as markdown
    },
  },
})
vim.keymap.set("n", "<leader>z", "<cmd>NoNeckPain<cr>", { desc = "Toggle centered view" })


-- Telescope (fuzzy finder)
require("telescope").setup({})
local tb = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", tb.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", tb.live_grep,  { desc = "Grep in files" })
vim.keymap.set("n", "<leader>fb", tb.buffers,    { desc = "Open buffers" })
vim.keymap.set("n", "<leader>fh", tb.help_tags,  { desc = "Help tags" })

-- Oil (file explorer)
require("oil").setup()
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

-- Tree Sitter
local want = { "python", "typescript", "javascript", "json", "yaml", "bash", "java", "python", "rust", "vim"}
local have = require("nvim-treesitter.config").get_installed()
local missing = vim.tbl_filter(function(p) return not vim.tbl_contains(have, p) end, want)
if #missing > 0 then require("nvim-treesitter").install(missing) end


