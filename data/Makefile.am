SUBDIRS = icons

desktopdir = $(datadir)/applications
desktop_DATA = pyatnashkee.desktop


pyatnashkee.desktop: pyatnashkee.desktop.in.in
	$(AM_V_GEN) sed -e 's|@bindir[@]|$(bindir)|g' $< > $@



EXTRA_DIST = 					\
	pyatnashkee.desktop.in.in   

CLEANFILES = 					\
	$(BUILT_SOURCES)			\
	pyatnashkee.desktop			\
	$(desktop_DATA)

