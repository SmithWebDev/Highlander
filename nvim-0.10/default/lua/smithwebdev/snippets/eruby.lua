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

  ------------------------
  --   Link_to helper   --
  ------------------------
  s(
    { trig = 'ltc', name = 'Link To', dscr = "Rails 'link to' helper" },
    fmt([[<%= link_to {}, {}{}{}%>]], {
      c(1, {
        { t("'"), i(1), t("'") },
        i(1),
      }),
      c(2, {
        { i(1) },
        { i(1), t('_path') },
        { i(1), t('_path ') },
        { i(1), t('_path('), i(2), t(')') },
        { t('new_'), i(1), t('_path') },
        { t('edit_'), i(1), t('_path('), i(2), t(')') },
        { t("'"), i(1), t("'") },
      }),
      c(3, {
        { i(1) },
        { t(", class: '"), i(1), t("' ") },
        { t(", class: '<%= "), i(1), t("%>' ") },
      }),
      c(4, {
        t(""),
        { i(1) },
        { t(', data: { turbo_frame: '), i(1), t(')}') },
        { t(', data: { turbo_frame: dom_id('), i(1), t(')}') },
        { t(', data: { turbo_method: dom_id('), i(1), t(')}') },
        { t(', data: { turbo_method: :delete') },
        { t(", data: { turbo_method: :delete, turbo_confirm: '"), i(1), t("'}") },
        { t('method: :delete') }
      }),
    })
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

