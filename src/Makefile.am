## Process this file with automake to produce Makefile.in

## Created by Anjuta


uidir = $(pkgdatadir)/data


ui_DATA = \
	$(uidir)/window.ui	\
	$(uidir)/tiles.css

gresource_file = \
	$(top_srcdir)/data/pyatnashkee.gresource.xml


AM_CPPFLAGS = \
	-DPACKAGE_LOCALE_DIR=\""$(localedir)"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	-DPACKAGE_DATA_DIR=\""$(pkgdatadir)"\" \
	$(PYATNASHKEE_CFLAGS)

AM_CFLAGS = \
	 -O2	\
	 -Wall	\
	 -g

bin_PROGRAMS = pyatnashkee

pyatnashkee_SOURCES = \
	app.vala config.vapi app_window.vala resources.c

pyatnashkee_VALAFLAGS =  \
	--pkg gtk+-3.0 --target-glib 2.38 --pkg=gio-2.0 --gresources $(gresource_file)

pyatnashkee_LDFLAGS = \
	-Wl,--export-dynamic

pyatnashkee_LDADD = $(PYATNASHKEE_LIBS)

GLIB_COMPILE_RESOURCES = glib-compile-resources

resources.c: $(gresource_file) $(ui_DATA)
	$(AM_V_GEN) $(GLIB_COMPILE_RESOURCES) 	\
		--target=$@			\
		--sourcedir=$(uidir)	\
        --generate-source $<

EXTRA_DIST = $(ui_DATA) $(gresource_file)


# Remove ui directory on uninstall
uninstall-local:
#	-rm -r $(ui_DATA)
	-rm -r $(pkgdatadir)
