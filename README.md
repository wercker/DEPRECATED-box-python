# Python box

A [wercker box](http://devcenter.wercker.com/articles/boxes/) with python 2.7, 3.2, and 3.3 installed.
For all versions of python setuptools, wheel, pip and virtualenv are installed.

There are two steps by default added to the wercker.yml:

- `virtualenv` which sets up a python
[virtual environment](http://www.virtualenv.org/en/latest/). Which is common
practice in the python community. The virtual environment will also create/
enable some local caching for wercker.
- `pip-install`. This command by default tries to install the packages
specified in the `requirements.txt`. There are several options for this.
You can find more information in the [steps directory on wercker]("/#explore/steps")

By default wercker will try to use
[wheel](http://wheel.readthedocs.org/en/latest/). Wheel is a [built-package
format](http://www.python.org/dev/peps/pep-0427/) which can speed up the build
process. The wheel files are stored in your applications cache, which at this
moment is stored for about two weeks. It may be a good idea to clear this cache
every now and then.


## Usage

The following is the default [wercker.yml](http://devcenter.wercker.com/articles/werckeryml/) for python:

```yaml

box: wercker/python
services:
    # - wercker/postgresql # Don't forget to add your databases as a service

# Build definition
build:

  # The steps that will be executed on build
  steps:
    - virtualenv:
        name: setup virtual environment
        install_wheel: true # Enable wheel to speed up builds (experimental)

    - pip-install:
        requirements_file: "requirements.txt" # Optional argument.

    # A custom script step, name value is used in the UI
    # and the code value contains the command that get executed
    - script:
        name: echo python information
        code: |
          echo "python version $(python --version) running"
          echo "pip version $(pip --version) running"
          pip freeze
```

For guides on how to use
[python on wercker](http://devcenter.wercker.com/articles/languages/python.html),
see our [devcenter](http://devcenter.wercker.com). We also have guides:

* [Getting started with Flask](http://devcenter.wercker.com/articles/languages/python/flask.html)
* [Getting started with Flask and redis](http://devcenter.wercker.com/articles/languages/python/flaskredis.html)
* [Getting started with Django and Postgres](http://devcenter.wercker.com/articles/languages/python/django-postgres.html)
* And a small blog post on [how to deploy to pypi](http://blog.wercker.com/2013/06/28/Deploying-to-pypi.html).

# Changelog

