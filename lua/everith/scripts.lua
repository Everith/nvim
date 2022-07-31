--MY SCRIPTS FOR TIHNGS
function BuildCodes()
  local a = vim.bo.filetype
  if a == "cpp" then
    vim.cmd('w')
    vim.cmd('cd %:h')
    vim.cmd('!build.bat')
  elseif a == "lua" then
    vim.cmd('w')
    vim.cmd('cd %:h')
    vim.cmd('echo "lua file in scripts"')
  elseif a == "go" then
    vim.cmd('w')
    vim.cmd('cd %:h')
    vim.cmd('echo "Exit with C-c"')
    vim.cmd('!go run main.go')
  end
end

function Terminal()
  local a = vim.fn.expand('%:t')
  if a == "cmd.exe" then
    vim.cmd('bd!')
  else
    vim.cmd('sp')
    vim.cmd("terminal")
  end
end
