return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "jose-elias-alvarez/typescript.nvim",
    init = function()
      require("lazyvim.util").lsp.on_attach(function(_, buffer)
                    -- stylua: ignore
                    vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
        vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
      end)
    end,
  },
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- ts_ls will be automatically installed with mason and loaded with lspconfig
      ts_ls = {},
      texlab = {},
      pyright = {
        settings = {
          autoImportCompletion = true,
          disableOrganiseImports = true,
          tabWidth = 4,
        },
        python = {
          analysis = {
            ignore = { "*" },
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
              ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
              ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
              ["http://json.schemastore.org/semantic-release"] = ".releaserc{,.json}",
              ["https://json.schemastore.org/jfrog-pipelines.json"] = "{,.}pipelines*.{yml,yaml}",
              ["https://json.schemastore.org/pre-commit-config.json"] = ".pre-commit-config.{yml,yaml}",
              ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "openapi.{yml,yaml}",
              ["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/dbt_project.json"] = "dbt_project.{yml,yaml}",
              ["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/dbt_yml_files.json"] = "schema.{yml,yaml}",
              ["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/selectors.json"] = "selectors.{yml,yaml}",
              ["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/packages.json"] = "packages.{yml,yaml}",
              ["https://json.schemastore.org/circleciconfig.json"] = ".circleci/*.{yml,yaml}",
            },
          },
        },
      },
      ["rust_analyzer"] = {
        settings = {
          imports = {
            granularity = {
              group = "module",
            },
            prefix = "self",
          },
          cargo = {
            buildScripts = {
              enable = true,
            },
          },
          procMacro = {
            enable = true,
          },
        },
      },
      terraformls = {},
      jsonls = {},
      -- suricatals = {
      --     default_config = {
      --         cmd = { "suricata-language-server" },
      --         filetypes = { "suricata", "hog" },
      --         root_dir = function(fname)
      --             return require("lspconfig").util.find_git_ancestor(fname)
      --         end,
      --         single_file_support = true,
      --         settings = {},
      --     },
      -- },
      ruff = {
        settings = {
          -- Ruff language server settings go here
        },
      },
    },
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      -- example to setup with typescript.nvim
      ts_ls = function(_, opts)
        require("typescript").setup({ server = opts })
        return true
      end,
      ["ruff-lsp"] = function(_, opts)
        require("ruff_lsp").setup({ server = opts })
        return true
      end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
  },
}
