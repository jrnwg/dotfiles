return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "pyright", "ruff" },
      }

      local function on_attach(client, bufnr)
        local opts = { buffer = bufnr, silent = true }

        -- Optional: disable formatting for ruff
        if client.name == "ruff" then
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.hoverProvider = false
        end

        -- Show diagnostic in float under cursor
        vim.keymap.set("n", "<leader>e", function()
          vim.diagnostic.open_float(nil, { focusable = false })
        end, vim.tbl_extend("force", opts, { desc = "Show line diagnostics" }))

        -- More LSP keymaps could go here if you want (hover, rename, etc.)
      end

      local lspconfig = require "lspconfig"
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              disable = { "missing-fields" },
            },
          },
        },
      }
      lspconfig.pyright.setup {
        on_attach = on_attach,
      }
      lspconfig.ruff.setup {
        on_attach = on_attach,
      }
    end,
  },
}
