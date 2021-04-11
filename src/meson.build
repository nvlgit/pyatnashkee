pyatnashkee_sources = [
  'main.vala',
  'fifteen-core.vala',
  'app.vala',
  'app-about-dialog.vala',
  'app_window.vala',
]


pyatnashkee_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk4', version: '>= 4.2.0'),
]


c_args = [
  '-DVERSION="' + meson.project_version() + '"',
  '-DGETTEXT_PACKAGE="' + app_id + '"',
  '-DLOCALEDIR="' + join_paths(prefix, localedir) + '"'
]

add_project_arguments(['--gresourcesdir', join_paths(meson.current_source_dir(), 'ui')],
                      language: 'vala')

pyatnashkee_sources += gnome.compile_resources('pyatnashkee-resources',
  'pyatnashkee.gresource.xml',
  source_dir: join_paths(meson.current_source_dir(), 'ui'),
  c_name: 'pyatnashkee'
)


executable(app_id, pyatnashkee_sources,
  vala_args: '--target-glib=2.50',
  c_args: c_args,
  dependencies: pyatnashkee_deps,
  install: true,
)
