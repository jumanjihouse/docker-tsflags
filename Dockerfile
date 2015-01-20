FROM fedora:latest

# Centos and Fedora base images have an /etc/yum.conf with:
#   tsflags=nodocs
#
# That option causes rpm to skip files in  /usr/share/doc
# and thereby make the built image smaller.

# What if you want to keep the default (nodocs), but
# want to install docs for a subset of packages?
#
# Install the package with docs and without modifying yum.conf.
RUN yum -y install --setopt=tsflags='' openssh-clients; yum clean all

# Install a package without docs (iow, the default).
RUN yum -y install openssh-server; yum clean all

# If you want ALL doc files to be present for ALL packages,
# you can do this:
RUN sed -i '/tsflags=nodocs/d' /etc/yum.conf

# Install another package WITH docs.
RUN yum -y install vim-common; yum clean all

ADD count.sh /usr/bin/count.sh
ENTRYPOINT ["/usr/bin/count.sh"]
