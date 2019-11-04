""" Schwarzschild null geodesic expansion to high-order."""
from __future__ import print_function
__version__ = "0.1"
__author__ = "Thomas E. Riley"

try:
    __RAYXPANDA_SETUP__
except NameError:
    __RAYXPANDA_SETUP__ = False

if not __RAYXPANDA_SETUP__:

    import six as _six

    vstring = "Version: %s" % __version__
    name = "  rayXpanda  "
    print("/" + "="*(len(name)+4) + "\\")
    print("| " + name.center(len(name)+2) + " |")
    print("|" + "-"*(len(name)+4) + "|")
    print("| " + vstring.center(len(name)+2) + " |")
    print("\\" + "="*(len(name)+4) + "/\n")

    from . import deflection, inversion
