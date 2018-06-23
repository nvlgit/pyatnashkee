pyatnashkee_sources = [
  'main.vala',
  'app.vala',
  'app-about-dialog.vala',
  'app_window.vala',
]


pyatnashkee_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
]


c_args = [
  '-DVERSION="' + meson.project_version() + '"',
  '-DGETTEXT_PACKAGE="com.gitlab.nvlgit.pyatnashkee"',
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