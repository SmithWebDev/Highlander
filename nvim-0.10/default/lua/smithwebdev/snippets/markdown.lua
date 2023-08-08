return {
  -- ------------------------
  --Markdown Landuage Block--
  ------------------------
  s({
    trig = 'mlb',
    name = 'Markdown language block',
    dscr = 'Markdown Language Block'
  },
    fmt([[
      ```{}
      {}
      ```
      ]], {
        c(1,{
          i(1),
          t('rb'),
        }),
        i(2),
      })
  ),

  ------------------------
  --Pull Request Template--
  ------------------------
  s({
    trig = 'prd',
    name = 'Pull Request Description',
    dscr = 'Description for Pull Request'
  },
    fmt([[
 {}/{}-{}
 [{} PT-{}]  {}

 ## Objective

   As a(n) {},
   When {}
   I {} to {}
   In order to {}

 ## Solution

   {}

 ## Technical Changes

   - {}

 ## Task

   [{}]({})

 ### Deliver Check List

   - [ ] Update PR title to follow format: `[Feature|Chore|Bug PT-{{pivitol_issue_number}}] Description of your work`
   - [ ] Ensure Circle CI passes
   - [ ] Request code review on Github
   - [ ] Once reviewed, reviewer should add "Code Review" field to Pivotal ticket
   - [ ] Ensure Heroku app deploys successfully
   - [ ] Wait for Heroku to automatically provision DB, this will start a few minutes after app creation
   - [ ] Link your PR to the Pivotal ticket
   - [ ] Mark your Pivotal ticket 'Finish'
   - [ ] Leave a comment in your ticket with a link to the test app
   - [ ] Update test notes if you made changes that isnt part of the AC
   - [ ] Squash your PR when approved and passes QA
   - [ ] Update Pivotal Ticket to let QA know it's on staging
     ]], {
        c(1, {
          t('Bugs'),
          t('Chores'),
          t('Features'),
        }),
        i(2),
        i(3),
        rep(1),
        rep(2),
        rep(3),
        i(4),
        i(5),
        c(6, {
          t('want'),
          t('dont want')
        }),
        i(7),
        i(8),
        i(9),
        i(10),
        rep(3),
        i(0),
      })
  ),

  ------------------------
  --User Story Template --
  ------------------------
  s({
    trig = 'stt',
    name = 'story tracker template',
    dscr = 'creates template for story tracking'
  },
    fmt([[
    **As a(n)** {},
    **When** {}
    **I want to** {}
    **In order to** {}

    **Acceptance Criteria**
    - {}

    **Why**
    - {}

    **Notes**
    - {}

    **Dev Notes**
    - {}

    **Test Notes**
    ]], {i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8), })
  ),
}

