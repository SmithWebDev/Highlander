return {
  s(
    "snip",
    c(
      1,
      {
        fmt(
          [[
    -- {}
    s({{
      trig = '{}',
      name = '{}',
      dscr = '{}'
    }},
      {}
    ),

    ]],
          {
            i(1),
            i(2),
            i(3),
            rep(1),
            c(4, {
              { t("{"), t(""), t("\t"), i(1), t(""), t("}") },
              { t("fmt([["), i(1), t("]], {"), i(2), t("})") },
            }),
          }
        ),
      }
    )
  ),
  -- Neovim Keybind skeleton
  s(
    {
      trig = "key",
      name = "Keybind Skeleton",
      dscr = "Neovim Keybind skeleton",
    },
    fmt([[vim.keymap.set('{}', '{}', '{}', {{ desc = '{}', silent = true }})]], {
      c(1, {
        t("n"),
        t("i"),
        t("v"),
        t("t"),
        t("x"),
      }),
      i(2),
      i(3),
      i(4),
    })
  ),
}
