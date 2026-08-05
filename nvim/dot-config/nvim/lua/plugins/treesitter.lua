return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "python", "go", "gomod", "gosum", "gotmpl", "html",
      "lua", "vim", "vimdoc",
      "markdown", "markdown_inline", "yaml",
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "python", "go", "gomod", "gosum", "gotmpl", "html",
        "lua", "vim", "markdown", "yaml",
      },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
