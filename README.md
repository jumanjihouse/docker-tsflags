Docker and YUM tsflags
======================

By default, the base images for Fedora and Centos minimize the size
of built images by including this in `/etc/yum.conf`:

    tsflags=nodocs

The impact is that RPMs get installed *without* any files in
`/usr/share/doc`. This is usually what you want for an app container.

Sometimes, you want to override that behavior for one or more packages.
The `Dockerfile` in this repo shows you how to:

* Install docs for one or a few packages.
* Install packages without docs (the default).
* Install all docs for all packages.


Demo
----

Clone this repo on a docker-enabled host:

    git clone https://github.com/jumanjihouse/docker-tsflags.git
    cd docker-tsflags

Run these commands from the root of this repo:

    script/build
    script/test

You should see this output at the end:

    All tests passed!
