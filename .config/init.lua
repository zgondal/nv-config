vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    lock = true,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    lock = true,
    opts = {
      -- add any opts here
      -- for example
      provider = "openrouter_r1",
      vendors = {
        groq_r1_llama = {
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          -- api_key = os.getenv("GROQ_API_KEY"),
          endpoint = "https://api.groq.com/openai/v1/",
          timeout = 10000,
          temperature = 0,
          max_tokens = 4096,
          model = "deepseek-r1-distill-llama-70b",
        },
        groq_qwen_coder = {
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          -- api_key = os.getenv("GROQ_API_KEY"),
          endpoint = "https://api.groq.com/openai/v1/",
          timeout = 10000,
          temperature = 0,
          max_tokens = 5000,
          model = "qwen-2.5-coder-32b",
          --model = "deepseek-r1-distill-qwen-32b",
          -- model = "deepseek-r1-distill-llama-70b",
          },
        groq_r1_qwen = {
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          -- api_key = os.getenv("GROQ_API_KEY"),
          endpoint = "https://api.groq.com/openai/v1/",
          timeout = 10000,
          temperature = 0,
          max_tokens = 5000,
          -- model = "qwen-2.5-coder-32b",
          model = "deepseek-r1-distill-qwen-32b",
          -- model = "deepseek-r1-distill-llama-70b",
        },
        openrouter_qwen_qwq = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          api_key = os.getenv("OPENROUTER_API_KEY"),
          endpoint = "https://openrouter.ai/api/v1/",
          timeout = 10000,
          temperature = 0,
          max_tokens = 5000,
          model = "qwen/qwq-32b:free",
          disable_tools = { "code_runner", "file_selector", "git_diff", "git_status", "history", "image_paste", "repo_map", "search", "spell_check", "terminal", "text_diff", "web_search" },
        },
        openrouter_qwen_coder = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          api_key = os.getenv("OPENROUTER_API_KEY"),
          endpoint = "https://openrouter.ai/api/v1/",
          timeout = 10000,
          temperature = 0,
          max_tokens = 5000,
          model = "qwen/qwen-2.5-coder-32b-instruct:free",
          disable_tools = { "code_runner", "file_selector", "git_diff", "git_status", "history", "image_paste", "repo_map", "search", "spell_check", "terminal", "text_diff", "web_search" },
        },
        openrouter_r1_qwen = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          api_key = os.getenv("OPENROUTER_API_KEY"),
          endpoint = "https://openrouter.ai/api/v1/",
          timeout = 10000,
          temperature = 0,
          max_tokens = 5000,
          model = "deepseek/deepseek-r1-distill-qwen-32b:free",
          disable_tools = { "code_runner", "file_selector", "git_diff", "git_status", "history", "image_paste", "repo_map", "search", "spell_check", "terminal", "text_diff", "web_search" },
        },
        openrouter_r1 = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          api_key = os.getenv("OPENROUTER_API_KEY"),
          endpoint = "https://openrouter.ai/api/v1/",
          timeout = 10000,
          temperature = 0,
          -- max_tokens = 5000,
          model = "deepseek/deepseek-r1:free",
          disable_tools = { "code_runner", "file_selector", "git_diff", "git_status", "history", "image_paste", "repo_map", "search", "spell_check", "terminal", "text_diff", "web_search" },
        },
        openrouter_olympicCoder = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          api_key = os.getenv("OPENROUTER_API_KEY"),
          endpoint = "https://openrouter.ai/api/v1/",
          timeout = 10000,
          temperature = 0,
          -- max_tokens = 5000,
          model = "open-r1/olympiccoder-32b:free",
          disable_tools = { "code_runner", "file_selector", "git_diff", "git_status", "history", "image_paste", "repo_map", "search", "spell_check", "terminal", "text_diff", "web_search" },
        },
      }
    },
      -- -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        -- build = ":TSUpdate",
        config = function()
          require("nvim-treesitter.configs").setup({
            ensure_installed = {
               "markdown",
               "toml",
               "json",
               "yaml",
               "python",
               "rust",
               "java",
               "typescript",
               "javascript",
               "tsx",
               "html",
               "css",
               "svelte",
               "graphql",
               "solidity",
               "dockerfile",
               "bash",
               "c",
               "cpp",
               "go",
               "lua",
               "rust",
               "scss",
               "sql",
               "vim",
               "vue",
               "xml",
              },
            highlight = {enable = true},
            indent = {enable = true},
            fold = {enable = true},
          })
        end,
      },
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    lazy = false,
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
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
          "postgres",        -- For postgres
          "svelte",          -- For svelte
          "graphql",         -- For graphql
          "tailwindcss",     -- For tailwindcss
          "solidity",        -- For solidity
          "efm",             -- For efm
        }
      })
    end
  },
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = true,
  },
  {
    "CRAG666/code_runner.nvim",
    lazy = false,
    config = function()
      require("code_runner").setup({
        filetype = {
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt"
        },
        python = "python3 -u",
        typescript = "deno run",
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt"
        },
        c = function(...)
          c_base = {
            "cd $dir &&",
            "gcc $fileName -o",
            "/tmp/$fileNameWithoutExt",
          }
          local c_exec = {
            "&& /tmp/$fileNameWithoutExt &&",
            "rm /tmp/$fileNameWithoutExt",
          }
          vim.ui.input({ prompt = "Add more args:" }, function(input)
            c_base[4] = input
            vim.print(vim.tbl_extend("force", c_base, c_exec))
            require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
          end)
        end,
      },
    })
      vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
    end
  },
  {
    "arnamak/stay-centered.nvim",
    lazy = false,
    config = function()
      require("stay-centered").setup({
        -- The default is to stay centered when the cursor moves to a new line.
        -- If you want to stay centered when the cursor moves to a new window,
        -- set this to true.
        stay_centered_on_new_window = false,
      })
    end
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      -- default options here
      suppressed_dirs = { '~/', '~/Downloads' },
      -- log_level = 'debug',
      sessionoptions = { "buffers", "curdir", "folds", "help", "tabpages", "winsize", "winpos", "terminal", "options" },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    lazy = false,
    priority = 1000,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 1000,
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   main = "ibl",
  --   ---@module "ibl"
  --   ---@type ibl.config
  --   config = function()
  --     local highlight = {
  --       "RainbowRed",
  --       "RainbowYellow",
  --       "RainbowBlue",
  --       "RainbowOrange",
  --       "RainbowGreen",
  --       "RainbowViolet",
  --       "RainbowCyan",
  --     }
  --     local hooks = require "ibl.hooks"
  --     -- create the highlight groups in the highlight setup hook, so they are reset
  --     -- every time the colorscheme changes
  --     hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  --       vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  --       vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  --       vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  --       vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  --       vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  --       vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  --       vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  --     end)
  --
  --     vim.g.rainbow_delimiters = { highlight = highlight }
  --     require("ibl").setup { scope = { highlight = highlight } }
  --
  --     hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  --   end
  -- },
  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

-- enable code folding
vim.opt.foldmethod = "expr"
-- vim.opt.foldmethod = "syntax" -- use the syntax folding method
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- use the nvim-treesitter folding function
vim.opt.foldlevel = 99
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.schedule(function()
  require "mappings"
end)
