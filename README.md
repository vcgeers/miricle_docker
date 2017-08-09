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

To get started, download / clone this repo, open a terminal, and change directory to your local repo. 

To build e.g. the "stable" MIRICLE image, run:
`build_miricle_stable.sh`

Ensure the script has been made executable (`chmod 755 build_miricle_stable.sh`), or alternatively run `sh build_miricle_stable.sh`.

## Running a MIRICLE Docker container from a pre-built image
`docker run -it --rm miriec/miricle_test /bin/bash`

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
