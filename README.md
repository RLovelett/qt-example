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
    make -f Makefile.$QMAKESPEC
    INSTALL_ROOT=$(pwd)/../build/$QMAKESPEC make -f Makefile.$QMAKESPEC install

These commands should run and execute successfully. If they have, inside
of the `build/$QMAKESPEC/bin` directory you should find two executables
`first` and `second`.

## Generate a source package

If the testing section works as expected than the next step is to
generate the source package that will be read by `rpmbuild`. An example
of how to do this is given below.

    git archive --format=tar HEAD | gzip > qt-example-${VERSION_SHORT}-src.tar.gz

The environment variable `VERSION_SHORT` should contain some sort of
short unique identifying version information.

## Build rpm package(s)

The last step is to run `rpmbuild` using the provided spec file and the
newly created source archive.

    rpmbuild -ba qt-example*.spec

In general
    
etup RPM build directories
export WORKSPACE=$(mktemp -d)
mkdir -p $WORKSPACE/{BUILD,RPMS,SOURCES,SPECS,SRPMS,tmp}
echo Working in $WORKSPACE

echo Setting up a Qt environment...

export BITS=$(getconf LONG_BIT)
export QMAKESPEC=linux-g++-$BITS
export QTDIR=/opt/qt$BITS-static/4.8.5
export PATH=$QTDIR/bin:$PATH

echo -- QTDIR set to "$QTDIR"
echo -- QMAKESPEC set to "$QMAKESPEC"
echo -- PATH set to "$PATH"

# Parse and extract the current Pioneer version information
export VERSION_MAJOR=1
export VERSION_MINOR=0
export VERSION_REVISION=20
export VERSION_BUILD=$(git log --pretty=format:'%h' -n 1)
export
VERSION_SHORT=${VERSION_MAJOR}${VERSION_MINOR}${VERSION_REVISION}${VERSION_BUILD}
export
VERSION_LONG=${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_REVISION}.${VERSION_BUILD}

echo -- Major $VERSION_MAJOR
echo -- Minor $VERSION_MINOR
echo -- Revision $VERSION_REVISION
echo -- Build $VERSION_BUILD

# Create a source archive
git archive --format=tar HEAD | gzip > qt-example-${VERSION_SHORT}-src.tar.gz

# Copy artifacts
ARCHIVE=$(find `pwd` -name 'qt-example-*-src.tar.gz' -type f | head -1)
SPEC=$(find `pwd` -name 'qt-example.spec' -type f | head -1)
cp $ARCHIVE $WORKSPACE/SOURCES
cp $SPEC $WORKSPACE/SPECS

# Change to workspace
cd $WORKSPACE

# Make RPM
rpmbuild --define "_topdir ${WORKSPACE}" -bb -vv $WORKSPACE/SPECS/qt-example*.spec


## Example start to finish
