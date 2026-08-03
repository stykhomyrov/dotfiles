return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    -- Installs language servers and enables them automatically.
    -- Add "clangd" to ensure_installed for C/C++ later.
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "gopls", "pyright" },
    },
  },
}
