Name: monitoring
Summary: Prometheus, Alert Manager and Node exporter
Version: 1
Release: 0
License: Apache License 2.0
Conflicts: prometheus
URL: https://prometheus.io

Source0: monitoring-%{version}-%{release}.tar.gz

%description
This is the rpm package include node exporter, alertmanager and prometheus.

%prep
%setup -q -n monitoring

%install
mkdir -vp %{buildroot}/usr/local/bin
mkdir -vp %{buildroot}/etc/prometheus
mkdir -vp %{buildroot}/etc/prometheus/consoles
mkdir -vp %{buildroot}/etc/prometheus/console_libraries
mkdir -vp %{buildroot}/etc/node_exporter
mkdir -vp %{buildroot}/etc/alertmanager
install -D -m 755 prometheus/prometheus %{buildroot}/usr/local/bin/prometheus
install -D -m 755 prometheus/promtool %{buildroot}/usr/local/bin/promtool
install -D -m 644 prometheus/prometheus.yml %{buildroot}%{_sysconfdir}/prometheus/prometheus.yml
install -D -m 644 prometheus/consoles/* %{buildroot}%{_sysconfdir}/prometheus/consoles
install -D -m 644 prometheus/console_libraries/* %{buildroot}%{_sysconfdir}/prometheus/console_libraries
install -D -m 644 conf/prometheus.yml.j2 %{buildroot}%{_sysconfdir}/prometheus/prometheus.yml.j2
install -D -m 644 conf/prometheus.service %{buildroot}%{_unitdir}/prometheus.service
install -D -m 644 conf/prometheus.default %{buildroot}%{_sysconfdir}/prometheus/default
install -D -m 755 node_exporter/node_exporter %{buildroot}/usr/local/bin/node_exporter
install -D -m 644 conf/node_exporter.service %{buildroot}%{_unitdir}/node_exporter.service
install -D -m 644 conf/node_exporter.default %{buildroot}%{_sysconfdir}/node_exporter/default
install -D -m 755 alertmanager/alertmanager %{buildroot}/usr/local/bin/alertmanager
install -D -m 755 alertmanager/amtool %{buildroot}/usr/local/bin/amtool
install -D -m 644 alertmanager/alertmanager.yml %{buildroot}%{_sysconfdir}/alertmanager/alertmanager.yml
install -D -m 644 conf/alertmanager.service %{buildroot}%{_unitdir}/alertmanager.service
install -D -m 644 conf/alertmanager.default %{buildroot}%{_sysconfdir}/alertmanager/default

exit 0

%files
/usr/local/bin/prometheus
/usr/local/bin/promtool
%{_sysconfdir}/prometheus/prometheus.yml
%{_sysconfdir}/prometheus/consoles
%{_sysconfdir}/prometheus/console_libraries
%{_sysconfdir}/prometheus/prometheus.yml.j2
%{_unitdir}/prometheus.service
%{_sysconfdir}/prometheus/default
/usr/local/bin/node_exporter
%{_unitdir}/node_exporter.service
%{_sysconfdir}/node_exporter/default
/usr/local/bin/alertmanager
/usr/local/bin/amtool
%{_sysconfdir}/alertmanager/alertmanager.yml
%{_unitdir}/alertmanager.service
%{_sysconfdir}/alertmanager/default
