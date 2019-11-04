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

    CC=gcc python setup.py install [--user]

You require Cython to compile to C, and then the extensions will be compiled.
