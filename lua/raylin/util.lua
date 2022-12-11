local M = {}

function M.format()
	if vim.bo.filetype == 'go' then
		vim.cmd(':GoImplements')
	end
end

return M
