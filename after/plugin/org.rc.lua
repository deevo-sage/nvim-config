require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  org_agenda_files = {'~/orgfiles/org/*'},
  org_default_notes_file = '~/orgfiles/org/refile.org',
})
