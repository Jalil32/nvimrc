local opt = vim.opt

-- Line numbers
opt.nu = true
opt.relativenumber = true
opt.numberwidth = 2

-- Tabs and indentation
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Display
opt.wrap = false
opt.scrolloff = 20
opt.sidescrolloff = 8
opt.pumheight = 10
opt.cmdheight = 2
opt.showmode = false
opt.conceallevel = 0
opt.cursorline = false
opt.signcolumn = "yes"

-- Splits
opt.splitbelow = true
opt.splitright = true

-- System
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.fileencoding = "utf-8"
opt.swapfile = false
opt.undofile = true
opt.timeoutlen = 1000
opt.completeopt = "menuone,noselect"

-- Line wrapping behaviour
opt.whichwrap:append("b,s,<,>,[,],h,l")
opt.shortmess:append("c")
opt.guicursor = {
	"n-v-c:block-blinkon250-blinkoff250",
	"i-ci-ve:ver25-blinkon250-blinkoff250",
	"r-cr-o:hor20-blinkon250-blinkoff250",
}

-- Netrw
vim.g.netrw_banner = 0

-- Transparent background
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })

		-- Telescope
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
})
