icon_sizes = ['16x16', '24x24', '32x32', '48x48' , '64x64', '128x128', '256x256', '512x512', 'scalable']

foreach s: icon_sizes
	install_data(
		join_paths('hicolor', s, 'apps', 'com.gitlab.nvlgit.' + meson.project_name() + '.svg'),
		install_dir: join_paths(get_option('datadir'), 'icons', 'hicolor', s, 'apps')
	)
endforeach

install_data(
	join_paths('hicolor', 'symbolic', 'apps', 'com.gitlab.nvlgit.' + meson.project_name() + '-symbolic.svg'),
	install_dir: join_paths(datadir, 'icons', 'hicolor', 'symbolic', 'apps')
)
