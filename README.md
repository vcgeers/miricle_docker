# miricle_docker
Scripts to create Docker images with Anaconda (https://www.continuum.io/what-is-anaconda) and MIRICLE (www.miricle.org).

The "Dockerfile_\<xyz\>" are files required by Docker to build images. The shell scripts provide examples of docker commands that will build the images from the Dockerfiles.

## Installing Docker
These scripts require Docker to be pre-installed. To get started, visit: https://www.docker.com/get-docker

## Available MIRICLE Docker images
These scripts provide 4 different MIRICLE Docker images:
- stable : installs the current stable build of MIRICLE.
- test : installs the "test" build of MIRICLE, used for testing of upcoming releases.
- devel : installs the latest "developer" build of MIRICLE, used in development.
- prep : installs requirements for MIRICLE, and downloads MIRICLE install script; used for debugging install script and for interactive / custom installs.

## How Docker works
The scripts provided here can be used to create a so-called Docker "image", which in these case will represent a template version of a Unix-machine with MIRICLE pre-installed, together with its key dependencies (Anaconda, gcc, etc.).

Once a Docker image has been built, you can create as many instances (so-called Docker "containers") of this pre-build machine to use for running the MIRICLE software.

## Building a MIRICLE Docker image
To get started:

1. Ensure Docker is installed and running (ensure it has 4-8GB of RAM allocated, to run MIRI simulations)
2. Download / clone this repo
3. Open a terminal, and change directory to local repo
4. To build e.g. the "stable" MIRICLE image, run:

`build_miricle_stable.sh`

Ensure the script has been made executable (`chmod 755 build_miricle_stable.sh`), or alternatively run `sh build_miricle_stable.sh`.

## Running a MIRICLE Docker container
A simple example to launch an instance of the MIRICLE "stable" image:

`docker run -it --rm miriec/miricle_stable /bin/bash`

Example to launch an instance of MIRICLE "test" image, while creating a link between a "scratch" directory on host machine, and the "simulations" path inside the Docker container. By default, simulations run within the Docker container will store output under the "/root/simulations" path, and the link will ensure that those simulations are available on the host machine, and will persist even after the container is removed.

`docker run -it --rm -v <absolute_path_to_local_scratch_directory>:/root/simulations miriec/miricle_test /bin/bash`

Example to launch an instance of MIRICLE "devel" image, while creating a link between local repository checkouts and the "repos" path inside the Docker container. This can be used by developers to e.g. install a custom revision into conda / MIRICLE.

`docker run -it --rm -v <absolute_path_to_local_repositories>:/root/repos miriec/miricle_devel /bin/bash`

## Building and running a specific version of MIRICLE
By default, the build scripts will install the latest available version of MIRICLE. To build and run a specific version, e.g. 30, of MIRICLE:

1. `build_miricle_test.sh 30`
2. `docker run -it --rm miriec/miricle_stable:30 /bin/bash`

To find available versions:
- Linux: [Stable](http://www.miricle.org/jenkins/job/Build%20Stable/), [Test](http://www.miricle.org/jenkins/job/Build%20Test/), [Devel](http://www.miricle.org/jenkins/job/Build%20Devel/)
- Mac: [Stable](http://www.miricle.org/jenkins/job/Build%20Stable%20Mac/), [Test](http://www.miricle.org/jenkins/job/Build%20Test%20Mac/), [Devel](http://www.miricle.org/jenkins/job/Build%20Devel%20Mac/)

## Useful Docker commands
Command line help:

`docker help`

To check which Docker images are available on your system:

`docker images`

To check which Docker containers are running/stopped:

`docker ps -a`

To remove a stopped container:

`docker rm <id_of_container>`

To remove an image:

`docker rmi <id_of_image>`

To remove unused data from Docker cache (unused images, containers, volumes, networks):

`docker system prune`