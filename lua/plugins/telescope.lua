local telescope, builtin = require("telescope"), require("telescope.builtin")

telescope.load_extension("fzf")

if vim.fn.executable("rg") == 1 then
  return {
    "telescope",
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--line-number",
        "--no-heading",
        "--column",
        "--smart-case",
        "--silent",
        "--vimgrep",
      },
    },
    keys = {
      { "<leader>/", "<cmd>lua fuzzyFindFiles()<CR>" },
      { "<leader>/", false },
    },
  }
else
  if vim.fn.executable("ag") == 1 then
    return {
      "telescope",
      keys = {
        { "<leader>/", false },
      },
      { "<leader>/", "<cmd>lua fuzzyFindFiles()<CR>" },
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
