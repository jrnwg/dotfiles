return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",

    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",

    "mfussenegger/nvim-dap-python",
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Debug: Start/Continue",
    },
    {
      "<leader>dsi",
      function()
        require("dap").step_into()
      end,
      desc = "Debug: Step Into",
    },
    {
      "<leader>ds",
      function()
        require("dap").step_over()
      end,
      desc = "Debug: Step Over",
    },
    {
      "<leader>dso",
      function()
        require("dap").step_out()
      end,
      desc = "Debug: Step Out",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Debug: Toggle Breakpoint",
    },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      desc = "Debug: Set Breakpoint",
    },
    {
      "<leader>dt",
      function()
        require("dapui").toggle()
      end,
      desc = "Debug: See last session result.",
    },
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    --@diagnostic disable-next-line: missing-fields
    require("mason-nvim-dap").setup {
      ensure_installed = {
        "debugpy",
      },
      automatic_installation = false,
    }

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    local project_root = vim.fn.getcwd()
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = project_root,
        pythonPath = project_root .. "/.venv/bin/python",
        env = {
          PYTHONPATH = project_root,
        },
      },
    }

    local dap_python = require "dap-python"
    dap_python.setup()
    dap_python.test_runner = "pytest"

    dap.adapters["local-lua"] = {
      type = "executable",
      command = "local-lua-dbg",
      enrich_config = function(config, on_config)
        if not config["extensionPath"] then
          local c = vim.deepcopy(config)
          -- 💀 If this is missing or wrong you'll see
          -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
          c.extensionPath = "/usr/lib/node_modules/local-lua-debugger-vscode"
          on_config(c)
        else
          on_config(config)
        end
      end,
    }
    dap.configurations.lua = {
      {
        name = "Current file (local-lua-dbg, lua)",
        type = "local-lua",
        request = "launch",
        cwd = "${workspaceFolder}",
        program = {
          lua = "lua5.1",
          file = "${file}",
        },
        args = {},
      },
    }
  end,
}
