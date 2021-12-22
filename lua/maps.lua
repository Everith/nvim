local mapper = require ('mapper')

--mapper.map('','','')
-- ''  glodal mode
-- 'i' insert mode
-- 'n' normal mode
-- 'v' visual mode
mapper.map('','<leader>sv',':source $MYVIMRC<CR>')
mapper.map('','<leader>ev',':e $MYVIMRC<CR>')
mapper.map('','<leader>cd',':cd %:h<CR>')

--MOUVEMENTS
mapper.map('n', '<M-h>', '<C-w><C-h>')  -- Make <C-u> undo-friendly
mapper.map('n', '<M-j>', '<C-w><C-j>')  -- Make <C-u> undo-friendly
mapper.map('n', '<M-k>', '<C-w><C-k>')  -- Make <C-u> undo-friendly
mapper.map('n', '<M-l>', '<C-w><C-l>')  -- Make <C-u> undo-friendly

--BUFFERS
mapper.map('n', '_', ':bp<cr>')  -- Make <C-u> undo-friendly
mapper.map('n', '+', ':bn<cr>')  -- Make <C-u> undo-friendly

-- PLUGINS
--
-- FZF ########################################
mapper.map('n','<leader>p',':Files<CR>')
--commands:
--:Files 
--:GFiles 
--:GFiles
--:Buffers	
--:Colors	
--:Ag 
--:Rg 
--:Lines 
--:BLines 
--:Tags 
--:BTags 
--:Marks	
--:Windows	
--:Locate 
--:History	
--:History
--:History
--:Snippets	
--:Commits	
--:BCommits	
--:Commands	
--:Maps	
--:Helptags	
--:Filetypes	



-- <Tab> to navigate the completion menu
mapper.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
mapper.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

mapper.map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights


mapper.map('n', '<leader>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
mapper.map('n', '<leader>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
mapper.map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
mapper.map('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
mapper.map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
mapper.map('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
mapper.map('n', '<leader>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
mapper.map('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
mapper.map('n', '<leader>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
