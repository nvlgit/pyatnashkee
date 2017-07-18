
Name:           pyatnashkee
Version:        0.1
Release:        1%{?dist}
Summary:        15 classic slide puzzle game

License:        GPLv3      
URL:            https://github.com/nvlgit/pyatnashkee
Source0:        https://github.com/nvlgit/pyatnashkee/%{name}-%{version}.tar.gz


%description
Fifteen is a classic slide puzzle game. 


%prep
%autosetup


%build
%configure
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT

%make_install
rm %{buildroot}%{_datadir}/%{name}/data/*

%check
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

%files
%license COPYING
%doc README.md INSTALL AUTHORS NEWS ChangeLog
%{_bindir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.svg
%{_datadir}/icons/hicolor/symbolic/apps/%{name}-symbolic.svg


%changelog
* Sat Jun 10 2017 - 0.1-0
- initial spec
