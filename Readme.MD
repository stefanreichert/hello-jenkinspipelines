# Hello Jenkins Pipelines
This projekt is a simple example how to use _Jenkins Pipelines_ to build and containerize a project, having the 
infrastructure available as _Docker_ image as well. The project is based on _Java_/_SpringBoot_ and is packaged and 
containerized with _Docker_.

## Infrastructure
The infrastructure is located in the folder ``/build-env``. The ``Dockerfile`` describes the Jenkins base Docker image 
extended by _Maven_ and _Docker_ itself. _Maven_ is required to build the project, _Docker_ tooling is needed to build 
and push the _Docker_ image.

The ``docker-compose-yml`` bundles the custom Jenkins image with the standard _Docker_ registry and a web frontend for 
the registry.

## Project
The project itself is quite small, it just consists of a static page. To build the project, you may use 
``mvn clean verify``. This will build, test, package and, for convenience, bundle the project with it's dependencies 
in a single jar.

## Execution
### Run the infrastructure stuff
Simply execute ``docker-compose build`` to build the respective docker images and ``docker-compose up`` in the 
``/build-env`` folder. Hello _Jenkins_ at ``http://localhost:8081``. You need to setup your Jenkins, please do as
you're told ;)
### Create a Jenkins project
Create a _Multi-Branch Project_ on your Jenkins Build Server. Map the project to 
``github.com:stefanreichert/hello-jenkinspipelines.git`` (or any other project you like...). Your project will be 
build, the result will be pushed to your local _Docker_ registry at ``http://localhost:5000``. That's it basically...
### Watch the result
There is a registry UI deployed with the infrastructure. at ``http://localhost:8082`` you will find a web frontend
exposing your registry content. your buil results will show up here.

### Noteworthy
There will be state on your host machine...

