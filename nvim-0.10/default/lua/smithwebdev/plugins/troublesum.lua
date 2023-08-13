return {
  "ivanjermakov/troublesum.nvim",
  config = function()
    require("troublesum").setup({
      enabled = true,
      autocmd = true,
      severity_format = { "E", "W", "I", "H" },
      severity_highlight = { "DiagnosticError", "DiagnosticWarn", "DiagnosticInfo", "DiagnosticHint" },
      format = function(counts) end,
      display_summary = function(bufnr, ns, text) end
    })
  end
}
