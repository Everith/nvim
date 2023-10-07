--MY SCRIPTS FOR TIHNGS
function RunCode()
  local fileType = vim.bo.filetype
  local OS = os.name()
  if OS == "Windwos" then
    if fileType == "cpp" then
      vim.cmd("!./run.bat")
    end
  elseif OS == "Linux" then
    if fileType == "cpp" then
      vim.cmd("!./run.sh")
    end
  end
end

function BuildCode()
  local fileType = vim.bo.filetype
  local OS = os.name()
  if OS == "Windwos" then
    if fileType == "cpp" then
      vim.cmd("w")
      --      vim.cmd("cd %:h")
      vim.cmd("!./build-all.bat")
    elseif fileType == "lua" then
      vim.cmd("w")
      vim.cmd("cd %:h")
      vim.cmd('echo "lua file in scripts"')
      --    elseif fileType == "go" then
      --      vim.cmd("w")
      --      vim.cmd("cd %:h")
      --      vim.cmd('echo "Exit with C-c"')
      --      vim.cmd("!go run .")
    end
  elseif OS == "Linux" then
    if fileType == "cpp" then
      vim.cmd("w")
      --       vim.cmd("cd %:h")
      vim.cmd("!./build-all.sh")
    end
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
