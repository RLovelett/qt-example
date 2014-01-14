exists(platform.pri) {
  include(platform.pri)
}
else {
  exists(../platform.pri) {
    include(../platform.pri)
  }
  else {
    exists(../../platform.pri) {
      include(../../platform.pri)
    }
    else {
      exists(../../../platform.pri) {
        include(../../../platform.pri)
      }
      else {
        exists(../../../platform.pri) {
          include(../../../platform.pri)
        }
        else {
          message ("ERROR: Could not find platform.pri")
        }
      }
    }
  }
}

TEMPLATE = lib
CONFIG += dll
CONFIG -= staticlib

# For cross compiling
linux-g++:QMAKE_TARGET.arch = $$QMAKE_HOST.arch
linux-g++-32:QMAKE_TARGET.arch = x86
linux-g++-64:QMAKE_TARGET.arch = x86_64

contains(QMAKE_TARGET.arch, x86) {
  target.path = /lib
} else {
  target.path = /lib64
}

INSTALLS += target
