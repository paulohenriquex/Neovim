-- ~/.config/nvim/init.lua -- Este é o arquivo principal de inicialização

-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })

  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)
-- validate that lazy is available

if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- Aqui você chama seus arquivos de configuração diretamente, sem a chave '{' extra
require "lazy_setup"
require "polish"

-- Keymaps personalizados

-- Atalho para salvar com Ctrl + s
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

vim.keymap.set("n", "<C-Up>", ":m .-2<CR>==")
vim.keymap.set("n", "<C-Down>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-Down>", ":m .+1<CR>==") -- Esta linha está duplicada. Pode remover uma.

-- Adicionar comentário
vim.keymap.set("n", "<leader>;", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comentário na linha" })

vim.keymap.set("v", "<leader>;", function()
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comentário na seleção" })

-- Fechar a aba atual
vim.keymap.set("n", "<C-w>", "<cmd>bd<CR>", { desc = "Fechar buffer atual" })

-- Fechar nvim
vim.keymap.set("n", "<C-q>", "<cmd>qa<CR>", { desc = "Fechar Neovim" })

-- Pesquisar no arquivo
vim.keymap.set("n", "<C-f>", "/", { desc = "Pesquisar no arquivo" })

-- Selecionar tudo
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Selecionar tudo" })

-- Copiar
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copiar para clipboard do sistema" })
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Colar do clipboard" })
vim.keymap.set("i", "<C-v>", '<C-R>+', { desc = "Colar do clipboard" })


-- vim.cmd.colorscheme "catppuccin"
vim.cmd.colorscheme "dracula"
vim.opt.swapfile = false
vim.opt.relativenumber = false

