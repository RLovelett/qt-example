%define VERSION_LONG %(echo $VERSION_LONG)
%define VERSION_SHORT %(echo $VERSION_SHORT)

%define VERSION_MAJOR %(echo $VERSION_MAJOR)
%define VERSION_MINOR %(echo $VERSION_MINOR)
%define VERSION_REVISION %(echo $VERSION_REVISION)
%define VERSION_BUILD %(echo $VERSION_BUILD)

#
# Qt Example
#
Summary: An example application compiled with QMake that was turned into an RPM.
Name: qt-example
Version: %{VERSION_LONG}
Release: %{VERSION_BUILD}
License: MIT
Group: Applications/Engineering
Source: http://lovelett.me/not/a/real/path/qt-example-%{VERSION_SHORT}-src.tar.gz
URL: http://lovelett.me
Vendor: http://lovelett.me
Packager: Ryan Lovelett <ryan.a.lovelett@saic.com>

%description
Application that exists purely to exemplify how to build an RPM package.

%prep
%setup -n source

%build
qmake -r
make -f Makefile.$QMAKESPEC all

%install
INSTALL_ROOT=%{buildroot}/usr make -f Makefile.$QMAKESPEC install

%post

%postun

%files
%{_bindir}/*
%{_libdir}/*

%changelog
