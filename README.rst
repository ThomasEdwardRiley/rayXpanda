.. _readme:

**************************************************************
rayXpanda: Schwarzschild null geodesic expansion to high-order
**************************************************************


The rayXpanda extension modules supply compiled functions for fast
approximation of several null geodesic properties in the Schwarzschild
spacetime, *without* need for numerical integration or interpolation or any
external numerical libraries for that matter. These routines can thus be used
to verify numerical integration due to the orthogonality. Alternatively, these
routines can be called directly by a given application in place of calls to
other library functions for null geodesic computation.


Install
=======

Run the ``setup.py`` script::

    CC=<compiler> python setup.py install [--user]

You require Cython to compile to C, and then the extensions will be compiled.
For example, set ``CC=gcc`` for GNU or ``CC=icc`` for Intel, depending on
your system.

.. _sphinx: http://www.sphinx-doc.org/en/master

To compile the documentation you require a `sphinx`_ installation::

    cd rayXpanda/docs; make html

You may then view the documentation in a browser. The files may be found in::

    rayXpanda/docs/build/html

