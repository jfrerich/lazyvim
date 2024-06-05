return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      perlnavigator = {},
    },
    setup = {
      perlnavigator = function(_, opts)
        require("lspconfig").perlnavigator.setup({
          cmd = { "perlnavigator" },
          settings = {
            perlnavigator = {
              perlPath = "perl",
              enableWarnings = true,
              -- perltidyProfile = "",
              perlcriticProfile = "$workspaceFolder/.perlcriticrc",
              perlcriticEnabled = true,
              perlimportsLintEnabled = true,
              perlimportsTidyEnabled = true,
            },
          },
        })
        return true
      end,
    },
  },
}
