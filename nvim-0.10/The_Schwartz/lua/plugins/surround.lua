return {
  'tpope/vim-surround',                             -- https://github.com/tpope/vim-surround
  dependencies = {
    'tpope/vim-repeat', -- https://github.com/tpope/vim-repeat
  },
  init = function()
    vim.g.surround_35='<%# \r %>' -- #
    vim.g.surround_45='<% \r %>' -- -
    vim.g.surround_61='<%= \r %>' -- =
    vim.g.surround_65='<% \r do %>\n<% end %>' -- A
    vim.g.surround_97='<% \r %>\n<% end %>' -- a
    --vim.g.surround_102='<%  %>\n\r<% end %>' -- f
    --vim.g.surround_70='<%  do %>\n\r<% end %>' -- F
    vim.g.surround_102='function() \r end' -- f
    vim.g.surround_70='function()\n\r end' -- F
  end
}

 --Alt Code   Symbol
 ---------- --------
--  alt 32
--  alt 33     !
--  alt 34     "
--  alt 35     #
--  alt 36     $
--  alt 37     %
--  alt 38     &
--  alt 39     '
--  alt 40     (
--  alt 41     )
--  alt 42     *
--  alt 43     +
--  alt 44     ,
--  alt 45     -
--  alt 46     .
--  alt 47     /
--  alt 48     0
--  alt 49     1
--  alt 50     2
--  alt 51     3
--  alt 52     4
--  alt 53     5
--  alt 54     6
--  alt 55     7
--  alt 56     8
--  alt 57     9
--  alt 58     :
--  alt 59     ;
--  alt 60     <
--  alt 61     =
--  alt 62     >
--  alt 63     ?
--  alt 64     @
--  alt 65     A
--  alt 66     B
--  alt 67     C
--  alt 68     D
--  alt 69     E
--  alt 70     F
--  alt 71     G
--  alt 72     H
--  alt 73     I
--  alt 74     J
--  alt 75     K
--  alt 76     L
--  alt 77     M
--  alt 78     N
--  alt 79     O
--  alt 80     P
--  alt 81     Q
--  alt 82     R
--  alt 83     S
--  alt 84     T
--  alt 85     U
--  alt 86     V
--  alt 87     W
--  alt 88     X
--  alt 89     Y
--  alt 90     Z
--  alt 91     [
--  alt 91     [
--  alt 92     \
--  alt 92     \
--  alt 93     ]
--  alt 93     ]
--  alt 94     ^
--  alt 95     _
--  alt 96     `
--  alt 97     a
--  alt 98     b
--  alt 99     c
--  alt 100    d
--  alt 101    e
--  alt 102    f
--  alt 103    g
--  alt 104    h
--  alt 105    i
--  alt 106    j
--  alt 107    k
--  alt 108    l
--  alt 109    m
--  alt 110    n
--  alt 111    o
--  alt 112    p
--  alt 113    q
--  alt 114    r
--  alt 115    s
--  alt 116    t
--  alt 117    u
--  alt 118    v
--  alt 119    w
--  alt 120    x
--  alt 121    y
--  alt 122    z
--  alt 123    {
--  alt 124    |
--  alt 125    }
--  alt 126    ~
