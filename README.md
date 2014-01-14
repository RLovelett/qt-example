# Configure, Build, Install and Package Using QMake

This is an example project to show how to use `qmake` and `rpmbuild` to
make a rpm file.

## Testing

Before running the build using `rpmbuild` you should make sure that the
sources will properly compile on your platform. To do that change the
current working directory to `source`. Then execute the following
commands:

    BITS=$(getconf LONG_BIT)
    export QMAKESPEC=linux-g++-$BITS
    export QTDIR=/opt/qt$BITS-static/4.8.5
    export PATH=$QTDIR/bin:$PATH
    git clean -fdx
    qmake -r
    make -f Makefile.$MAKESPEC all

These commands should run and execute successfully. If they have inside
of the `build/$QMAKESPEC/bin/release` directory you should find two
executables `first` and `second`.

## Generate a source package

## Build rpm package(s)
