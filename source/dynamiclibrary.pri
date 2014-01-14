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
QMAKE_LFLAGS += -Wl,--no-undefined
