return {
	-- debug adapter protocol client
	{
		'mfussenegger/nvim-dap',
		lazy = true,
keys = {
    { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
    { '<leader>di', function() require('dap').step_into() end, desc = 'Step Into' },
    { '<leader>do', function() require('dap').step_out() end, desc = 'Step Out' },
    { '<leader>dO', function() require('dap').step_over() end, desc = 'Step Over' },
    { '<leader>dj', function() require('dap').down() end, desc = 'Down' },
    { '<leader>dk', function() require('dap').up() end, desc = 'Up' },
    { '<leader>dp', function() require('dap').pause() end, desc = 'Pause' },
    { '<leader>dc', function() require('dap').continue() end, desc = 'Continue' },
    { '<leader>dl', function() require('dap').run_last() end, desc = 'Run Last' },
    { '<leader>dC', function() require('dap').run_to_cursor() end, desc = 'Run to Cursor' },
    { '<leader>dt', function() require('dap').terminate() end, desc = 'Terminate' },
    { '<leader>ds', function() require('dap').session() end, desc = 'Session' },
    { '<leader>dr', function() require('dap').repl.toggle() end, desc = 'Toggle REPL' },
    { '<leader>dw', function() require('dap.ui.widgets').hover() end, desc = 'Widgets' },
},
		config = function()
			local icon_map = {
				Breakpoint = { ' ' },
				BreakpointCondition = { ' ' },
				BreakpointRejected = { ' ', 'DiagnosticError' },
				LogPoint = { ' ' },
				Stopped = { '󰁕 ', 'DiagnosticWarn', 'DapStoppedLine' },
			}

			-- stylua: ignore
			vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual' })

			for name, sign in pairs(icon_map) do
				vim.fn.sign_define('Dap' .. name, {
					text = sign[1],
					texthl = sign[2] or 'DiagnosticInfo',
					linehl = sign[3],
					numhl = sign[3],
				})
			end

			-- setup adapter and config for specific language
			local dap = require('dap')
			dap.adapters.python = {
				type = 'executable',
				command = '/usr/bin/python',
				args = { '-m', 'debugpy.adapter' },
			}
			dap.configurations.python = {
				{
					-- required by nvim-dap
					type = 'python',
					request = 'launch',
					name = 'Launch file',

					-- options below are for debugpy
					program = '${file}',
					pythonPath = 	function()
          return '/usr/bin/python'		
      end},
			}


dap.adapters.cppdbg = {
    id = "cppdbg",
    type = 'executable',
    command = "/home/ocean/.local/share/nvim/mason/bin/OpenDebugAD7",
}
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,

        cwd = "${workspaceFolder}",
        stopAtEntry = true,
    },
}
dap.configurations.c = dap.configurations.cpp

		end,
	},

	-- fancy UI for the debugger
	{
		'rcarriga/nvim-dap-ui',
		lazy = true,
		keys = 
 {
    { '<leader>du', function() require('dapui').toggle() end, desc = 'Dap UI' },
    { '<leader>de', function() require('dapui').eval() end, desc = 'Eval' },
},

		config = function(_, opts)
			local dap, dapui = require('dap'), require('dapui')
			dapui.setup(opts)
			dap.listeners.after.event_initialized['dapui_config'] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated['dapui_config'] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited['dapui_config'] = function()
				dapui.close()
			end
		end,
		dependencies = {
			'mfussenegger/nvim-dap',
			'theHamsta/nvim-dap-virtual-text',
		},
	},

	-- dap virtual text support
	{
		'theHamsta/nvim-dap-virtual-text',
		lazy = true,
		opts = {},
	},
}
