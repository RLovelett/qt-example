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

TEMPLATE = app
