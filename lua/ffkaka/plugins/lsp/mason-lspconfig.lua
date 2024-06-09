return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "tsserver",
      "html",
      "cssls",
      "tailwindcss",
      "svelte",
      "lua_ls",
      "graphql",
      "emmet_ls",
      "prismals",
      "pyright",
      "jdtls", -- java language server
      "gopls", -- go language server
    },
  },
}
