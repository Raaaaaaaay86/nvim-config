local M = {}

function M.GoToImplementation()
	if vim.bo.filetype == 'go' then
		vim.cmd(':GoImplements')
	end
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

function M.tab_complete()
    if vim.fn.pumvisible() == 1 then
		return vim.api.nvim_replace_termcodes("<C-n>", true, true, true)
    elseif check_back_space() then
		return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
    else
		return vim.api.nvim_replace_termcodes("<C-x><C-o>", true, true, true)
    end
end

function M.s_tab_complete()
    if vim.fn.pumvisible() == 1 then
		return vim.api.nvim_replace_termcodes("<C-p>", true, true, true)
    else
		return vim.api.nvim_replace_termcodes("<C-h>", true, true, true)
    end
end

function M.enter_key()
    if vim.fn.pumvisible() == 1 then
		return vim.api.nvim_replace_termcodes("<C-y>", true, true, true)
    else
		return vim.api.nvim_replace_termcodes("<CR>", true, true, true)
    end
end

return M
