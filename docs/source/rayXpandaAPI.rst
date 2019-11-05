.. _api:

rayXpanda API
=============

Deflection
----------

.. autofunction:: rayXpanda.deflection.deflect

Inversion
---------

.. autofunction:: rayXpanda.inversion.invert

Vectorised
----------

Pass *contiguous* :class:`numpy.ndarray` objects for the
``__Pyx_memviewslice`` arguments.

.. autofunction:: rayXpanda.deflection.deflect_vec

.. autofunction:: rayXpanda.inversion.invert_vec
