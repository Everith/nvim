--MY SCRIPTS FOR TIHNGS
function BuildCodes()
  local fileType = vim.bo.filetype
  if fileType == "cpp" then
    vim.cmd("w")
    vim.cmd("cd %:h")
    vim.cmd("!build.bat")
  elseif fileType == "lua" then
    vim.cmd("w")
    vim.cmd("cd %:h")
    vim.cmd('echo "lua file in scripts"')
  elseif fileType == "go" then
    vim.cmd("w")
    vim.cmd("cd %:h")
    vim.cmd('echo "Exit with C-c"')
    vim.cmd("!go run main.go")
  end
end

function GetManual()
  local fileType = vim.bo.filetype
  if fileType == "cpp" then
    vim.cmd("lua vim.lsp.buf.signature_help()")
  elseif fileType == "lua" then
    vim.cmd("lua vim.lsp.buf.signature_help()")
  elseif fileType == "go" then
    vim.cmd("GoDoc")
  end
end

function Terminal()
  local a = vim.fn.expand("%:t")
  if a == "cmd.exe" then
    vim.cmd("bd!")
  else
    vim.cmd("sp")
    vim.cmd("terminal")
  end
end

function GetOS()
  local BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)")
  if BinaryFormat == "dll" then
      function os.name()
          return "Windows"
      end
  elseif BinaryFormat == "so" then
      function os.name()
          return "Linux"
      end
  elseif BinaryFormat == "dylib" then
      function os.name()
          return "MacOS"
      end
  end
end
