desktop_conf = configuration_data()
desktop_conf.set('app_id', app_id)


desktop_file = i18n.merge_file(
  'desktop',
  input: configure_file(
           input: '@0@.desktop.in'.format(app_id),
           output: '@0@.desktop.in'.format(app_id),
           configuration: desktop_conf
         ),
  output: '@0@.desktop'.format(app_id),
  install: true,
  install_dir: desktopdir,
  po_dir: po_dir,
  type: 'desktop'
)

desktop_utils = find_program('desktop-file-validate', required: false)
if desktop_utils.found()
  test('Validate desktop file', desktop_utils,
    args: [desktop_file]
  )
endif

subdir('icons')