return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "prettier", -- prettier formatter
      "stylua", -- lua formatter
      "isort", -- python formatter
      "black", -- python formatter
      "pylint",
      "eslint_d",
      "golangci-lint", -- go linter
    },
  },
}
