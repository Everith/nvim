local status_ok, config = pcall(require, "windows")
if not status_ok then
  return
end

config.setup({
  autowidth = { --		     |windows.autowidth|
    enable = false,
    winwidth = 5, --		      |windows.winwidth|
    filetype = { --	    |windows.autowidth.filetype|
      help = 2,
    },
  },
  ignore = { --			|windows.ignore|
    buftype = { "quickfix" },
    filetype = { "NvimTree", "neo-tree", "undotree", "NeogitStatus" },
  },
  animation = {
    enable = false,
    duration = 300,
    fps = 30,
    easing = "in_out_sine",
  },
})
