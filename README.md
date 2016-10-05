Drone
=====
[![Build Status](https://travis-ci.org/zer0touch/drone.svg?branch=master)](https://travis-ci.org/zer0touch/drone)
Creates the docker drone build to run drone CI... for those of you unfamiliar with drone, well its pretty good. Everything runs in a container, much like travis ci.  Really good for things like packer builds.

Default ports are 3000 and 22
## Example
## To change the default encryption key for consul you will need to rebuild the image with a new key. This is randomly created so please make sure to change it
Run with standard configuration

    docker run -p 8082:8082 --privileged zer0touch/drone

This container makes use of service discovery and the name of the container represents its standard identifier when requesting or looking up services. 
