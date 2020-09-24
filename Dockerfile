# BASE IMAGE
FROM centos:8.2.2004 as base
LABEL maintainer="su.jming@gmail.com"

RUN dnf install -y gcc rpm-build rpm-devel rpmlint make python38 diffutils patch rpmdevtools

RUN rpmdev-setuptree
WORKDIR /root/rpmbuild

CMD ["/bin/bash"]

# RPM BUILDER
FROM base as builder
LABEL maintainer="su.jming@gmail.com"

ADD rpmbuild/BUILD /root/rpmbuild/BUILD
ADD rpmbuild/RPMS /root/rpmbuild/RPMS
ADD rpmbuild/SOURCES /root/rpmbuild/SOURCES
ADD rpmbuild/SPECS /root/rpmbuild/SPECS
ADD rpmbuild/SRPMS /root/rpmbuild/SRPMS
ADD scripts/rpmbuild.sh /root/rpmbuild/

#CMD ["/bin/bash"]
ENTRYPOINT ["/root/rpmbuild/rpmbuild.sh"]
