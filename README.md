Summit
======

This bunch of cool cats got together to form a little group called __The Summit__:

* Sinatra
* Docker
* MariaDB
* Git
* Alpine
* Thin


Summary
-------

Summit is a Docker container for a Sinatra-based web app running Ruby 2.3 on top of Thin.
It downloads a Git repository and installs any bundled dependencies in a Gemfile.

It's built on top of Alpine linux so it's small. An equivalent Ubuntu build was
over twice the size. The current version comes with MariaDB preinstalled. In a future revision, you'll be able to define a list of additional Alpine packages to install. At that point MariaDB may instead become an optional install.

Usage
-----

### Environment variables
Pass the following environment variables when instantiating the docker container:

#### SSH_KEY
Base64 encoded SSH private key used to connect to your Git repository.

#### GIT_REPO
The URL of the git repository.

#### GIT_BRANCH
The branch to use (defaults to master if not passed).

### Git repository
Your repository must include a `config.ru` file in the root of the project. You may also include a `Gemfile` or `Gemfile.lock` to install any Ruby dependencies.
