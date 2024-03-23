if vim.fn.executable("rg") == 1 then
  -- using rg
else
  if vim.fn.executable("ag") == 1 then
    require("telescope").setup({
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
    })
  end
end
