pyatnashkee_sources = [
  'app.vala',
  'app_window.vala',
]

pyatnashkee_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
]

gnome = import('gnome')

pyatnashkee_sources += gnome.compile_resources('pyatnashkee-resources',
  'pyatnashkee.gresource.xml',
  c_name: 'pyatnashkee'
)

executable('pyatnashkee', pyatnashkee_sources,
  vala_args: '--target-glib=2.50',
  dependencies: pyatnashkee_deps,
  install: true,
)
