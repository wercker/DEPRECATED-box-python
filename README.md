# Python box

A [wercker box](http://devcenter.wercker.com/articles/boxes/) with python 2.7
and 3.2 installed. For both versions of python setuptools, wheel, pip and
virtualenv are installed.

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

# What's new

- Python 3.2 added
- pip updated to 1.4.1
- setuptools updated
- wheels installed

# License

The MIT License (MIT)

Copyright (c) 2013 wercker

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Changelog
## 0.0.10
- switch for default pip (python 2.7 one or 3.2)

## 0.0.9
- Python 3.2 added by default
- pip updated to 1.4.1
- setuptools updated to latest version 1.3.1
- default wercker.yaml template updated

## 0.0.8

- Update web-essentials to 0.0.12 (pgdg-keyring update)

## 0.0.7

- Update [`web-essentials`](https://app.wercker.com/#applications/51ab0c42df8960ba45003fd9/tab/details) to 0.0.11

## 0.0.5

- Lock apt cookbook to 1.8.2
- Update readme

## 0.0.4

- Initial release
