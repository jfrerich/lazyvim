return {
  -- Add `pyright` to mason
  -- TODO: check following tools -> mypy types-requests types-docutils
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "pyright", -- static type checker
        "black", -- formatter
        "ruff", -- linter and formatter
        -- "mypy",
      })
    end,
  },
  -- Setup adapters as nvim-dap dependencies
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
        { "<leader>dPc", function() require('dap-python').test_class() end,  desc = "Debug Class" },
      },
      config = function()
        local path = require("mason-registry").get_package("debugpy"):get_install_path()
        require("dap-python").setup(path .. "/venv/bin/python")
      end,
    },
  },

  -- Add `python` debugger to mason DAP to auto-install
  -- Not absolutely necessary to declare adapter in `ensure_installed`, since `mason-nvim-dap`
  -- has `automatic-install = true` in LazyVim by default and it automatically installs adapters
  -- that are are set up (via dap) but not yet installed. Might as well skip the lines below as
  -- a whole.

  -- Add which-key namespace for Python debugging
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        ["<leader>dP"] = { name = "+Python" },
      },
    },
  },

  -- Add `server` and setup lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      servers = {
        -- pyright = {},
        -- pylsp = {
        --   mason = false,
        --   settings = {
        --     pylsp = {
        --       plugins = {
        --         rope_autoimport = {
        --           enabled = true,
        --         },
        --       },
        --     },
        --   },
        -- },
        -- ruff_lsp = {
        --   handlers = {
        --     ["textDocument/publishDiagnostics"] = function() end,
        --   },
        -- },
        -- jedi_language_server = {},
      },
      setup = {
        -- pylsp = function()
        --   LazyVim.lsp.on_attach(function(client, _)
        --     if client.name == "pylsp" then
        --       -- disable hover in favor of jedi-language-server
        --       client.server_capabilities.hoverProvider = false
        --     end
        --   end)
        -- end,
        -- ruff_lsp = function()
        --   require("lazyvim.util").lsp.on_attach(function(client, _)
        --     if client.name == "ruff_lsp" then
        --       -- Disable hover in favor of Pyright
        --       client.server_capabilities.hoverProvider = false
        --     end
        --   end)
        -- end,
        -- pyright = function()
        --   require("lazyvim.util").lsp.on_attach(function(client, _)
        --     if client.name == "pyright" then
        --       -- disable hover in favor of jedi-language-server
        --       -- client.server_capabilities.hoverProvider = false
        --     end
        --   end)
        -- end,
      },
    },
  },

  -- Setup up format with new `conform.nvim`
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = {
          "black",
        },
      },
      stop_after_first = true, -- Ensures only the first formatter runs
    },
  },

  -- For selecting virtual envs
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    cmd = "VenvSelect",
    opts = {
      dap_enabled = true,
    },
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
}
