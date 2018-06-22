pyatnashkee_sources = [
  'main.vala',
  'app.vala',
  'app_window.vala',
]


pyatnashkee_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
]


c_args = [
  '-DVERSION="' + meson.project_version() + '"',
  '-DGETTEXT_PACKAGE="nautilus-metadata-editor-extension"',
  '-DLOCALEDIR="' + join_paths(prefix, localedir) + '"'
]


pyatnashkee_sources += gnome.compile_resources('pyatnashkee-resources',
  'pyatnashkee.gresource.xml',
  c_name: 'pyatnashkee'
)


executable('pyatnashkee', pyatnashkee_sources,
  vala_args: '--target-glib=2.50',
  c_args: c_args,
  dependencies: pyatnashkee_deps,
  install: true,
)
