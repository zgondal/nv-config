-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "rust_analyzer",  -- For Rust
  "ts_ls",       -- For JavaScript/TypeScript
  "jdtls",          -- For Java
  "pyright",         -- For Python
  "bashls",          -- For bash
  "dockerls",        -- For docker
  "yamlls",          -- For yaml
  "jsonls",          -- For json
  "html",            -- For html
  "cssls",           -- For css
  "eslint",          -- For javascript
  "taplo",           -- For toml
  "sqlls",           -- For sql
  "svelte",          -- For svelte
  "graphql",         -- For graphql
  "tailwindcss",     -- For tailwindcss
  "solidity",        -- For solidity
  "efm",             -- For efm
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
