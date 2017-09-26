%global debug_package   %{nil}

Name:           pyatnashkee
Version:        0.1.0
Release:        1%{?dist}
Summary:        15-puzzle

License:        GPLv3      
URL:            https://github.com/nvlgit/pyatnashkee
Source0:        https://github.com/nvlgit/pyatnashkee/%{name}-%{version}.tar.xz

BuildRequires:  gtk3-devel
BuildRequires:  vala-tools
BuildRequires:  meson

%description
15-puzzle is a classic sliding puzzle game 


%prep
%autosetup -c


%build
%meson
%meson_build


%install
%meson_install
%find_lang %{name}


%check
%meson_test
desktop-file-validate $RPM_BUILD_ROOT%{_datadir}/applications/%{name}.desktop


%post
/usr/bin/update-desktop-database &> /dev/null || :
/bin/touch --no-create %{_datadir}/icons/hicolor &> /dev/null || :


%postun
/usr/bin/update-desktop-database &> /dev/null || :
if [ $1 -eq 0 ] ; then
    /bin/touch --no-create %{_datadir}/icons/hicolor &> /dev/null || :
    /usr/bin/gtk-update-icon-cache %{_datadir}/icons/hicolor &> /dev/null || :
fi

%posttrans
/usr/bin/gtk-update-icon-cache %{_datadir}/icons/hicolor &> /dev/null || :

%files -f %{name}.lang
%license COPYING
%doc README.md INSTALL AUTHORS
%{_bindir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.svg
%{_datadir}/icons/hicolor/symbolic/apps/%{name}-symbolic.svg


%changelog
* Mon Sep 25 2017 - 0.1.0-1
- jump to meson

* Sat Jun 10 2017 - 0.1.0-0
- initial spec
