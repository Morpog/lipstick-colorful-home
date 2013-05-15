# 
# Do NOT Edit the Auto-generated Part!
# Generated by: spectacle version 0.26
# 

Name:       lipstick-colorful-home

# >> macros
# << macros

Summary:    A nice homescreen
Version:    0.1.2
Release:    1
Group:      System/GUI/Other
License:    BSD
URL:        https://github.com/nemomobile/lipstick-colorful-home
Source0:    %{name}-%{version}.tar.bz2
Source1:    lipstick.desktop
Source2:    lipstick.service
Source100:  lipstick-colorful-home.yaml
Requires:   lipstick >= 0.6.1
Requires:   nemo-qml-plugin-configuration
Requires:   nemo-qml-plugin-time
Requires:   qt-components
BuildRequires:  pkgconfig(QtCore)
BuildRequires:  pkgconfig(QtDeclarative)
BuildRequires:  pkgconfig(lipstick)
BuildRequires:  pkgconfig(systemd)
Provides:   meegotouch-home > 1.3.2
Provides:   meegotouch-systemui-screenlock-padlock > 1.3.2
Provides:   meegotouch-systemui-volume-fullscreen > 1.5.1
Conflicts:   lipstick-example-home
Obsoletes:   meegotouch-home <= 1.3.2
Obsoletes:   meegotouch-systemui-screenlock-padlock <= 1.3.2
Obsoletes:   meegotouch-systemui-volume-fullscreen <= 1.5.1

%description
A homescreen for Nemo Mobile

%prep
%setup -q -n %{name}-%{version}

# >> setup
# << setup

%build
# >> build pre
# << build pre

%qmake 

make %{?jobs:-j%jobs}

# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
# << install pre
%qmake_install
mkdir -p %{buildroot}%{_libdir}/systemd/user/
cp -a %{SOURCE2} %{buildroot}%{_libdir}/systemd/user/


# >> install post
install -D -m 644 %{SOURCE1} %{buildroot}/etc/xdg/autostart/lipstick.desktop
# << install post

%files
%defattr(-,root,root,-)
%{_bindir}/lipstick
%{_libdir}/systemd/user/lipstick.service
%config /etc/xdg/autostart/*.desktop
# >> files
# << files
