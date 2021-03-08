jwty-mcjwt-face
================

|build-status| |code coverage| |codacy| |MIT license|

.. |build-status| image:: https://travis-ci.com/pladdy/jwty-mcjwt-face.svg?branch=master
    :alt: build status
    :scale: 100%
    :target: https://travis-ci.com/pladdy/jwty-mcjwt-face

.. |code coverage| image:: https://codecov.io/gh/pladdy/jwty-mcjwt-face/branch/master/graph/badge.svg
  :alt: code coverage
  :scale: 100%
  :target: https://codecov.io/gh/pladdy/jwty-mcjwt-face

.. |codacy| image:: https://app.codacy.com/project/badge/Grade/<fix me with codacy link>´
  :alt: codacy
  :scale: 100%
  :target: https://www.codacy.com/manual/pladdy/jwty-mcjwt-face?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=pladdy/jwty-mcjwt-face&amp;utm_campaign=Badge_Grade

.. |MIT license| image:: https://img.shields.io/badge/License-MIT-blue.svg
  :alt: MIT license
  :scale: 100%
  :target: https://lbesson.mit-license.org/

This project is an excuse to play with Falcon and pyjwt.

The keys in the repo are generated with ``make keys`` and are useless.

Installation
------------

``make install``

Dependencies
~~~~~~~~~~~~

- `Falcon <https://falcon.readthedocs.io/en/stable/index.html>`_
- `Gunicorn <https://gunicorn.org/>`_
- `PyJWT <https://pyjwt.readthedocs.io/en/latest/>`_

Usage
-----

.. code-block:: shell

  make keys
  make run-local
  # in another terminal

  make a-jwt
  # copy this jwt that gets printed out
  curl -v localhost:8000/decode?jwt=<paste your jwt here>

References
----------

- `JWT Intro <https://jwt.io/introduction/>`_
- `Dredd Testing <https://github.com/apiaryio/dredd>`_

README
~~~~~~

- `PurpleBooth README Template <https://gist.github.com/PurpleBooth/109311bb0361f32d87a2>`_
- `Kickass README <https://medium.com/@meakaakka/a-beginners-guide-to-writing-a-kickass-readme-7ac01da88ab3>`_
- `Make a README <https://www.makeareadme.com/>`_
