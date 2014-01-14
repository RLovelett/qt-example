#!/usr/bin/bash -e

# Setup RPM build directories
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
export VERSION_BUILD=1

echo -- Major $VERSION_MAJOR
echo -- Minor $VERSION_MINOR
echo -- Revision $VERSION_REVISION
echo -- Build $VERSION_BUILD

# Create a source archive

# Copy artifacts
#ARCHIVE=$(find `pwd` -name 'pioneer-*-src.tar.bz2' -type f | head -1)
#SPEC=$(find `pwd` -name 'pioneer4.spec' -type f | head -1)
#cp $ARCHIVE $WORKSPACE/SOURCES
#cp $SPEC $WORKSPACE/SPECS

# Change to workspace
#cd $WORKSPACE

# Make RPM
#rpmbuild --define "_topdir ${WORKSPACE}" -bb -vv $WORKSPACE/SPECS/pioneer4.spec
