-- -- ~/.config/nvim/lua/plugins/copilot.lua
-- return {
--   "github/copilot.vim",
--   cmd = "Copilot",
--   event = "InsertEnter",
-- }

-- ~/.config/nvim/lua/plugins/copilot.lua
return {
  "github/copilot.vim",
  cmd = "Copilot",
  -- Altere 'InsertEnter' para 'VimEnter' para carregar na inicialização do Neovim
  event = "VimEnter",
}