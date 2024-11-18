return {
		"stevearc/conform.nvim",
		lazy = true,
config = function()

local conform = require("conform")

local formatters_by_ft = {
	lua = { "stylua" },
	-- Conform will run multiple formatters sequentially
	python = { "isort", "black" },
	rust = { "leptosfmt", "rustfmt" },
	-- Use a sub-list to run only the first available formatter
	javascript = { { "prettierd", "prettier" } },
	css = { { "prettierd", "prettier" } },
}

local format_on_save = {
	-- These options will be passed to conform.format()
	timeout_ms = 500,
	lsp_format = "fallback",
}

local formatters = {}

conform.setup({
	formatters_by_ft = formatters_by_ft,
	format_on_save = format_on_save,
	formatters = formatters,
})

  end
}
