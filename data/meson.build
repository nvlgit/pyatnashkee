desktop_conf = configuration_data()

desktop_file = i18n.merge_file(
  input: 'com.gitlab.nvlgit.pyatnashkee.desktop.in',
  output: 'com.gitlab.nvlgit.pyatnashkee.desktop',
  type: 'desktop',
  po_dir: po_dir,
  install: true,
  install_dir: desktopdir
)
#  'desktop',
#  input: configure_file(
#    input: files('com.gitlab.nvlgit.pyatnashkee.desktop.in.in'),
#    output: 'com.gitlab.nvlgit.pyatnashkee.desktop.in',
#    configuration: desktop_conf
#  ),
#  output: '@0@.desktop'.format(application_id),
#  install: true,
#  install_dir: desktopdir,
#  po_dir: po_dir,
#  type: 'desktop'


desktop_utils = find_program('desktop-file-validate', required: false)
if desktop_utils.found()
  test('Validate desktop file', desktop_utils,
    args: [desktop_file]
  )
endif

subdir('icons')