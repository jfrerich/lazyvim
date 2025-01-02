return {
  "gbprod/yanky.nvim",
  config = function()
    require("yanky").setup({
      ring = {
        history_length = 100,
        storage = "shada", -- persistent storage
        sync_with_numbered_registers = true,
        cancel_event = "update",
      },
      highlight = { on_put = true, on_yank = true, timer = 200 },
    })

    vim.keymap.set("n", "<leader>y", function()
      local history = require("yanky.history").all()
      local entries = {}
      for _, item in ipairs(history) do
        table.insert(entries, item.regcontents)
      end
      require("fzf-lua").fzf_exec(entries, {
        prompt = "Yank History> ",
        actions = {
          ["default"] = function(selected)
            local entry = selected[1]
            require("yanky").put(entry)
          end,
        },
      })
    end, { noremap = true, silent = true })

    -- which-key setup
    local wk = require("which-key")
    wk.add({ { "<leader>y", desc = "Yanky History" } })
  end,
}
