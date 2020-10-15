# rpmbuilder
A docker container based RPM builder for CentOS7/8

# Case1: Build the monitoring.aarch64..rpm using Docker
## Create the Docker rpmbuilder image
```sh
$ reset.sh
$ monitoring/download_pkg.sh
$ monitoring/packaging.sh
$ docker build -t monitoring .
```
## Build
```sh
$ docker run -it -v /tmp/RPMS:/root/rpmbuild/RPMS monitoring:latest
$ tree /tmp/RPMS/
/tmp/RPMS/
└── aarch64
    └── monitoring-1-0.aarch64.rpm
```
