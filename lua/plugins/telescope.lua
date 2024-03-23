if vim.fn.executable("rg") == 1 then
  -- using rg
  return {}
else
  if vim.fn.executable("ag") == 1 then
    return {
      "telescope",
      defaults = {
        vimgrep_arguments = {
          "ag",
          "--noheading",
          "--column",
          "--smart-case",
          "--silent",
          "--vimgrep",
        },
      },
    }
  end
end
