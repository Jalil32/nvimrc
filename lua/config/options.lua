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

		-- vscode style for nvimcmp
		-- gray
		vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
		-- blue
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
		-- light blue
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
		vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
		vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
		-- pink
		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
		vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
		-- front
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
		vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
		vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- Set colors for TMUX
vim.o.termguicolors = true

-- Disable legacy sqlcomplete
vim.g.omni_sql_default_compl_type = "syntax"

-- Stop auto comment on next line
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

vim.g.omni_sql_no_default_maps = 1

-- Enable diagnostics
vim.diagnostic.config({
	virtual_text = true, -- Show virtual text for diagnostics
	signs = true, -- Show diagnostic signs (error, warning, etc.)
	underline = true, -- Underline the lines with errors
	update_in_insert = true, -- Update diagnostics while typing
})
