-- Basic options
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.background="dark"
vim.opt.completeopt = { "menuone", "noinsert", "popup" }

vim.cmd.colorscheme("habamax")

-- Diagnostics: show messages as virtual text, no fancy UI
vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
})

-- Native LSP completion (NeoVim 0.11+), no completion plugin needed
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Go convention: organize imports and format on save (via gopls)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local client = vim.lsp.get_clients({ bufnr = 0, name = "gopls" })[1]
    if not client then
      return
    end
    local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 2000)
    for _, res in pairs(result or {}) do
      for _, action in pairs(res.result or {}) do
        if action.edit then
          vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
        end
      end
    end
    vim.lsp.buf.format()
  end,
})

-- Spell checking for markdown and git commit messages
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim (loads all files in lua/plugins/)
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true, notify = false },
})
