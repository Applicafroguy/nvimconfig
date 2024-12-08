local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			rust = { "leptosfmt", "rustfmt" },
			javascript = prettier,
			typescript = prettier,
			javascriptreact = prettier,
			typescriptreact = prettier,
			css = prettier,
			scss = prettier,
			graphql = prettier,
			html = prettier,
			json = { "prettierd", "prettier", "jq", stop_after_first = true },
			json5 = prettier,
			jsonc = prettier,
			yaml = prettier,
			-- Use a sub-list to run only the first available formatter
			php = { "php-cs-fixer" },
			markdown = function(bufnr)
				return { first(bufnr, "prettierd", "prettier"), "injected" }
			end,
			blade = { "blade-formatter" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters = {
			["php-cs-fixer"] = {
				command = "php-cs-fixer",
				args = {
					"fix",
					"--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
					"$FILENAME",
				},
				stdin = false,
			},
			injected = {
				options = {
					lang_to_formatters = {
						html = {},
					},
				},
			},
			-- Dealing with old version of prettierd that doesn't support range formatting
			prettierd = {
				---@diagnostic disable-next-line: assign-type-mismatch
				range_args = false,
			},
		},
		notify_on_error = true,
	},
}
