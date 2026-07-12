return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "gopls", "pyright", "ts_ls", "lua_ls", "biome", "html" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local on_attach = function(client, bufnr)
				-- Let biome own formatting for the JS/TS family so it doesn't
				-- fight with ts_ls (biome adds semicolons by default).
				if client.name == "ts_ls" then
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end

				local map = function(keys, func)
					vim.keymap.set("n", keys, func, { buffer = bufnr })
				end
				map("gd", vim.lsp.buf.definition)
				map("gr", vim.lsp.buf.references)
				map("K", vim.lsp.buf.hover)
				map("<leader>rn", vim.lsp.buf.rename)
				map("<leader>ca", vim.lsp.buf.code_action)
				map("<leader>d", vim.diagnostic.open_float)
				map("<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client then
						on_attach(client, args.buf)
					end
				end,
			})

			vim.lsp.config("gopls", {})
			vim.lsp.config("pyright", {})
			vim.lsp.config("ts_ls", {})
			vim.lsp.config("biome", {
				-- Upstream only attaches biome when a biome.json is present.
				-- Attach for any JS/TS project instead so formatting (incl.
				-- semicolon insertion) works without one.
				root_dir = function(bufnr, on_dir)
					local util = require("lspconfig.util")
					local fname = vim.api.nvim_buf_get_name(bufnr)
					local root = util.root_pattern("package.json", "biome.json", "biome.jsonc", ".git")(fname)
					on_dir(root or vim.fn.getcwd())
				end,
			})
			vim.lsp.config("html", {})
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.enable({ "gopls", "pyright", "ts_ls", "lua_ls", "biome", "html" })
		end,
	},
}
