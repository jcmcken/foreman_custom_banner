%global gem_name foreman_custom_banner
%global rubyabi 1.9.1

%{?scl:%scl_package rubygem-%{gem_name}}
%{?scl:%global pkg_name %{name}}

Summary: Plugin for Foreman that adds a custom banner
Name: %{?scl_prefix}rubygem-%{gem_name}
Version: 0.0.2
Release: 1%{?dist}
Group: Development/Languages
License: Apache License 2.0
URL: https://github.com/jcmcken/foreman_custom_banner
Source0: %{gem_name}-%{version}.gem
Requires: %{?scl_prefix}ruby(abi) = %{rubyabi}
Requires: %{?scl_prefix}ruby(rubygems)
Requires: %{?scl_prefix}rubygem(deface)
%{?scl:BuildRequires: scl-utils-build}
BuildRequires: %{?scl_prefix}ruby(abi) = %{rubyabi}
BuildRequires: %{?scl_prefix}ruby(rubygems)
BuildRequires: %{?scl_prefix}rubygems-devel
BuildArch: noarch
Provides: %{?scl_prefix}rubygem(%{gem_name}) = %{version}

%description
Plugin for Foreman that adds a custom banner.

%package doc
Summary: Documentation for %{name}
Group: Documentation
Requires: %{name} = %{version}-%{release}
BuildArch: noarch

%description doc
Documentation for %{name}


%prep
%setup -q -c -T
mkdir -p .%{gem_dir}

%{?scl:scl enable %{scl} "}
gem install --local --install-dir .%{gem_dir} \
            --force %{SOURCE0}
%{?scl:"}

%build

%install
mkdir -p %{buildroot}%{gem_dir}
cp -pa .%{gem_dir}/* \
        %{buildroot}%{gem_dir}/

find %{buildroot}%{gem_instdir} -type f | xargs chmod ugo+r

%if %{?scl:1}%{!?scl:0}
mkdir -p %{buildroot}%{_root_datadir}/foreman/bundler.d
ln -s %{gem_instdir}/install/foreman_custom_banner.rb \
    %{buildroot}%{_root_datadir}/foreman/bundler.d
%endif

rm %{buildroot}/%{gem_instdir}/.gitignore
rm %{buildroot}/%{gem_instdir}/*.spec

%files
%dir %{gem_instdir}
%{gem_instdir}/lib
%{gem_instdir}/install
%{gem_instdir}/app
%{gem_instdir}/Gemfile
%{gem_instdir}/foreman_custom_banner.png
%exclude %{gem_dir}/cache/%{gem_name}-%{version}.gem
%exclude %{gem_instdir}/%{gem_name}.gemspec
%{gem_dir}/specifications/%{gem_name}-%{version}.gemspec
%{_root_datadir}/foreman/bundler.d
%doc %{gem_instdir}/README.md
%doc %{gem_instdir}/CHANGES.md
%doc %{gem_instdir}/LICENSE
%doc %{gem_instdir}/CONTRIBUTORS

%files doc
%doc %{gem_dir}/doc/%{gem_name}-%{version}


%changelog
* Fri Apr 08 2015 Chris Pisano - 0.0.2-2
* Mon Feb 16 2015 Jon McKenzie - 0.0.2-1
- Initial release.
* Sat Oct 11 2014 Jon McKenzie - 0.0.1-1
- Initial release.
