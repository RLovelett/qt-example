include(../../application.pri)

INCLUDEPATH += $$PRJROOT \
               $$PRJROOT/libraries/math

LIBS += -L$$LIBDIR \
        -lmath

SOURCES += first.cpp

# Installation configuration
#target.path = /tmp/usr/local/bin
#INSTALLS += target
