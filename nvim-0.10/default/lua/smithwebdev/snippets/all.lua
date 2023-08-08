return {

  -- Connection verification
  s({
    trig = 'cvc',
    name = 'Connection Verification Check',
    dscr = 'Connection verification'
  },
    fmt([[{}]], {t('This is connected to Luasnip')})
  )
}
