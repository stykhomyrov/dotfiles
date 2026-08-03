return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "python", "go", "gomod", "gosum", "gotmpl", "html",
        "lua", "vim", "vimdoc",
        "markdown", "markdown_inline", "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
