-- ~/.config/nvim/lua/plugins/user.lua

-- Você pode adicionar ou configurar plugins criando arquivos nesta pasta `plugins/`
-- POR FAVOR, REMOVA OS EXEMPLOS QUE VOCÊ NÃO TEM INTERESSE ANTES DE ATIVAR ESTE ARQUIVO
-- Aqui estão alguns exemplos:

return {
  -- == Exemplos de Sobrescrever Plugins ==

  -- personalizar opções do dashboard
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
                   " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██  ██   ██  ██",
            "███████ ███████    ██    ██████   ██  ██",
            "██   ██      ██    ██    ██  ██   ██  ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██   ██ ██  █████  ██",
            "████   ██ ██   ██ ██  ██  ██  ██",
            "██ ██  ██ ██   ██ ██  ██   ██ ██",
            "██  ██ ██  ██ ██  ██  ██    ████",
            "██   ████   ███   ██  ██    ██",
          }, "\n"),
        },
      },
    },
  },

  -- Você pode desabilitar plugins padrão da seguinte forma:
  { "max397574/better-escape.nvim", enabled = false },

  -- Você também pode personalizar facilmente a configuração adicional de plugins que está fora da chamada de configuração do plugin
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- inclui a configuração padrão do astronvim que chama a função de configuração
      -- adicione mais configurações personalizadas do luasnip, como extensão de tipo de arquivo ou snippets personalizados
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- inclui a configuração padrão do astronvim que chama a função de configuração
      -- adicione mais configurações personalizadas do autopairs, como regras personalizadas
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- não adicione um par se o próximo caractere for %
            :with_pair(cond.not_after_regex "%%")
            -- não adicione um par se o caractere anterior for xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- não mova para a direita quando repetir o caractere
            :with_move(cond.none())
            -- não exclua se o próximo caractere for xx
            :with_del(cond.not_after_regex "xx")
            -- desabilite a adição de uma nova linha ao pressionar <cr>
            :with_cr(cond.none()),
        },
        -- desabilitar para arquivos .vim, mas funciona para outros tipos de arquivo
        Rule("a", "a", "-vim")
      )
    end,
  },
}