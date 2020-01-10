# docker-verlihub
This is an attempt to dockerize Verlihub.

# Instructions
* If you don't have a config file already, use `vh --install` to set one up.
* The default location for verlihub's config is in `/etc/verlihub`, so set up a bind from your config file
* This container does not include MySQL (It's assumed you can set that up yourself). This means that the
first install configuration tool will fail if you run it without connecting a container for setup.

# Notes
* Because of verlihub/verlihub#170, we are stuck on Ubuntu Xenial (16). No alpine yet!

