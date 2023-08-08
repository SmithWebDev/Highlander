return {
  -- Turbo Frame Tag --
  s(
    {
      trig = "tft",
      name = "Turbo Frame Tag",
      dscr = "Turbo Frame Tag",
    },
    fmt(
      [[
  <%= turbo_frame_tag {} %>
  ]],
      {
        i(1),
      }
    )
  ),

  s(
    "snipt",
    fmt(
      [[
    <>(<>, {t('<>')}<>
    <>)<>,]],
      {
        c(1, { t("s"), t("autosnippet") }),
        c(2, { i(nil, "trig"), sn(nil, { t("{trig='"), i(1), t("'}") }) }),
        i(3, "text"),
        i(4, "opts"),
        i(5),
        i(0),
      },
      { delimiters = "<>" }
    )
  ),

}

