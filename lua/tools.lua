-- tools comment

local api = vim.api
local M = {}
function M.makeScratch()
	api.nvim_command('enew') --same as :enew
	vim.bo[0].buftype=nofile --set the(buffer 0)buffertype to nofile
	vim.bo[0]
	vim.bo[0]
end
return M
