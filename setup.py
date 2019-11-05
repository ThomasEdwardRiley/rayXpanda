"""
To compile to C code, and then compile the C code and link libraries:
    --> python setup.py install [--user]

If compiling and linking with gcc:
        --> CC=gcc python setup.py install [--user]

If compiling and linking with Intel icc:
    --> LDSHARED="icc -shared" CC=icc python setup.py install [--user]
"""

import os

from setuptools import setup, Extension

if __name__ == '__main__':
    import sys
    OS = sys.platform
    import os

    if 'darwin' in OS or 'linux' in OS:
        print('Operating system: ' + OS)

        try:
            if 'gcc' in os.environ['CC']:
                extra_compile_args=['-march=native',
                                    '-O3']
            elif 'icc' in os.environ['CC']:
                extra_compile_args=['-O3',
                                    '-xHOST',
                                    '-axCORE-AVX2,AVX']
        except KeyError:
            print('Export CC environment variable to "icc" or "gcc", or '
                  'modify the setup script for a bespoke compiler.')
            raise
    else:
        print('Unsupported operating system. Manually inspect and modify '
              'setup script.')
        raise Exception

    cmdclass = {}

    try:
        import Cython
        print('Cython.__version__ == %s' % Cython.__version__)
        from Cython.Distutils import build_ext
    except ImportError:
        print('Cannot use Cython. Trying to build extension from C files...')
        try:
            from distutils.command import build_ext
        except ImportError:
            print('Cannot import build_ext from distutils...')
            raise
        else:
            cmdclass['build_ext'] = build_ext
            file_extension = '.c'
    else:
        print('Using Cython to build extension from .pyx files...')
        file_extension = '.pyx'
        cmdclass['build_ext'] = build_ext

    def EXTENSION(modname):

        pathname = modname.replace('.', os.path.sep)

        return Extension(modname,
                         [pathname + file_extension],
                         language = 'c',
                         libraries = None,
                         library_dirs = None,
                         include_dirs = None,
                         extra_compile_args = extra_compile_args,
                         extra_link_args = None)

    modnames = ['rayXpanda.deflection', 'rayXpanda.inversion']
    extensions = []

    for mod in modnames:
        extensions.append(EXTENSION(mod))

    for e in extensions:
        e.cython_directives = {"embedsignature": True}

    setup(
        name = 'rayXpanda',
        version = '0.1',
        author = 'Thomas Edward Riley',
        author_email = 'T.E.Riley@uva.nl; t.riley.phd@gmail.com',
        url = 'https://github.com/ThomasEdwardRiley/rayXpanda',
        license = 'MIT',
        description = """Schwarzschild null geodesic expansion to high-order.""",
        long_description = open('README.rst').read(),
        packages = ['rayXpanda'],
        setup_requires = ['cython'],
        package_data = {'': ['README.rst', 'LICENSE', 'CITATION']},
        include_package_data = True,
        ext_modules = extensions,
        cmdclass = cmdclass,
        classifiers = ['Development Status :: 3 - Alpha',
                       'Intended Audience :: Science/Research',
                       'Operating System :: macOS, Linux',
                       'License :: OSI Approved :: MIT License',
                       'Programming Language :: Python'],
        zip_safe = False,
    )

else:
    pass

