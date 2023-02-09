local ok_dap, dap = pcall(require, "dap")
if not ok_dap then
	print("dap failed to load.")
	return
end
local ok_dapui, dapui = pcall(require, "dap")
if not ok_dapui then
	print("dap failed to load.")
	return
end

require("nvim-dap-virtual-text").setup()
require("dapui").setup()

-- NOTE: toggle debugging UI automaticli
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- NOTE: GO
require("dap-go").setup()

-- NOTE: C/C++/Rust

GetOS()
if GetOS() == "Windows" then
	-- Windows:
	dap.adapters.cppdbg = {
		id = "cppdbg",
		type = "executable",
		command = "C:\\absolute\\path\\to\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe",
		options = {
			detached = false,
		},
	}
elseif GetOS() == "Linux" then
	-- Linux:
	dap.adapters.cppdbg = {
		id = "cppdbg",
		type = "executable",
		command = "/absolute/path/to/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
	}
end

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
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}
